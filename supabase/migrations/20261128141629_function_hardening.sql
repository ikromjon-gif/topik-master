-- =============================================================================
-- Sabaq — function_hardening
-- Supabase security advisor natijalari bo'yicha:
--   * 0011 function_search_path_mutable — search_path qat'iy belgilanadi.
--   * 0028/0029 *_security_definer_function_executable — trigger funksiyalari
--     va ichki yordamchilar /rest/v1/rpc orqali chaqirilmasligi kerak.
--
-- Muhim: trigger ishga tushganda EXECUTE huquqi tekshirilmaydi, shuning uchun
-- trigger funksiyalaridan huquqni olish triggerlarga ta'sir qilmaydi.
-- RLS siyosatlarida ishlatiladigan funksiyalar (has_role, current_app_role,
-- is_published, source_is_usable) `authenticated` uchun ochiq qoladi —
-- siyosatlar so'rov egasi nomidan bajariladi.
-- =============================================================================

-- 1. search_path
alter function public.touch_updated_at() set search_path = public;
alter function public.content_meta_columns() set search_path = public;
alter function public.content_fingerprint(jsonb) set search_path = public;

-- 2. Trigger funksiyalari: hech kim to'g'ridan-to'g'ri chaqirmaydi
revoke execute on function public.touch_updated_at()          from public, anon, authenticated;
revoke execute on function public.guard_profile_role()         from public, anon, authenticated;
revoke execute on function public.handle_new_user()            from public, anon, authenticated;
revoke execute on function public.content_before_write()       from public, anon, authenticated;
revoke execute on function public.content_after_write()        from public, anon, authenticated;
revoke execute on function public.cleanup_polymorphic()        from public, anon, authenticated;
revoke execute on function public.guard_question_publishable() from public, anon, authenticated;
revoke execute on function public.guard_audio_rights()         from public, anon, authenticated;
revoke execute on function public.guard_user_plan_template()   from public, anon, authenticated;
revoke execute on function public.guard_task_completion()      from public, anon, authenticated;

-- 3. Ichki yordamchi: faqat security definer triggerlar ichida ishlatiladi.
--    Ochiq qolsa, istalgan profil ID'si bo'yicha rolni aniqlash mumkin edi.
revoke execute on function public.profile_has_role(uuid, public.app_role[]) from public, anon, authenticated;

-- 4. RLS yordamchilari: faqat tizimga kirgan foydalanuvchi (anon siyosatlari yo'q)
revoke execute on function public.current_app_role()                           from public, anon;
revoke execute on function public.has_role(public.app_role[])                  from public, anon;
revoke execute on function public.is_published(public.content_status, uuid)    from public, anon;
revoke execute on function public.source_is_usable(uuid)                       from public, anon;
grant  execute on function public.current_app_role()                           to authenticated;
grant  execute on function public.has_role(public.app_role[])                  to authenticated;
grant  execute on function public.is_published(public.content_status, uuid)    to authenticated;
grant  execute on function public.source_is_usable(uuid)                       to authenticated;

-- 5. Kontent jadvallari anon uchun yopiq (siyosatlar faqat authenticated uchun;
--    bu qo'shimcha himoya qatlami — Supabase standart grant'larini toraytiradi).
do $$
declare t text;
begin
  for t in select tablename from pg_tables where schemaname = 'public' loop
    execute format('revoke all on table public.%I from anon', t);
  end loop;
end;
$$;
