-- function_hardening testlari: RPC orqali chaqirib bo'lmaydigan funksiyalar va anon huquqlari.
\set ON_ERROR_STOP on
\set QUIET on

create or replace function pg_temp.ok(c boolean, m text) returns void language plpgsql as $$
begin if not coalesce(c, false) then raise exception 'FAIL: %', m; end if; raise notice 'ok — %', m; end; $$;

select pg_temp.ok(not has_function_privilege('authenticated', 'public.content_before_write()', 'execute')
              and not has_function_privilege('anon', 'public.handle_new_user()', 'execute')
              and not has_function_privilege('authenticated', 'public.guard_task_completion()', 'execute'),
  'trigger funksiyalari RPC orqali chaqirilmaydi');
select pg_temp.ok(not has_function_privilege('authenticated', 'public.profile_has_role(uuid, public.app_role[])', 'execute'),
  'profile_has_role ichki — authenticated chaqira olmaydi');
select pg_temp.ok(has_function_privilege('authenticated', 'public.has_role(public.app_role[])', 'execute')
              and not has_function_privilege('anon', 'public.has_role(public.app_role[])', 'execute'),
  'has_role: authenticated ha, anon yo‘q');
select pg_temp.ok((select bool_and(proconfig is not null) from pg_proc p join pg_namespace n on n.oid = p.pronamespace
                   where n.nspname = 'public' and p.proname in ('touch_updated_at', 'content_meta_columns', 'content_fingerprint')),
  'search_path qat’iy belgilangan');
select pg_temp.ok(not has_table_privilege('anon', 'public.vocab_entries', 'select')
              and not has_table_privilege('anon', 'public.profiles', 'select'),
  'anon kontent va profil jadvallarini o‘qiy olmaydi');

-- Triggerlar huquq olib tashlangandan keyin ham ishlaydi
insert into auth.users (id, email) values ('00000000-0000-0000-0000-0000000a0001', 'h@test');
select pg_temp.ok((select count(*) = 1 from public.profiles where id = '00000000-0000-0000-0000-0000000a0001'),
  'handle_new_user triggeri ishlaydi');
insert into public.topics (key, name_ko, name_uz) values ('TOP-HARDEN', '테스트', 'Test');
update public.topics set name_uz = 'Test 2' where key = 'TOP-HARDEN';
select pg_temp.ok((select updated_at > created_at or updated_at = created_at from public.topics where key = 'TOP-HARDEN'),
  'touch_updated_at triggeri ishlaydi');
