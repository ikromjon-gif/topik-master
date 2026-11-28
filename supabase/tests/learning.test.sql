-- =============================================================================
-- 0003_learning testlari: reja shablonlari, foydalanuvchi rejalari, maxfiylik.
-- =============================================================================
\set ON_ERROR_STOP on
\set QUIET on

create or replace function pg_temp.act_as(p uuid) returns void language sql as $$
  select set_config('request.jwt.claim.sub', coalesce(p::text, ''), false);
$$;
create or replace function pg_temp.expect_error(p_sql text, p_like text) returns void
language plpgsql as $$
begin
  begin execute p_sql;
  exception when others then
    if sqlerrm not ilike p_like then raise exception 'Kutilmagan xato: % (kutilgan: %)', sqlerrm, p_like; end if;
    return;
  end;
  raise exception 'Xato kutilgan edi: %', p_sql;
end; $$;
create or replace function pg_temp.ok(c boolean, m text) returns void language plpgsql as $$
begin if not coalesce(c, false) then raise exception 'FAIL: %', m; end if; raise notice 'ok — %', m; end; $$;

-- Foydalanuvchilar: A, B (learner), E (editor)
insert into auth.users (id, email) values
  ('00000000-0000-0000-0000-0000000000a1', 'a@test'),
  ('00000000-0000-0000-0000-0000000000b1', 'b@test'),
  ('00000000-0000-0000-0000-0000000000e1', 'e@test');
update public.profiles set role = 'editor' where id = '00000000-0000-0000-0000-0000000000e1';

select pg_temp.ok((select target_level = 4 and time_zone = 'Asia/Seoul' from public.profiles
                   where id = '00000000-0000-0000-0000-0000000000a1'), 'profil: standart maqsad 4급, Asia/Seoul');

-- Shablon (draft) va topshiriqlar
select pg_temp.act_as(null);
insert into public.plan_templates (key, source_id, authored_by, title, total_days, target_level)
select 'PLN-TEST', id, 'ai', 'Test reja', 3, 4 from public.sources where key = 'SRC-SABAQ-ORIGINAL';
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, estimated_minutes)
select 'PLN-TEST-' || d || '-' || p, s.id, 'ai', t.id, d, p, (array['vocabulary','grammar']::public.learning_section[])[p], 'Topshiriq ' || d || '.' || p, 15
from public.sources s, public.plan_templates t, generate_series(1, 3) d, generate_series(1, 2) p
where s.key = 'SRC-SABAQ-ORIGINAL' and t.key = 'PLN-TEST';

-- 1. Draft shablon o‘quvchiga ko‘rinmaydi va undan reja boshlab bo‘lmaydi
select pg_temp.act_as('00000000-0000-0000-0000-0000000000a1');
set role authenticated;
select pg_temp.ok((select count(*) = 0 from public.plan_templates), 'draft shablon o‘quvchiga ko‘rinmaydi');
reset role;
select pg_temp.expect_error(
  $q$insert into public.user_plans (user_id, template_id, start_date, target_level)
     select '00000000-0000-0000-0000-0000000000a1', id, '2026-11-26', 4 from public.plan_templates where key = 'PLN-TEST'$q$,
  '%nashr qilinmagan%');
select pg_temp.ok(true, 'draft shablondan reja boshlanmaydi (service role ham)');

-- 2. Editor tekshiradi (reviewed) — endi ko‘rinadi
select pg_temp.act_as('00000000-0000-0000-0000-0000000000e1');
set role authenticated;
update public.plan_templates set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000000e1' where key = 'PLN-TEST';
update public.plan_template_tasks set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000000e1' where key like 'PLN-TEST-%';
reset role;

select pg_temp.act_as('00000000-0000-0000-0000-0000000000a1');
set role authenticated;
select pg_temp.ok((select count(*) = 1 from public.plan_templates), 'reviewed shablon o‘quvchiga ko‘rinadi');
select pg_temp.ok((select count(*) = 6 from public.plan_template_tasks), 'shablon topshiriqlari ko‘rinadi (6)');

-- 3. A reja boshlaydi
insert into public.user_plans (user_id, template_id, start_date, target_level)
select auth.uid(), id, '2026-11-26', 4 from public.plan_templates where key = 'PLN-TEST';
select pg_temp.ok((select count(*) = 1 from public.user_plans where status = 'active'), 'A reja boshladi');

-- ikkinchi faol reja mumkin emas
select pg_temp.expect_error(
  $q$insert into public.user_plans (user_id, template_id, start_date, target_level)
     select auth.uid(), id, '2026-11-27', 4 from public.plan_templates where key = 'PLN-TEST'$q$,
  '%user_plans_one_active%');
select pg_temp.ok(true, 'bir vaqtda faqat bitta faol reja');

-- 4. Topshiriqni bajarish
insert into public.user_task_completions (user_id, user_plan_id, template_task_id, completed_on)
select auth.uid(), up.id, tt.id, '2026-11-26'
from public.user_plans up, public.plan_template_tasks tt where tt.key = 'PLN-TEST-1-1';
select pg_temp.ok((select count(*) = 1 from public.user_task_completions), 'topshiriq bajarildi');

select pg_temp.expect_error(
  $q$insert into public.user_task_completions (user_id, user_plan_id, template_task_id, completed_on)
     select auth.uid(), up.id, tt.id, '2026-11-20'
     from public.user_plans up, public.plan_template_tasks tt where tt.key = 'PLN-TEST-1-2'$q$,
  '%reja boshlanishidan oldin%');
select pg_temp.ok(true, 'reja boshlanishidan oldingi sana rad etiladi');

select pg_temp.expect_error(
  $q$insert into public.user_task_completions (user_id, user_plan_id, template_task_id, completed_on)
     select auth.uid(), up.id, tt.id, '2026-11-26'
     from public.user_plans up, public.plan_template_tasks tt where tt.key = 'PLN-TEST-1-1'$q$,
  '%duplicate key%');
select pg_temp.ok(true, 'bir topshiriq ikki marta bajarilmaydi');

insert into public.study_sessions (user_id, studied_on, minutes, section) values (auth.uid(), '2026-11-26', 25, 'vocabulary');
select pg_temp.expect_error(
  $q$insert into public.study_sessions (user_id, studied_on, minutes) values (auth.uid(), '2026-11-26', 0)$q$,
  '%study_sessions_minutes_check%');
select pg_temp.ok(true, 'o‘qish sessiyasi: 0 daqiqa rad etiladi');

-- profil: maqsadni o‘zgartira oladi, rolni emas
update public.profiles set target_level = 5 where id = auth.uid();
select pg_temp.ok((select target_level = 5 from public.profiles where id = auth.uid()), 'o‘z maqsad darajasini o‘zgartira oladi');
select pg_temp.expect_error($q$update public.profiles set role = 'editor' where id = auth.uid()$q$, '%faqat admin%');
select pg_temp.ok(true, 'o‘z rolini o‘zgartira olmaydi');
reset role;

-- 5. Maxfiylik: B A'ning ma'lumotlarini ko‘rmaydi va yoza olmaydi
select pg_temp.act_as(null);
do $$
declare v_plan uuid; v_task uuid;
begin
  select id into v_plan from public.user_plans where user_id = '00000000-0000-0000-0000-0000000000a1';
  select id into v_task from public.plan_template_tasks where key = 'PLN-TEST-2-1';
  perform set_config('test.plan', v_plan::text, false);
  perform set_config('test.task', v_task::text, false);
end $$;

select pg_temp.act_as('00000000-0000-0000-0000-0000000000b1');
set role authenticated;
select pg_temp.ok((select count(*) = 0 from public.user_plans), 'B A''ning rejasini ko‘rmaydi');
select pg_temp.ok((select count(*) = 0 from public.user_task_completions), 'B A''ning bajarganlarini ko‘rmaydi');
select pg_temp.ok((select count(*) = 0 from public.study_sessions), 'B A''ning sessiyalarini ko‘rmaydi');
-- B A nomidan (user_id = A) yozishga urinadi
select pg_temp.expect_error(
  $q$insert into public.user_task_completions (user_id, user_plan_id, template_task_id, completed_on)
     values ('00000000-0000-0000-0000-0000000000a1', current_setting('test.plan')::uuid,
             current_setting('test.task')::uuid, '2026-11-27')$q$,
  '%row-level security%');
select pg_temp.ok(true, 'B A nomidan yoza olmaydi');
-- B o‘z nomidan A'ning rejasiga yozishga urinadi (plan id ni bilsa ham)
select pg_temp.expect_error(
  $q$insert into public.user_task_completions (user_id, user_plan_id, template_task_id, completed_on)
     values (auth.uid(), current_setting('test.plan')::uuid, current_setting('test.task')::uuid, '2026-11-27')$q$,
  '%boshqa foydalanuvchining%');
select pg_temp.ok(true, 'B o‘z nomidan ham A''ning rejasiga yoza olmaydi');
select pg_temp.ok(
  (select count(*) = 0 from public.user_plans where id = current_setting('test.plan')::uuid),
  'B A''ning rejasini ID bo‘yicha ham ko‘ra olmaydi');
reset role;

-- 6. Shablon kontenti o‘zgarsa draft'ga tushadi → yangi reja boshlanmaydi, mavjudi saqlanadi
select pg_temp.act_as('00000000-0000-0000-0000-0000000000e1');
set role authenticated;
update public.plan_templates set title = 'Test reja v2' where key = 'PLN-TEST';
reset role;
select pg_temp.ok((select status = 'draft' and version = 2 from public.plan_templates where key = 'PLN-TEST'),
  'shablon o‘zgardi: v2, draft');
select pg_temp.act_as('00000000-0000-0000-0000-0000000000b1');
set role authenticated;
select pg_temp.expect_error(
  $q$insert into public.user_plans (user_id, template_id, start_date, target_level)
     select auth.uid(), id, '2026-11-28', 4 from public.plan_templates where key = 'PLN-TEST'
     union all select auth.uid(), null::uuid, '2026-11-28', 4 where not exists (select 1 from public.plan_templates where key = 'PLN-TEST')$q$,
  '%');
select pg_temp.ok((select count(*) = 0 from public.plan_templates), 'draft''ga tushgan shablon o‘quvchiga yana ko‘rinmaydi, yangi reja boshlanmaydi');
reset role;
select pg_temp.act_as('00000000-0000-0000-0000-0000000000a1');
set role authenticated;
select pg_temp.ok((select count(*) = 1 from public.user_plans), 'A''ning mavjud rejasi saqlanib qoldi');
reset role;
