-- FAQAT integratsiya testi uchun (ilova kontentiga kirmaydi).
\set ON_ERROR_STOP on
insert into auth.users (id, email) values ('00000000-0000-0000-0000-0000000e2e01', 'editor@e2e.test');
update public.profiles set role = 'editor' where id = '00000000-0000-0000-0000-0000000e2e01';

-- Editor shablonni va 20 ta so‘zni ko‘rib chiqadi (service role: reviewed_by = editor)
update public.plan_templates set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01';
update public.plan_template_tasks set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01';
update public.vocab_entries set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where key in (select key from public.vocab_entries order by key limit 20) or key = 'VOC-RB-0073';
update public.translations set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where entity_table = 'vocab_entries' and entity_id in (select id from public.vocab_entries where status = 'reviewed');
update public.vocab_examples set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where entry_id in (select id from public.vocab_entries where status = 'reviewed');
update public.translations set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where entity_table = 'vocab_examples' and entity_id in (select id from public.vocab_examples where status = 'reviewed');

-- Test o‘qish savollari (3 ta)
insert into public.question_types (code, section, number_from, number_to, name_ko, name_uz, points_per_item)
values ('R-01-02', 'reading', 1, 2, '빈칸에 알맞은 것 고르기', 'Bo‘shliqni to‘ldirish (TEST)', 2);

do $$
declare
  v_src uuid := (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL');
  v_type uuid := (select id from public.question_types where code = 'R-01-02');
  v_q uuid;
  i int;
begin
  for i in 1..3 loop
    insert into public.questions (key, source_id, section, question_type_id, number_slot, stem_ko, prompt_ko, points)
    values ('QST-E2E-' || i, v_src, 'reading', v_type, i, '(TEST) ( )에 들어갈 가장 알맞은 것을 고르십시오.', '비가 ( ) 우산을 가져가세요.', 2)
    returning id into v_q;
    insert into public.question_options (key, source_id, question_id, label, text_ko, is_correct) values
      ('QST-E2E-' || i || '-1', v_src, v_q, 1, '오니까', true),
      ('QST-E2E-' || i || '-2', v_src, v_q, 2, '오는데', false),
      ('QST-E2E-' || i || '-3', v_src, v_q, 3, '오거나', false),
      ('QST-E2E-' || i || '-4', v_src, v_q, 4, '오도록', false);
    insert into public.explanations (key, source_id, question_id, body_md)
    values ('EXP-E2E-' || i, v_src, v_q, '(TEST izoh) -(으)니까 sabab bildiradi: yomg‘ir yog‘ayotgani uchun soyabon olish kerak.');
    update public.question_options set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01' where question_id = v_q;
    update public.explanations set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01' where question_id = v_q;
    update public.questions set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01' where id = v_q;
  end loop;
end $$;
