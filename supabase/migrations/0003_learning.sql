-- =============================================================================
-- Sabaq — 0003_learning
-- 45 kunlik reja shablonlari (kontent) va foydalanuvchining o‘quv ma'lumotlari:
-- rejalar, bajarilgan topshiriqlar, o‘qish sessiyalari, test natijalari.
--
-- Maxfiylik: foydalanuvchi ma'lumotlarini faqat egasi o‘qiydi va yozadi
-- (xodimlar ham ko‘rmaydi). Reja shablonlari — kontent: 0001 dagi status
-- qoidalariga bo‘ysunadi (o‘quvchiga faqat reviewed/verified ko‘rinadi).
-- =============================================================================

create type public.learning_section as enum (
  'vocabulary', 'grammar', 'listening', 'reading', 'writing', 'mock'
);
create type public.user_plan_status as enum ('active', 'completed', 'abandoned');

-- Profil sozlamalari
alter table public.profiles
  add column target_level smallint not null default 4 check (target_level between 3 and 6),
  add column time_zone text not null default 'Asia/Seoul';

-- O‘z profilini yangilashda rol himoyasi 0001 dagi guard_profile_role orqali.

-- -----------------------------------------------------------------------------
-- Reja shablonlari (kontent)
-- -----------------------------------------------------------------------------
create table public.plan_templates (
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
  total_days          smallint not null check (total_days between 1 and 120),
  target_level        smallint not null check (target_level between 3 and 6),
  exam_format_version text not null default 'topik2-pbt-2014'
);

create table public.plan_template_tasks (
  id                uuid primary key default gen_random_uuid(),
  key               text not null unique,
  status            public.content_status not null default 'draft',
  version           integer not null default 1,
  checksum          text,
  source_id         uuid not null references public.sources (id),
  authored_by       public.authored_by not null default 'human',
  reviewed_by       uuid references public.profiles (id),
  reviewed_at       timestamptz,
  verified_by       uuid references public.profiles (id),
  verified_at       timestamptz,
  created_at        timestamptz not null default now(),
  updated_at        timestamptz not null default now(),

  template_id       uuid not null references public.plan_templates (id) on delete cascade,
  day               smallint not null check (day >= 1),
  position          smallint not null default 1 check (position >= 1),
  section           public.learning_section not null,
  title             text not null,
  title_ko          text,
  estimated_minutes smallint check (estimated_minutes between 1 and 240),
  href              text check (href is null or href like '/%'),
  topic_id          uuid references public.topics (id) on delete set null,
  unique (template_id, day, position)
);

create index plan_template_tasks_template_day_idx on public.plan_template_tasks (template_id, day);

do $$
declare
  t text;
begin
  foreach t in array array['plan_templates', 'plan_template_tasks'] loop
    execute format('create trigger %1$s_before_write before insert or update on public.%1$I
                      for each row execute function public.content_before_write()', t);
    execute format('create trigger %1$s_after_write after insert or update on public.%1$I
                      for each row execute function public.content_after_write()', t);
    execute format('create trigger %1$s_cleanup after delete on public.%1$I
                      for each row execute function public.cleanup_polymorphic()', t);
    execute format('alter table public.%I enable row level security', t);
    execute format('create policy %1$s_select on public.%1$I for select to authenticated
                      using (public.is_published(status, source_id)
                             or public.has_role(''editor'', ''korean_expert'', ''admin''))', t);
    execute format('create policy %1$s_insert on public.%1$I for insert to authenticated
                      with check (public.has_role(''editor'', ''korean_expert'', ''admin''))', t);
    execute format('create policy %1$s_update on public.%1$I for update to authenticated
                      using (public.has_role(''editor'', ''korean_expert'', ''admin''))
                      with check (public.has_role(''editor'', ''korean_expert'', ''admin''))', t);
    execute format('create policy %1$s_delete on public.%1$I for delete to authenticated
                      using (public.has_role(''admin''))', t);
  end loop;
end;
$$;

-- -----------------------------------------------------------------------------
-- Foydalanuvchi rejalari
-- -----------------------------------------------------------------------------
create table public.user_plans (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references public.profiles (id) on delete cascade,
  template_id  uuid not null references public.plan_templates (id) on delete restrict,
  start_date   date not null,
  target_level smallint not null check (target_level between 3 and 6),
  status       public.user_plan_status not null default 'active',
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);

-- Bir foydalanuvchida bir vaqtda faqat bitta faol reja
create unique index user_plans_one_active on public.user_plans (user_id) where status = 'active';

create trigger user_plans_touch before update on public.user_plans
  for each row execute function public.touch_updated_at();

-- Reja faqat nashr qilingan shablondan boshlanadi
create or replace function public.guard_user_plan_template()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if tg_op = 'INSERT' or new.template_id is distinct from old.template_id then
    if not exists (
      select 1 from public.plan_templates t
      where t.id = new.template_id and public.is_published(t.status, t.source_id)
    ) then
      raise exception 'Reja shabloni hali nashr qilinmagan (reviewed/verified emas)'
        using errcode = '23514';
    end if;
  end if;
  return new;
end;
$$;

create trigger user_plans_guard_template before insert or update on public.user_plans
  for each row execute function public.guard_user_plan_template();

-- -----------------------------------------------------------------------------
-- Bajarilgan topshiriqlar
-- -----------------------------------------------------------------------------
create table public.user_task_completions (
  id               uuid primary key default gen_random_uuid(),
  user_id          uuid not null references public.profiles (id) on delete cascade,
  user_plan_id     uuid not null references public.user_plans (id) on delete cascade,
  template_task_id uuid not null references public.plan_template_tasks (id) on delete cascade,
  completed_on     date not null,
  created_at       timestamptz not null default now(),
  unique (user_plan_id, template_task_id)
);

create index user_task_completions_user_idx on public.user_task_completions (user_id, completed_on);

create or replace function public.guard_task_completion()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_plan public.user_plans%rowtype;
begin
  select * into v_plan from public.user_plans where id = new.user_plan_id;
  if v_plan.user_id is distinct from new.user_id then
    raise exception 'Topshiriq boshqa foydalanuvchining rejasiga tegishli' using errcode = '42501';
  end if;
  if not exists (
    select 1 from public.plan_template_tasks tt
    where tt.id = new.template_task_id and tt.template_id = v_plan.template_id
  ) then
    raise exception 'Topshiriq bu reja shabloniga tegishli emas' using errcode = '23514';
  end if;
  if new.completed_on < v_plan.start_date then
    raise exception 'Bajarilgan sana reja boshlanishidan oldin bo‘lishi mumkin emas' using errcode = '23514';
  end if;
  return new;
end;
$$;

create trigger user_task_completions_guard before insert or update on public.user_task_completions
  for each row execute function public.guard_task_completion();

-- -----------------------------------------------------------------------------
-- O‘qish sessiyalari (haqiqiy o‘lchangan vaqt; taxminiy daqiqalar yozilmaydi)
-- -----------------------------------------------------------------------------
create table public.study_sessions (
  id         uuid primary key default gen_random_uuid(),
  user_id    uuid not null references public.profiles (id) on delete cascade,
  studied_on date not null,
  minutes    smallint not null check (minutes between 1 and 600),
  section    public.learning_section,
  source     text not null default 'practice' check (source in ('practice', 'mock_test', 'manual')),
  created_at timestamptz not null default now()
);

create index study_sessions_user_idx on public.study_sessions (user_id, studied_on);

-- -----------------------------------------------------------------------------
-- Test natijalari va javoblar (Xatolarim uchun)
-- -----------------------------------------------------------------------------
create table public.test_attempts (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references public.profiles (id) on delete cascade,
  section      public.learning_section not null,
  title        text not null,
  score        numeric(6, 2) not null check (score >= 0),
  max_score    numeric(6, 2) not null check (max_score > 0),
  taken_on     date not null,
  question_set_id uuid references public.question_sets (id) on delete set null,
  mock_test_id    uuid references public.mock_tests (id) on delete set null,
  created_at   timestamptz not null default now(),
  check (score <= max_score)
);

create index test_attempts_user_idx on public.test_attempts (user_id, taken_on desc);

create table public.attempt_answers (
  id            uuid primary key default gen_random_uuid(),
  attempt_id    uuid not null references public.test_attempts (id) on delete cascade,
  user_id       uuid not null references public.profiles (id) on delete cascade,
  question_id   uuid not null references public.questions (id) on delete cascade,
  chosen_label  smallint check (chosen_label between 1 and 4),
  is_correct    boolean not null,
  created_at    timestamptz not null default now(),
  unique (attempt_id, question_id)
);

create index attempt_answers_user_wrong_idx on public.attempt_answers (user_id) where not is_correct;

-- -----------------------------------------------------------------------------
-- RLS: faqat egasi
-- -----------------------------------------------------------------------------
do $$
declare
  t text;
begin
  foreach t in array array['user_plans', 'user_task_completions', 'study_sessions',
                           'test_attempts', 'attempt_answers'] loop
    execute format('alter table public.%I enable row level security', t);
    execute format('create policy %1$s_own_select on public.%1$I for select to authenticated
                      using (user_id = auth.uid())', t);
    execute format('create policy %1$s_own_insert on public.%1$I for insert to authenticated
                      with check (user_id = auth.uid())', t);
    execute format('create policy %1$s_own_update on public.%1$I for update to authenticated
                      using (user_id = auth.uid()) with check (user_id = auth.uid())', t);
    execute format('create policy %1$s_own_delete on public.%1$I for delete to authenticated
                      using (user_id = auth.uid())', t);
  end loop;
end;
$$;

-- Profilni o‘zi yangilay oladi (0001 da policy bor); maqsad daraja va vaqt zonasi shu yerda.
