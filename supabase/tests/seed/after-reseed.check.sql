-- Uchinchi seed'dan keyin: tekshiruvdan o‘tgan yozuvlar statusi saqlanib qolishi kerak.
\set ON_ERROR_STOP on
\set QUIET on
create or replace function pg_temp.ok(c boolean, m text) returns void language plpgsql as $$
begin if not coalesce(c, false) then raise exception 'FAIL: %', m; end if; raise notice 'ok — %', m; end; $$;

select pg_temp.ok((select status = 'reviewed' and version = 1 from public.plan_templates where key = 'PLN-45-TOPIK2-L4'),
  'qayta seed: reviewed shablon statusi pasaymadi');
select pg_temp.ok((select count(*) = 2 from public.vocab_entries where status = 'reviewed'),
  'qayta seed: reviewed lug‘at yozuvlari saqlandi');
select pg_temp.ok((select count(*) = 1 from public.user_plans), 'qayta seed: foydalanuvchi rejasi saqlandi');
