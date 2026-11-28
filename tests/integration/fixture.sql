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

-- Seed qilingan original kontentdan bir qismini ko‘rib chiqish (draft → reviewed)
-- O‘qish: QST-R-0001..0003 (to‘g‘ri javoblar: ③, ②, ④)
update public.question_options set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where question_id in (select id from public.questions where key in ('QST-R-0001', 'QST-R-0002', 'QST-R-0003'));
update public.explanations set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where question_id in (select id from public.questions where key in ('QST-R-0001', 'QST-R-0002', 'QST-R-0003'));
update public.questions set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where key in ('QST-R-0001', 'QST-R-0002', 'QST-R-0003');

-- Grammatika: GRM-3-001..003
update public.grammar_points set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where key in ('GRM-3-001', 'GRM-3-002', 'GRM-3-003');
update public.grammar_examples set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where point_id in (select id from public.grammar_points where status = 'reviewed');
update public.translations set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where (entity_table = 'grammar_points' and entity_id in (select id from public.grammar_points where status = 'reviewed'))
    or (entity_table = 'grammar_examples' and entity_id in (select id from public.grammar_examples where status = 'reviewed'));

-- Yozish: WRT-53-0001 (jadval, ko‘rsatma, namunaviy javob va izoh)
update public.writing_tasks set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01' where key = 'WRT-53-0001';
update public.model_answers set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01' where key = 'WRT-53-0001-MODEL';
update public.translations set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-0000000e2e01'
 where key in ('WRT-53-0001-INSTR-UZ', 'WRT-53-0001-MODEL-COMMENT-UZ');
