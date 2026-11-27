-- =============================================================================
-- Sabaq — 0001_content_core
-- Kontent bazasi: rollar, manbalar, lug'at, grammatika, matnlar, savollar,
-- izohlar, tarjimalar, yozish topshiriqlari, versiyalar va tekshiruv tarixi.
--
-- Asosiy qoidalar (DB darajasida majburiy):
--   * Status oqimi: draft -> reviewed -> verified.
--   * `verified` faqat `korean_expert` rolidagi profil orqali beriladi.
--     AI yaratgan kontent ham shu qoidaga bo'ysunadi (avtomatik verified yo'q).
--   * Kontent o'zgarsa (checksum), versiya +1, status `draft` ga tushadi.
--   * Har bir versiya `content_revisions` ga, har bir status o'tishi
--     `content_reviews` ga yoziladi.
--   * Har bir kontent yozuvi manbaga (`sources`) bog'langan. Litsenziyasi
--     `granted` bo'lmagan manba kontenti o'quvchilarga ko'rinmaydi.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Enumlar
-- -----------------------------------------------------------------------------
create type public.app_role as enum ('learner', 'editor', 'korean_expert', 'admin');
create type public.content_status as enum ('draft', 'reviewed', 'verified');
create type public.authored_by as enum ('human', 'ai');
create type public.source_kind as enum (
  'original_content',      -- Sabaq jamoasi yaratgan original kontent
  'original_recording',    -- Sabaq uchun yozilgan native audio
  'licensed_third_party',  -- ruxsat asosida ishlatiladigan tashqi manba
  'official_reference',    -- rasmiy manbaga havola (kontent ko'chirilmaydi)
  'third_party_link'       -- tashqi manbaga havola (kontent ko'chirilmaydi)
);
create type public.license_status as enum ('not_requested', 'pending', 'granted', 'denied', 'revoked');
create type public.exam_section as enum ('listening', 'reading', 'writing');
create type public.part_of_speech as enum (
  'noun', 'dependent_noun', 'pronoun', 'numeral', 'verb', 'adjective', 'adverb',
  'determiner', 'particle', 'interjection', 'affix', 'expression'
);
create type public.passage_kind as enum (
  'dialogue', 'monologue', 'lecture', 'interview', 'discussion', 'news',
  'announcement', 'text', 'notice', 'advertisement', 'graph', 'letter', 'editorial'
);
create type public.grammar_relation_kind as enum ('similar', 'contrast', 'prerequisite');

-- -----------------------------------------------------------------------------
-- Profillar va rollar
-- -----------------------------------------------------------------------------
create table public.profiles (
  id           uuid primary key references auth.users (id) on delete cascade,
  display_name text,
  role         public.app_role not null default 'learner',
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);

comment on table public.profiles is
  'Foydalanuvchi profili va roli. Rolni faqat admin (yoki service role) o''zgartira oladi.';

create or replace function public.current_app_role()
returns public.app_role
language sql
stable
security definer
set search_path = public
as $$
  select coalesce(
    (select p.role from public.profiles p where p.id = auth.uid()),
    'learner'::public.app_role
  );
$$;

create or replace function public.has_role(variadic roles public.app_role[])
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select public.current_app_role() = any (roles);
$$;

create or replace function public.profile_has_role(profile_id uuid, variadic roles public.app_role[])
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.profiles p where p.id = profile_id and p.role = any (roles)
  );
$$;

create or replace function public.touch_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at := now();
  return new;
end;
$$;

create or replace function public.guard_profile_role()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  -- auth.uid() bo'sh bo'lsa: service role yoki migration — ruxsat etiladi.
  if new.role is distinct from old.role
     and auth.uid() is not null
     and not public.has_role('admin') then
    raise exception 'Rolni faqat admin o''zgartira oladi'
      using errcode = '42501';
  end if;
  return new;
end;
$$;

create trigger profiles_touch before update on public.profiles
  for each row execute function public.touch_updated_at();
create trigger profiles_guard_role before update on public.profiles
  for each row execute function public.guard_profile_role();

-- Yangi foydalanuvchi ro'yxatdan o'tganda profil avtomatik yaratiladi.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, display_name)
  values (new.id, coalesce(new.raw_user_meta_data ->> 'display_name', null))
  on conflict (id) do nothing;
  return new;
end;
$$;

create trigger on_auth_user_created after insert on auth.users
  for each row execute function public.handle_new_user();

alter table public.profiles enable row level security;

create policy profiles_select on public.profiles for select to authenticated
  using (id = auth.uid() or public.has_role('admin'));
create policy profiles_update_self on public.profiles for update to authenticated
  using (id = auth.uid() or public.has_role('admin'))
  with check (id = auth.uid() or public.has_role('admin'));

-- -----------------------------------------------------------------------------
-- Manbalar va litsenziyalar
-- -----------------------------------------------------------------------------
create table public.sources (
  id                     uuid primary key default gen_random_uuid(),
  key                    text not null unique,
  kind                   public.source_kind not null,
  name                   text not null,
  holder                 text,
  url                    text,
  license                text,
  commercial_use         boolean not null default false,
  redistribution_allowed boolean not null default false,
  attribution_required   boolean not null default false,
  attribution_text       text,
  proof_url              text,
  license_status         public.license_status not null default 'not_requested',
  license_expires_at     date,
  verified_by            uuid references public.profiles (id),
  verified_at            timestamptz,
  notes                  text,
  created_at             timestamptz not null default now(),
  updated_at             timestamptz not null default now(),

  constraint sources_attribution_text_required
    check (not attribution_required or nullif(btrim(attribution_text), '') is not null),
  -- Tashqi litsenziya va native yozuv shartnomasi uchun dalil majburiy.
  constraint sources_proof_required_when_granted
    check (
      license_status <> 'granted'
      or kind in ('original_content', 'official_reference', 'third_party_link')
      or nullif(btrim(proof_url), '') is not null
    ),
  -- Havola turidagi manbalardan kontent ko'chirilmaydi, shuning uchun
  -- ular hech qachon tijoriy/tarqatish huquqiga ega deb belgilanmaydi.
  constraint sources_link_only_no_rights
    check (
      kind not in ('official_reference', 'third_party_link')
      or (commercial_use = false and redistribution_allowed = false)
    )
);

comment on table public.sources is
  'Har bir kontent va audio manbasi, uning litsenziya shartlari va ruxsat dalili.';
comment on column public.sources.proof_url is
  'Ruxsat dalili. Shartnomalar yopiq `legal` bucket''ida saqlanadi (legal/...), ommaviy URL emas.';

create trigger sources_touch before update on public.sources
  for each row execute function public.touch_updated_at();

-- Manba ishlatishga yaroqlimi: litsenziya berilgan va muddati o'tmagan.
create or replace function public.source_is_usable(p_source_id uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.sources s
    where s.id = p_source_id
      and s.license_status = 'granted'
      and (s.license_expires_at is null or s.license_expires_at >= current_date)
  );
$$;

-- Sabaq'ning o'z original kontenti uchun tizim manbasi.
insert into public.sources (key, kind, name, holder, license, commercial_use,
                            redistribution_allowed, license_status, notes)
values ('SRC-SABAQ-ORIGINAL', 'original_content', 'Sabaq original kontenti', 'Sabaq',
        'Sabaq mulki', true, true, 'granted',
        'Sabaq jamoasi yaratgan original mashqlar, izohlar va tarjimalar.');

-- -----------------------------------------------------------------------------
-- Taksonomiya
-- -----------------------------------------------------------------------------
create table public.topics (
  id         uuid primary key default gen_random_uuid(),
  key        text not null unique,
  parent_id  uuid references public.topics (id) on delete set null,
  name_ko    text not null,
  name_uz    text not null,
  sort       integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.question_types (
  id                  uuid primary key default gen_random_uuid(),
  code                text not null,           -- masalan L-04-08, R-13-15, W-54
  exam_format_version text not null default 'topik2-pbt-2014',
  section             public.exam_section not null,
  number_from         smallint not null check (number_from between 1 and 54),
  number_to           smallint not null check (number_to between 1 and 54),
  name_ko             text not null,
  name_uz             text not null,
  points_per_item     smallint not null check (points_per_item > 0),
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),
  unique (code, exam_format_version),
  check (number_from <= number_to)
);

create trigger topics_touch before update on public.topics
  for each row execute function public.touch_updated_at();
create trigger question_types_touch before update on public.question_types
  for each row execute function public.touch_updated_at();

-- -----------------------------------------------------------------------------
-- Versiya va tekshiruv tarixi
-- -----------------------------------------------------------------------------
create table public.content_revisions (
  id           uuid primary key default gen_random_uuid(),
  entity_table text not null,
  entity_id    uuid not null,
  entity_key   text not null,
  version      integer not null,
  checksum     text not null,
  snapshot     jsonb not null,
  changed_by   uuid,
  change_note  text,
  created_at   timestamptz not null default now(),
  unique (entity_table, entity_id, version)
);

create index content_revisions_entity_idx on public.content_revisions (entity_table, entity_id);

create table public.content_reviews (
  id           uuid primary key default gen_random_uuid(),
  entity_table text not null,
  entity_id    uuid not null,
  entity_key   text not null,
  version      integer not null,
  from_status  public.content_status,
  to_status    public.content_status not null,
  actor_id     uuid,              -- o'zgarishni amalga oshirgan sessiya (auth.uid())
  reviewer_id  uuid,              -- reviewed_by yoki verified_by
  note         text,
  created_at   timestamptz not null default now()
);

create index content_reviews_entity_idx on public.content_reviews (entity_table, entity_id);

comment on table public.content_revisions is
  'Har bir kontent versiyasining to''liq snapshot''i. Izoh: set_config(''sabaq.change_note'', ...).';
comment on table public.content_reviews is
  'Status o''tishlari (draft/reviewed/verified) tarixi.';

-- -----------------------------------------------------------------------------
-- Umumiy kontent triggerlari
-- -----------------------------------------------------------------------------

-- Checksum'ga kirmaydigan meta ustunlar (va 0002 dagi audio huquq ustunlari).
create or replace function public.content_meta_columns()
returns text[]
language sql
immutable
as $$
  select array[
    'id', 'key', 'status', 'version', 'checksum',
    'reviewed_by', 'reviewed_at', 'verified_by', 'verified_at',
    'created_at', 'updated_at',
    -- audio huquqlari alohida o'q, kontent versiyasiga ta'sir qilmaydi
    'license', 'commercial_use', 'redistribution_allowed', 'attribution_required',
    'attribution_text', 'proof_url', 'rights_status', 'rights_verified_by',
    'rights_verified_at', 'rights_note'
  ];
$$;

create or replace function public.content_fingerprint(row_data jsonb)
returns text
language sql
immutable
as $$
  select md5((row_data - public.content_meta_columns())::text);
$$;

create or replace function public.content_before_write()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
begin
  new.updated_at := now();
  new.checksum := public.content_fingerprint(to_jsonb(new));

  if tg_op = 'INSERT' then
    new.version := 1;
  elsif new.checksum is distinct from old.checksum then
    -- Kontent o'zgardi: yangi versiya, tekshiruv qaytadan boshlanadi.
    new.version := old.version + 1;
    new.status := 'draft';
  else
    new.version := old.version;
  end if;

  -- Status bo'yicha maydonlarni tozalash
  if new.status = 'draft' then
    new.reviewed_by := null;
    new.reviewed_at := null;
    new.verified_by := null;
    new.verified_at := null;
  elsif new.status = 'reviewed' then
    new.verified_by := null;
    new.verified_at := null;
  end if;

  -- reviewed va verified uchun ko'rib chiqqan shaxs majburiy
  if new.status in ('reviewed', 'verified') then
    if new.reviewed_by is null then
      raise exception '% %: reviewed_by majburiy', tg_table_name, new.key
        using errcode = '23514';
    end if;
    if not public.profile_has_role(new.reviewed_by, 'editor', 'korean_expert', 'admin') then
      raise exception '% %: reviewed_by editor, korean_expert yoki admin bo''lishi kerak',
        tg_table_name, new.key using errcode = '42501';
    end if;
    if v_uid is not null
       and (tg_op = 'INSERT' or old.status = 'draft' or old.reviewed_by is distinct from new.reviewed_by)
       and new.reviewed_by <> v_uid then
      raise exception '% %: reviewed_by faqat joriy foydalanuvchi bo''lishi mumkin',
        tg_table_name, new.key using errcode = '42501';
    end if;
    new.reviewed_at := coalesce(new.reviewed_at, now());
  end if;

  -- verified faqat korean_expert orqali
  if new.status = 'verified' then
    if new.verified_by is null
       or not public.profile_has_role(new.verified_by, 'korean_expert') then
      raise exception '% %: verified faqat korean_expert tomonidan beriladi',
        tg_table_name, new.key using errcode = '42501';
    end if;
    if v_uid is not null
       and (tg_op = 'INSERT' or old.status <> 'verified' or old.verified_by is distinct from new.verified_by)
       and new.verified_by <> v_uid then
      raise exception '% %: verified_by faqat joriy foydalanuvchi bo''lishi mumkin',
        tg_table_name, new.key using errcode = '42501';
    end if;
    new.verified_at := coalesce(new.verified_at, now());
  end if;

  return new;
end;
$$;

create or replace function public.content_after_write()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_note text := nullif(current_setting('sabaq.change_note', true), '');
begin
  if tg_op = 'INSERT' or new.version <> old.version then
    insert into public.content_revisions
      (entity_table, entity_id, entity_key, version, checksum, snapshot, changed_by, change_note)
    values
      (tg_table_name, new.id, new.key, new.version, new.checksum, to_jsonb(new), auth.uid(), v_note);
  end if;

  if tg_op = 'INSERT' or new.status is distinct from old.status then
    insert into public.content_reviews
      (entity_table, entity_id, entity_key, version, from_status, to_status,
       actor_id, reviewer_id, note)
    values
      (tg_table_name, new.id, new.key, new.version,
       case when tg_op = 'INSERT' then null else old.status end,
       new.status, auth.uid(),
       case new.status when 'verified' then new.verified_by
                       when 'reviewed' then new.reviewed_by end,
       v_note);
  end if;

  return null;
end;
$$;

-- Polimorf bog'lanishlarni tozalash (0002 da audio_links bilan kengaytiriladi).
create or replace function public.cleanup_polymorphic()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  delete from public.translations
  where entity_table = tg_table_name and entity_id = old.id;
  return old;
end;
$$;

-- O'quvchiga ko'rinadimi: reviewed/verified va manba yaroqli.
create or replace function public.is_published(p_status public.content_status, p_source_id uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select p_status in ('reviewed', 'verified') and public.source_is_usable(p_source_id);
$$;

-- -----------------------------------------------------------------------------
-- Kontent jadvallari
-- Har birida umumiy ustunlar: id, key, status, version, checksum, source_id,
-- authored_by, reviewed_by/at, verified_by/at, created_at, updated_at.
-- -----------------------------------------------------------------------------

-- Lug'at --------------------------------------------------------------------
create table public.vocab_entries (
  id          uuid primary key default gen_random_uuid(),
  key         text not null unique,
  status      public.content_status not null default 'draft',
  version     integer not null default 1,
  checksum    text,
  source_id   uuid not null references public.sources (id),
  authored_by public.authored_by not null default 'human',
  reviewed_by uuid references public.profiles (id),
  reviewed_at timestamptz,
  verified_by uuid references public.profiles (id),
  verified_at timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),

  term        text not null,
  hanja       text,
  pos         public.part_of_speech,
  sense_no    smallint not null default 1 check (sense_no > 0),
  level       smallint check (level between 3 and 6),
  topic_id    uuid references public.topics (id) on delete set null,
  constraint vocab_entries_term_unique unique nulls not distinct (term, pos, sense_no)
);

create table public.vocab_examples (
  id          uuid primary key default gen_random_uuid(),
  key         text not null unique,
  status      public.content_status not null default 'draft',
  version     integer not null default 1,
  checksum    text,
  source_id   uuid not null references public.sources (id),
  authored_by public.authored_by not null default 'human',
  reviewed_by uuid references public.profiles (id),
  reviewed_at timestamptz,
  verified_by uuid references public.profiles (id),
  verified_at timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),

  entry_id    uuid not null references public.vocab_entries (id) on delete cascade,
  sentence_ko text not null,
  sort        smallint not null default 0
);

-- Grammatika ----------------------------------------------------------------
create table public.grammar_points (
  id          uuid primary key default gen_random_uuid(),
  key         text not null unique,
  status      public.content_status not null default 'draft',
  version     integer not null default 1,
  checksum    text,
  source_id   uuid not null references public.sources (id),
  authored_by public.authored_by not null default 'human',
  reviewed_by uuid references public.profiles (id),
  reviewed_at timestamptz,
  verified_by uuid references public.profiles (id),
  verified_at timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),

  pattern     text not null,               -- -(으)면서
  formula     text not null,               -- V + -(으)면서
  level       smallint check (level between 3 and 6),
  category    text                         -- masalan: bog'lovchi, yakuniy, iqtibos
);

create table public.grammar_examples (
  id          uuid primary key default gen_random_uuid(),
  key         text not null unique,
  status      public.content_status not null default 'draft',
  version     integer not null default 1,
  checksum    text,
  source_id   uuid not null references public.sources (id),
  authored_by public.authored_by not null default 'human',
  reviewed_by uuid references public.profiles (id),
  reviewed_at timestamptz,
  verified_by uuid references public.profiles (id),
  verified_at timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),

  point_id    uuid not null references public.grammar_points (id) on delete cascade,
  sentence_ko text not null,
  sort        smallint not null default 0
);

create table public.grammar_relations (
  id            uuid primary key default gen_random_uuid(),
  key           text not null unique,
  status        public.content_status not null default 'draft',
  version       integer not null default 1,
  checksum      text,
  source_id     uuid not null references public.sources (id),
  authored_by   public.authored_by not null default 'human',
  reviewed_by   uuid references public.profiles (id),
  reviewed_at   timestamptz,
  verified_by   uuid references public.profiles (id),
  verified_at   timestamptz,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),

  from_point_id uuid not null references public.grammar_points (id) on delete cascade,
  to_point_id   uuid not null references public.grammar_points (id) on delete cascade,
  relation      public.grammar_relation_kind not null,
  unique (from_point_id, to_point_id, relation),
  check (from_point_id <> to_point_id)
);

-- Matnlar va transcriptlar ---------------------------------------------------
create table public.passages (
  id                  uuid primary key default gen_random_uuid(),
  key                 text not null unique,
  status              public.content_status not null default 'draft',
  version             integer not null default 1,
  checksum            text,
  source_id           uuid not null references public.sources (id),
  authored_by         public.authored_by not null default 'human',
  reviewed_by         uuid references public.profiles (id),
  reviewed_at         timestamptz,
  verified_by         uuid references public.profiles (id),
  verified_at         timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),

  section             public.exam_section not null check (section in ('listening', 'reading')),
  kind                public.passage_kind not null,
  title               text,
  body_ko             text not null,       -- o'qish matni yoki tinglash transcripti
  speakers            jsonb not null default '[]'::jsonb,
  level               smallint check (level between 3 and 6),
  topic_id            uuid references public.topics (id) on delete set null,
  exam_format_version text not null default 'topik2-pbt-2014',
  check (jsonb_typeof(speakers) = 'array')
);

-- Savollar ------------------------------------------------------------------
create table public.questions (
  id                  uuid primary key default gen_random_uuid(),
  key                 text not null unique,
  status              public.content_status not null default 'draft',
  version             integer not null default 1,
  checksum            text,
  source_id           uuid not null references public.sources (id),
  authored_by         public.authored_by not null default 'human',
  reviewed_by         uuid references public.profiles (id),
  reviewed_at         timestamptz,
  verified_by         uuid references public.profiles (id),
  verified_at         timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),

  section             public.exam_section not null check (section in ('listening', 'reading')),
  question_type_id    uuid not null references public.question_types (id),
  exam_format_version text not null default 'topik2-pbt-2014',
  number_slot         smallint check (number_slot between 1 and 50),
  level               smallint check (level between 3 and 6),
  passage_id          uuid references public.passages (id) on delete restrict,
  stem_ko             text not null,       -- ko'rsatma: 다음을 듣고 ... 고르십시오.
  prompt_ko           text,                -- bo'shliqli gap va h.k.
  points              smallint not null default 2 check (points > 0)
);

create table public.question_options (
  id          uuid primary key default gen_random_uuid(),
  key         text not null unique,
  status      public.content_status not null default 'draft',
  version     integer not null default 1,
  checksum    text,
  source_id   uuid not null references public.sources (id),
  authored_by public.authored_by not null default 'human',
  reviewed_by uuid references public.profiles (id),
  reviewed_at timestamptz,
  verified_by uuid references public.profiles (id),
  verified_at timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),

  question_id uuid not null references public.questions (id) on delete cascade,
  label       smallint not null check (label between 1 and 4),
  text_ko     text not null,
  is_correct  boolean not null default false,
  unique (question_id, label)
);

create table public.explanations (
  id          uuid primary key default gen_random_uuid(),
  key         text not null unique,
  status      public.content_status not null default 'draft',
  version     integer not null default 1,
  checksum    text,
  source_id   uuid not null references public.sources (id),
  authored_by public.authored_by not null default 'human',
  reviewed_by uuid references public.profiles (id),
  reviewed_at timestamptz,
  verified_by uuid references public.profiles (id),
  verified_at timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),

  question_id uuid not null references public.questions (id) on delete cascade,
  option_id   uuid references public.question_options (id) on delete cascade,
  locale      text not null default 'uz' check (locale ~ '^[a-z]{2}$'),
  body_md     text not null,
  constraint explanations_unique unique nulls not distinct (question_id, option_id, locale)
);

-- Tarjimalar (polimorf: istalgan kontent jadvalining matn maydoni) ------------
create table public.translations (
  id           uuid primary key default gen_random_uuid(),
  key          text not null unique,
  status       public.content_status not null default 'draft',
  version      integer not null default 1,
  checksum     text,
  source_id    uuid not null references public.sources (id),
  authored_by  public.authored_by not null default 'human',
  reviewed_by  uuid references public.profiles (id),
  reviewed_at  timestamptz,
  verified_by  uuid references public.profiles (id),
  verified_at  timestamptz,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now(),

  entity_table text not null check (entity_table in (
    'vocab_entries', 'vocab_examples', 'grammar_points', 'grammar_examples',
    'grammar_relations', 'passages', 'questions', 'question_options',
    'writing_tasks', 'rubric_criteria', 'model_answers', 'topics'
  )),
  entity_id    uuid not null,
  field        text not null,               -- meaning, sentence, explanation, ...
  locale       text not null default 'uz' check (locale ~ '^[a-z]{2}$'),
  text         text not null,
  unique (entity_table, entity_id, field, locale)
);

create index translations_entity_idx on public.translations (entity_table, entity_id);

-- Yozish (51–54) ------------------------------------------------------------
create table public.rubrics (
  id                  uuid primary key default gen_random_uuid(),
  key                 text not null unique,
  status              public.content_status not null default 'draft',
  version             integer not null default 1,
  checksum            text,
  source_id           uuid not null references public.sources (id),
  authored_by         public.authored_by not null default 'human',
  reviewed_by         uuid references public.profiles (id),
  reviewed_at         timestamptz,
  verified_by         uuid references public.profiles (id),
  verified_at         timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),

  task_no             smallint not null check (task_no between 51 and 54),
  name                text not null,
  max_points          smallint not null check (max_points > 0),
  exam_format_version text not null default 'topik2-pbt-2014'
);

create table public.rubric_criteria (
  id          uuid primary key default gen_random_uuid(),
  key         text not null unique,
  status      public.content_status not null default 'draft',
  version     integer not null default 1,
  checksum    text,
  source_id   uuid not null references public.sources (id),
  authored_by public.authored_by not null default 'human',
  reviewed_by uuid references public.profiles (id),
  reviewed_at timestamptz,
  verified_by uuid references public.profiles (id),
  verified_at timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),

  rubric_id   uuid not null references public.rubrics (id) on delete cascade,
  code        text not null,                -- content, structure, language
  name_ko     text not null,
  max_points  smallint not null check (max_points > 0),
  bands       jsonb not null default '[]'::jsonb,  -- ball darajalari tavsifi
  sort        smallint not null default 0,
  unique (rubric_id, code),
  check (jsonb_typeof(bands) = 'array')
);

create table public.writing_tasks (
  id                  uuid primary key default gen_random_uuid(),
  key                 text not null unique,
  status              public.content_status not null default 'draft',
  version             integer not null default 1,
  checksum            text,
  source_id           uuid not null references public.sources (id),
  authored_by         public.authored_by not null default 'human',
  reviewed_by         uuid references public.profiles (id),
  reviewed_at         timestamptz,
  verified_by         uuid references public.profiles (id),
  verified_at         timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),

  task_no             smallint not null check (task_no between 51 and 54),
  question_type_id    uuid references public.question_types (id),
  exam_format_version text not null default 'topik2-pbt-2014',
  level               smallint check (level between 3 and 6),
  prompt_ko           text not null,
  material            jsonb not null default '{}'::jsonb,   -- grafik/jadval ma'lumoti, bo'shliqli matn
  min_chars           integer check (min_chars >= 0),
  max_chars           integer check (max_chars >= 0),
  points              smallint not null check (points > 0),
  rubric_id           uuid references public.rubrics (id),
  check (min_chars is null or max_chars is null or min_chars <= max_chars)
);

create table public.model_answers (
  id               uuid primary key default gen_random_uuid(),
  key              text not null unique,
  status           public.content_status not null default 'draft',
  version          integer not null default 1,
  checksum         text,
  source_id        uuid not null references public.sources (id),
  authored_by      public.authored_by not null default 'human',
  reviewed_by      uuid references public.profiles (id),
  reviewed_at      timestamptz,
  verified_by      uuid references public.profiles (id),
  verified_at      timestamptz,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now(),

  writing_task_id  uuid not null references public.writing_tasks (id) on delete cascade,
  body_ko          text not null,
  char_count       integer generated always as (char_length(body_ko)) stored,
  target_score     smallint check (target_score >= 0)
);

-- To'plamlar va sinov imtihonlari --------------------------------------------
create table public.question_sets (
  id          uuid primary key default gen_random_uuid(),
  key         text not null unique,
  status      public.content_status not null default 'draft',
  version     integer not null default 1,
  checksum    text,
  source_id   uuid not null references public.sources (id),
  authored_by public.authored_by not null default 'human',
  reviewed_by uuid references public.profiles (id),
  reviewed_at timestamptz,
  verified_by uuid references public.profiles (id),
  verified_at timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),

  title       text not null,
  section     public.exam_section,
  level       smallint check (level between 3 and 6)
);

create table public.question_set_items (
  set_id      uuid not null references public.question_sets (id) on delete cascade,
  position    smallint not null check (position > 0),
  question_id uuid not null references public.questions (id) on delete restrict,
  primary key (set_id, position),
  unique (set_id, question_id)
);

create table public.mock_tests (
  id                  uuid primary key default gen_random_uuid(),
  key                 text not null unique,
  status              public.content_status not null default 'draft',
  version             integer not null default 1,
  checksum            text,
  source_id           uuid not null references public.sources (id),
  authored_by         public.authored_by not null default 'human',
  reviewed_by         uuid references public.profiles (id),
  reviewed_at         timestamptz,
  verified_by         uuid references public.profiles (id),
  verified_at         timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),

  title               text not null,
  exam_format_version text not null default 'topik2-pbt-2014'
);

create table public.mock_test_items (
  mock_test_id    uuid not null references public.mock_tests (id) on delete cascade,
  position        smallint not null check (position between 1 and 104),
  question_id     uuid references public.questions (id) on delete restrict,
  writing_task_id uuid references public.writing_tasks (id) on delete restrict,
  primary key (mock_test_id, position),
  check ((question_id is null) <> (writing_task_id is null))
);

-- -----------------------------------------------------------------------------
-- Savolni nashr qilish shartlari: 4 ta variant, aynan 1 ta to'g'ri javob,
-- savolning umumiy izohi mavjud.
-- -----------------------------------------------------------------------------
create or replace function public.guard_question_publishable()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_options int;
  v_correct int;
begin
  if new.status in ('reviewed', 'verified') then
    select count(*), count(*) filter (where is_correct)
      into v_options, v_correct
      from public.question_options where question_id = new.id;

    if v_options <> 4 or v_correct <> 1 then
      raise exception 'Savol %: 4 ta variant va aynan 1 ta to''g''ri javob kerak (hozir % / %)',
        new.key, v_options, v_correct using errcode = '23514';
    end if;

    if not exists (
      select 1 from public.explanations e
      where e.question_id = new.id and e.option_id is null
    ) then
      raise exception 'Savol %: umumiy izoh (explanation) majburiy', new.key
        using errcode = '23514';
    end if;
  end if;
  return new;
end;
$$;

-- `content_before_write` dan keyin ishlashi uchun nomi alifbo bo'yicha keyin.
create trigger questions_zz_publishable before insert or update on public.questions
  for each row execute function public.guard_question_publishable();

-- -----------------------------------------------------------------------------
-- Triggerlar va RLS: barcha kontent jadvallariga bir xil qo'llanadi
-- -----------------------------------------------------------------------------
do $$
declare
  t text;
  content_tables text[] := array[
    'vocab_entries', 'vocab_examples', 'grammar_points', 'grammar_examples',
    'grammar_relations', 'passages', 'questions', 'question_options',
    'explanations', 'translations', 'rubrics', 'rubric_criteria',
    'writing_tasks', 'model_answers', 'question_sets', 'mock_tests'
  ];
begin
  foreach t in array content_tables loop
    execute format(
      'create trigger %1$s_before_write before insert or update on public.%1$I
         for each row execute function public.content_before_write()', t);
    execute format(
      'create trigger %1$s_after_write after insert or update on public.%1$I
         for each row execute function public.content_after_write()', t);
    if t <> 'translations' then
      execute format(
        'create trigger %1$s_cleanup after delete on public.%1$I
           for each row execute function public.cleanup_polymorphic()', t);
    end if;

    execute format('alter table public.%I enable row level security', t);
    execute format(
      'create policy %1$s_select on public.%1$I for select to authenticated
         using (public.is_published(status, source_id)
                or public.has_role(''editor'', ''korean_expert'', ''admin''))', t);
    execute format(
      'create policy %1$s_insert on public.%1$I for insert to authenticated
         with check (public.has_role(''editor'', ''korean_expert'', ''admin''))', t);
    execute format(
      'create policy %1$s_update on public.%1$I for update to authenticated
         using (public.has_role(''editor'', ''korean_expert'', ''admin''))
         with check (public.has_role(''editor'', ''korean_expert'', ''admin''))', t);
    execute format(
      'create policy %1$s_delete on public.%1$I for delete to authenticated
         using (public.has_role(''admin''))', t);
  end loop;
end;
$$;

-- Yordamchi jadvallar RLS
alter table public.sources enable row level security;
create policy sources_select on public.sources for select to authenticated using (true);
create policy sources_write on public.sources for all to authenticated
  using (public.has_role('admin')) with check (public.has_role('admin'));

alter table public.topics enable row level security;
create policy topics_select on public.topics for select to authenticated using (true);
create policy topics_write on public.topics for all to authenticated
  using (public.has_role('editor', 'admin')) with check (public.has_role('editor', 'admin'));

alter table public.question_types enable row level security;
create policy question_types_select on public.question_types for select to authenticated using (true);
create policy question_types_write on public.question_types for all to authenticated
  using (public.has_role('admin')) with check (public.has_role('admin'));

alter table public.question_set_items enable row level security;
create policy question_set_items_select on public.question_set_items for select to authenticated using (true);
create policy question_set_items_write on public.question_set_items for all to authenticated
  using (public.has_role('editor', 'korean_expert', 'admin'))
  with check (public.has_role('editor', 'korean_expert', 'admin'));

alter table public.mock_test_items enable row level security;
create policy mock_test_items_select on public.mock_test_items for select to authenticated using (true);
create policy mock_test_items_write on public.mock_test_items for all to authenticated
  using (public.has_role('editor', 'korean_expert', 'admin'))
  with check (public.has_role('editor', 'korean_expert', 'admin'));

alter table public.content_revisions enable row level security;
create policy content_revisions_select on public.content_revisions for select to authenticated
  using (public.has_role('editor', 'korean_expert', 'admin'));

alter table public.content_reviews enable row level security;
create policy content_reviews_select on public.content_reviews for select to authenticated
  using (public.has_role('editor', 'korean_expert', 'admin'));
