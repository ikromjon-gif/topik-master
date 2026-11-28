-- =============================================================================
-- Sabaq — 0002_rights_and_audio
-- Audio fayllar, ularning huquqlari va native speaker'lar.
--
-- Ikki mustaqil o'q:
--   * Huquq  (rights_status): unverified | verified | revoked
--   * Sifat  (status):        draft | reviewed | verified
-- Audio foydalanuvchiga faqat `publishable_audio_assets` view'i orqali chiqadi.
-- Fayllar yopiq `audio` bucket'ida, faqat server signed URL beradi.
-- =============================================================================

create type public.audio_provider as enum ('native_recording', 'licensed_file', 'tts');
create type public.tts_provider as enum ('clova', 'google');
create type public.rights_status as enum ('unverified', 'verified', 'revoked');
create type public.audio_purpose as enum ('pronunciation', 'listening', 'example');
create type public.speaker_gender as enum ('female', 'male');

-- NIKL kabi manbalar: har bir fayl alohida litsenziyalanadi.
alter table public.sources
  add column per_item_proof_required boolean not null default false;

comment on column public.sources.per_item_proof_required is
  'true bo''lsa, shu manbaning har bir audio fayli o''z proof_url''iga ega bo''lishi shart (masalan NIKL individual multimedia litsenziyasi).';

-- -----------------------------------------------------------------------------
-- Native speaker'lar (shaxsiy ma'lumot — faqat admin)
-- -----------------------------------------------------------------------------
create table public.voice_talents (
  id                 uuid primary key default gen_random_uuid(),
  key                text not null unique,          -- VT-0001
  alias              text not null,                 -- ilovada ko'rinadigan taxallus
  gender             public.speaker_gender,
  age_band           text,                          -- 20s, 30s, ...
  dialect            text not null default 'standard',
  contract_source_id uuid not null references public.sources (id),
  legal_name         text,
  contact            text,
  notes              text,
  created_at         timestamptz not null default now(),
  updated_at         timestamptz not null default now()
);

comment on table public.voice_talents is
  'Ovoz yozgan native speaker''lar. contract_source_id — imzolangan ovoz huquqi shartnomasi (sources, kind = original_recording).';

create trigger voice_talents_touch before update on public.voice_talents
  for each row execute function public.touch_updated_at();

-- -----------------------------------------------------------------------------
-- Audio fayllar
-- Huquq ustunlari NULL bo'lsa, qiymat manbadan (sources) meros olinadi.
-- -----------------------------------------------------------------------------
create table public.audio_assets (
  id                     uuid primary key default gen_random_uuid(),
  key                    text not null unique,      -- AUD-000001
  status                 public.content_status not null default 'draft',
  version                integer not null default 1,
  checksum               text,
  source_id              uuid not null references public.sources (id),
  authored_by            public.authored_by not null default 'human',
  reviewed_by            uuid references public.profiles (id),
  reviewed_at            timestamptz,
  verified_by            uuid references public.profiles (id),
  verified_at            timestamptz,
  created_at             timestamptz not null default now(),
  updated_at             timestamptz not null default now(),

  -- Fayl
  storage_path           text not null unique,      -- audio/listening/SET-01/AUD-000001.mp3
  mime                   text not null check (mime like 'audio/%'),
  duration_ms            integer check (duration_ms > 0),
  file_checksum          text,                      -- faylning sha256 qiymati
  provider               public.audio_provider not null,
  tts_provider           public.tts_provider,
  tts_voice              text,
  tts_params             jsonb,

  -- Transcript bog'lanishi (eskirganini aniqlash uchun)
  transcript_passage_id  uuid references public.passages (id) on delete set null,
  transcript_version     integer,

  -- Huquqlar (NULL = manbadan meros)
  license                text,
  commercial_use         boolean,
  redistribution_allowed boolean,
  attribution_required   boolean,
  attribution_text       text,
  proof_url              text,
  rights_status          public.rights_status not null default 'unverified',
  rights_verified_by     uuid references public.profiles (id),
  rights_verified_at     timestamptz,
  rights_note            text,

  constraint audio_assets_tts_fields
    check ((provider = 'tts') = (tts_provider is not null)),
  constraint audio_assets_transcript_pair
    check ((transcript_passage_id is null) = (transcript_version is null))
);

create index audio_assets_source_idx on public.audio_assets (source_id);

comment on column public.audio_assets.storage_path is
  'Yopiq `audio` bucket ichidagi yo''l. To''g''ridan-to''g''ri ochiq havola berilmaydi.';

-- Huquq tekshiruvi: verified faqat admin orqali va dalil bilan.
create or replace function public.guard_audio_rights()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_uid uuid := auth.uid();
  v_src public.sources%rowtype;
  v_rights_changed boolean;
begin
  select * into v_src from public.sources where id = new.source_id;

  -- Huquq maydonlari o'zgarsa, oldingi tasdiq bekor bo'ladi.
  if tg_op = 'UPDATE' then
    v_rights_changed :=
         new.source_id              is distinct from old.source_id
      or new.license                is distinct from old.license
      or new.commercial_use         is distinct from old.commercial_use
      or new.redistribution_allowed is distinct from old.redistribution_allowed
      or new.attribution_required   is distinct from old.attribution_required
      or new.attribution_text       is distinct from old.attribution_text
      or new.proof_url              is distinct from old.proof_url
      or new.storage_path           is distinct from old.storage_path
      or new.file_checksum          is distinct from old.file_checksum;

    if v_rights_changed and old.rights_status = 'verified' and new.rights_status = 'verified'
       and new.rights_verified_at is not distinct from old.rights_verified_at then
      new.rights_status := 'unverified';
    end if;
  end if;

  if new.rights_status = 'verified' then
    if new.rights_verified_by is null
       or not public.profile_has_role(new.rights_verified_by, 'admin') then
      raise exception 'Audio %: huquqni faqat admin tasdiqlay oladi', new.key
        using errcode = '42501';
    end if;
    if v_uid is not null
       and (tg_op = 'INSERT' or old.rights_status <> 'verified'
            or old.rights_verified_by is distinct from new.rights_verified_by)
       and new.rights_verified_by <> v_uid then
      raise exception 'Audio %: rights_verified_by faqat joriy foydalanuvchi bo''lishi mumkin',
        new.key using errcode = '42501';
    end if;
    if nullif(btrim(coalesce(new.proof_url, v_src.proof_url)), '') is null then
      raise exception 'Audio %: huquqni tasdiqlash uchun proof_url majburiy', new.key
        using errcode = '23514';
    end if;
    if v_src.per_item_proof_required and nullif(btrim(new.proof_url), '') is null then
      raise exception 'Audio %: bu manba uchun har bir faylning o''z proof_url''i majburiy', new.key
        using errcode = '23514';
    end if;
    if coalesce(new.attribution_required, v_src.attribution_required)
       and nullif(btrim(coalesce(new.attribution_text, v_src.attribution_text)), '') is null then
      raise exception 'Audio %: attribution_text majburiy', new.key
        using errcode = '23514';
    end if;
    new.rights_verified_at := coalesce(new.rights_verified_at, now());
  elsif new.rights_status = 'unverified' then
    new.rights_verified_by := null;
    new.rights_verified_at := null;
  end if;

  return new;
end;
$$;

create trigger audio_assets_before_write before insert or update on public.audio_assets
  for each row execute function public.content_before_write();
create trigger audio_assets_rights before insert or update on public.audio_assets
  for each row execute function public.guard_audio_rights();
create trigger audio_assets_after_write after insert or update on public.audio_assets
  for each row execute function public.content_after_write();

-- -----------------------------------------------------------------------------
-- Ko'p ovozli dialoglar
-- -----------------------------------------------------------------------------
create table public.audio_asset_speakers (
  asset_id  uuid not null references public.audio_assets (id) on delete cascade,
  role      text not null,                          -- 남자, 여자, A, B
  talent_id uuid not null references public.voice_talents (id) on delete restrict,
  primary key (asset_id, role)
);

-- -----------------------------------------------------------------------------
-- Audio ↔ kontent bog'lanishi (bitta audio bir necha joyda ishlatilishi mumkin)
-- -----------------------------------------------------------------------------
create table public.audio_links (
  id           uuid primary key default gen_random_uuid(),
  asset_id     uuid not null references public.audio_assets (id) on delete cascade,
  entity_table text not null check (entity_table in (
    'vocab_entries', 'vocab_examples', 'grammar_examples', 'passages', 'questions'
  )),
  entity_id    uuid not null,
  purpose      public.audio_purpose not null,
  sort         smallint not null default 0,
  created_at   timestamptz not null default now(),
  unique (asset_id, entity_table, entity_id, purpose)
);

create index audio_links_entity_idx on public.audio_links (entity_table, entity_id);

create or replace function public.cleanup_polymorphic()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  delete from public.translations
  where entity_table = tg_table_name and entity_id = old.id;
  delete from public.audio_links
  where entity_table = tg_table_name and entity_id = old.id;
  return old;
end;
$$;

-- -----------------------------------------------------------------------------
-- Effektiv huquqlar va nashr qilinadigan audio
-- -----------------------------------------------------------------------------
create view public.audio_effective_rights
with (security_invoker = true)
as
select
  a.id                                                   as asset_id,
  a.key                                                  as asset_key,
  a.source_id,
  s.key                                                  as source_key,
  s.license_status                                       as source_license_status,
  s.license_expires_at                                   as source_license_expires_at,
  s.per_item_proof_required,
  coalesce(a.license, s.license)                         as license,
  coalesce(a.commercial_use, s.commercial_use)           as commercial_use,
  coalesce(a.redistribution_allowed, s.redistribution_allowed) as redistribution_allowed,
  coalesce(a.attribution_required, s.attribution_required)     as attribution_required,
  coalesce(a.attribution_text, s.attribution_text)       as attribution_text,
  coalesce(a.proof_url, s.proof_url)                     as proof_url,
  a.rights_status
from public.audio_assets a
join public.sources s on s.id = a.source_id;

comment on view public.audio_effective_rights is
  'Har bir audio uchun yakuniy huquqlar: asset qiymati, bo''lmasa manba qiymati. Faqat xodimlar uchun.';

-- O'quvchilar audio_assets jadvalini to'g'ridan-to'g'ri o'qiy olmaydi.
-- Bu view egasi huquqi bilan ishlaydi va faqat xavfsiz ustunlarni beradi
-- (proof_url va shartnomalar yo'q). Signed URL'ni server shu view orqali beradi.
-- Muhim: bu yerda audio_effective_rights (security_invoker) ishlatilmaydi —
-- ichma-ich invoker view RLS'ni o'quvchi nomidan tekshiradi va hech narsa
-- qaytarmaydi. Shuning uchun huquqlar shu yerda qayta hisoblanadi.
create view public.publishable_audio_assets
with (security_invoker = false)
as
with r as (
  select
    a.*,
    s.license_status                                             as src_license_status,
    s.license_expires_at                                         as src_license_expires_at,
    s.per_item_proof_required                                    as src_per_item_proof_required,
    coalesce(a.commercial_use, s.commercial_use)                 as eff_commercial_use,
    coalesce(a.redistribution_allowed, s.redistribution_allowed) as eff_redistribution_allowed,
    coalesce(a.attribution_required, s.attribution_required)     as eff_attribution_required,
    coalesce(a.attribution_text, s.attribution_text)             as eff_attribution_text,
    coalesce(a.proof_url, s.proof_url)                           as eff_proof_url
  from public.audio_assets a
  join public.sources s on s.id = a.source_id
)
select
  r.id,
  r.key,
  r.storage_path,
  r.mime,
  r.duration_ms,
  r.provider,
  r.status,
  r.version,
  r.transcript_passage_id,
  case when r.eff_attribution_required then r.eff_attribution_text end as attribution_text
from r
left join public.passages p on p.id = r.transcript_passage_id
where r.src_license_status = 'granted'
  and (r.src_license_expires_at is null or r.src_license_expires_at >= current_date)
  and r.rights_status = 'verified'
  and r.eff_commercial_use = true
  and r.eff_redistribution_allowed = true
  and nullif(btrim(r.eff_proof_url), '') is not null
  and (not r.src_per_item_proof_required or nullif(btrim(r.proof_url), '') is not null)
  and (not r.eff_attribution_required or nullif(btrim(r.eff_attribution_text), '') is not null)
  and r.status in ('reviewed', 'verified')
  and (r.transcript_passage_id is null or p.version = r.transcript_version);

comment on view public.publishable_audio_assets is
  'Foydalanuvchiga chiqarish mumkin bo''lgan audio. Barcha huquq va sifat shartlari shu yerda.';

revoke all on public.publishable_audio_assets from anon;
grant select on public.publishable_audio_assets to authenticated;
revoke all on public.audio_effective_rights from anon;

-- -----------------------------------------------------------------------------
-- RLS
-- -----------------------------------------------------------------------------
alter table public.audio_assets enable row level security;
create policy audio_assets_staff_select on public.audio_assets for select to authenticated
  using (public.has_role('editor', 'korean_expert', 'admin'));
create policy audio_assets_staff_insert on public.audio_assets for insert to authenticated
  with check (public.has_role('editor', 'korean_expert', 'admin'));
create policy audio_assets_staff_update on public.audio_assets for update to authenticated
  using (public.has_role('editor', 'korean_expert', 'admin'))
  with check (public.has_role('editor', 'korean_expert', 'admin'));
create policy audio_assets_admin_delete on public.audio_assets for delete to authenticated
  using (public.has_role('admin'));

alter table public.voice_talents enable row level security;
create policy voice_talents_admin on public.voice_talents for all to authenticated
  using (public.has_role('admin')) with check (public.has_role('admin'));

alter table public.audio_asset_speakers enable row level security;
create policy audio_asset_speakers_staff on public.audio_asset_speakers for all to authenticated
  using (public.has_role('editor', 'korean_expert', 'admin'))
  with check (public.has_role('editor', 'korean_expert', 'admin'));

alter table public.audio_links enable row level security;
create policy audio_links_select on public.audio_links for select to authenticated using (true);
create policy audio_links_write on public.audio_links for all to authenticated
  using (public.has_role('editor', 'korean_expert', 'admin'))
  with check (public.has_role('editor', 'korean_expert', 'admin'));

-- -----------------------------------------------------------------------------
-- Storage: ikkala bucket ham yopiq
-- -----------------------------------------------------------------------------
insert into storage.buckets (id, name, public)
values ('audio', 'audio', false),
       ('legal', 'legal', false)
on conflict (id) do update set public = false;

-- audio: xodimlar yuklaydi va o'qiydi; o'quvchilar faqat server bergan signed URL orqali.
create policy storage_audio_staff_select on storage.objects for select to authenticated
  using (bucket_id = 'audio' and public.has_role('editor', 'korean_expert', 'admin'));
create policy storage_audio_staff_insert on storage.objects for insert to authenticated
  with check (bucket_id = 'audio' and public.has_role('editor', 'korean_expert', 'admin'));
create policy storage_audio_staff_update on storage.objects for update to authenticated
  using (bucket_id = 'audio' and public.has_role('editor', 'korean_expert', 'admin'));
create policy storage_audio_admin_delete on storage.objects for delete to authenticated
  using (bucket_id = 'audio' and public.has_role('admin'));

-- legal: shartnomalar va ruxsat dalillari — faqat admin.
create policy storage_legal_admin on storage.objects for all to authenticated
  using (bucket_id = 'legal' and public.has_role('admin'))
  with check (bucket_id = 'legal' and public.has_role('admin'));
