-- content.sql seed'i ikki marta ishga tushirilgandan keyin tekshiriladi.
\set ON_ERROR_STOP on
\set QUIET on

create or replace function pg_temp.act_as(p uuid) returns void language sql as $$
  select set_config('request.jwt.claim.sub', coalesce(p::text, ''), false);
$$;
create or replace function pg_temp.ok(c boolean, m text) returns void language plpgsql as $$
begin if not coalesce(c, false) then raise exception 'FAIL: %', m; end if; raise notice 'ok — %', m; end; $$;

select pg_temp.ok((select count(*) = 763 from public.vocab_entries), 'seed: 763 ta lug‘at yozuvi');
select pg_temp.ok((select count(*) = 758 from public.translations where entity_table = 'vocab_entries'), 'seed: 758 ta so‘z tarjimasi (5 tasi tarjimasiz)');
select pg_temp.ok((select count(*) = 53 from public.vocab_examples), 'seed: 53 ta misol gap');
select pg_temp.ok((select count(*) = 1 from public.plan_templates) and (select count(*) = 126 from public.plan_template_tasks), 'seed: 1 shablon, 126 topshiriq');
select pg_temp.ok((select count(*) = 8 from public.topics), 'seed: 8 ta mavzu');
select pg_temp.ok((select bool_and(status = 'draft') from public.vocab_entries), 'seed: barcha lug‘at yozuvlari draft');
select pg_temp.ok((select bool_and(version = 1) from public.vocab_entries) and (select bool_and(version = 1) from public.plan_template_tasks),
  'idempotent: ikkinchi seed versiyani oshirmadi');
select pg_temp.ok((select count(*) = 763 from public.content_revisions where entity_table = 'vocab_entries'),
  'idempotent: har yozuv uchun bitta revision');
select pg_temp.ok((select attribution_required and attribution_text = 'Lug‘at: Rebels / Jack korean' and license_status = 'granted'
                   from public.sources where key = 'SRC-REBELS'), 'Rebels: granted, mualliflik matni bilan');
select pg_temp.ok((select count(*) = 0 from public.translations where text ~ '[A-Za-z]''[A-Za-z]'), 'tarjimalarda ASCII apostrof yo‘q');

-- O‘quvchi draft kontentni ko‘rmaydi
insert into auth.users (id, email) values
  ('00000000-0000-0000-0000-00000000aaaa', 'learner@test'),
  ('00000000-0000-0000-0000-00000000eeee', 'editor@test');
update public.profiles set role = 'editor' where id = '00000000-0000-0000-0000-00000000eeee';

select pg_temp.act_as('00000000-0000-0000-0000-00000000aaaa');
set role authenticated;
select pg_temp.ok((select count(*) = 0 from public.vocab_entries) and (select count(*) = 0 from public.plan_templates),
  'o‘quvchi draft lug‘at va shablonni ko‘rmaydi');
reset role;

-- Editor shablonni ko‘rib chiqadi → o‘quvchi rejani boshlay oladi
select pg_temp.act_as('00000000-0000-0000-0000-00000000eeee');
set role authenticated;
update public.plan_templates set status = 'reviewed', reviewed_by = auth.uid() where key = 'PLN-45-TOPIK2-L4';
update public.plan_template_tasks set status = 'reviewed', reviewed_by = auth.uid();
update public.vocab_entries set status = 'reviewed', reviewed_by = auth.uid() where key in ('VOC-RB-0001', 'VOC-RB-0002');
update public.translations set status = 'reviewed', reviewed_by = auth.uid() where key = 'VOC-RB-0001-MEANING-UZ';
reset role;

select pg_temp.act_as('00000000-0000-0000-0000-00000000aaaa');
set role authenticated;
select pg_temp.ok((select count(*) = 126 from public.plan_template_tasks), 'reviewed shablon: 126 topshiriq ko‘rinadi');
insert into public.user_plans (user_id, template_id, start_date, target_level)
select auth.uid(), id, current_date, 4 from public.plan_templates where key = 'PLN-45-TOPIK2-L4';
select pg_temp.ok((select count(*) = 1 from public.user_plans), 'o‘quvchi 45 kunlik rejani boshladi');
select pg_temp.ok((select count(*) = 2 from public.vocab_entries), 'faqat reviewed lug‘at yozuvlari ko‘rinadi (2)');
select pg_temp.ok((select count(*) = 1 from public.translations where entity_table = 'vocab_entries'), 'faqat reviewed tarjima ko‘rinadi (1)');
reset role;

-- Seed qayta ishga tushganda reviewed status pasaymaydi
select pg_temp.act_as(null);
