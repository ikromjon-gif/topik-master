-- AVTOMATIK YARATILGAN: npm run content:seed (scripts/content/build-seed.ts). Qo‘lda tahrirlamang.
begin;
set local sabaq.change_note = 'content seed';
insert into public.sources (key, kind, name, holder, url, license, commercial_use, redistribution_allowed,
  attribution_required, attribution_text, license_status, proof_url, per_item_proof_required, notes)
values ('SRC-SABAQ-ORIGINAL', 'original_content', 'Sabaq original kontenti', 'Sabaq', null, 'Sabaq mulki', true,
  true, false, null, 'granted',
  null, false, 'Migration 0001 da tizim yozuvi sifatida yaratiladi.')
on conflict (key) do update set kind = excluded.kind, name = excluded.name, holder = excluded.holder, url = excluded.url,
  license = excluded.license, commercial_use = excluded.commercial_use, redistribution_allowed = excluded.redistribution_allowed,
  attribution_required = excluded.attribution_required, attribution_text = excluded.attribution_text,
  license_status = excluded.license_status, proof_url = excluded.proof_url,
  per_item_proof_required = excluded.per_item_proof_required, notes = excluded.notes;
insert into public.sources (key, kind, name, holder, url, license, commercial_use, redistribution_allowed,
  attribution_required, attribution_text, license_status, proof_url, per_item_proof_required, notes)
values ('SRC-REBELS', 'licensed_third_party', 'Rebels TOPIK II lug‘ati', 'Jack korean (Rebels)', null, 'Muallif ruxsati', true,
  true, true, 'Lug‘at: Rebels / Jack korean', 'granted',
  null, false, 'Muallif ruxsati olingan (loyiha egasi tasdiqlagan, 2026-11-27). Lug‘at sahifalarida mualliflik matni ko‘rsatiladi.')
on conflict (key) do update set kind = excluded.kind, name = excluded.name, holder = excluded.holder, url = excluded.url,
  license = excluded.license, commercial_use = excluded.commercial_use, redistribution_allowed = excluded.redistribution_allowed,
  attribution_required = excluded.attribution_required, attribution_text = excluded.attribution_text,
  license_status = excluded.license_status, proof_url = excluded.proof_url,
  per_item_proof_required = excluded.per_item_proof_required, notes = excluded.notes;
insert into public.sources (key, kind, name, holder, url, license, commercial_use, redistribution_allowed,
  attribution_required, attribution_text, license_status, proof_url, per_item_proof_required, notes)
values ('SRC-TOPIK-OFFICIAL', 'official_reference', 'TOPIK rasmiy sayti', '국립국제교육원 (NIIED)', 'https://www.topik.go.kr/', null, false,
  false, false, null, 'granted',
  null, false, 'Faqat havola. Rasmiy savollar, audio va matnlar platformaga ko‘chirilmaydi.')
on conflict (key) do update set kind = excluded.kind, name = excluded.name, holder = excluded.holder, url = excluded.url,
  license = excluded.license, commercial_use = excluded.commercial_use, redistribution_allowed = excluded.redistribution_allowed,
  attribution_required = excluded.attribution_required, attribution_text = excluded.attribution_text,
  license_status = excluded.license_status, proof_url = excluded.proof_url,
  per_item_proof_required = excluded.per_item_proof_required, notes = excluded.notes;
insert into public.sources (key, kind, name, holder, url, license, commercial_use, redistribution_allowed,
  attribution_required, attribution_text, license_status, proof_url, per_item_proof_required, notes)
values ('SRC-NIIED', 'official_reference', 'NIIED TOPIK sahifasi', '국립국제교육원 (NIIED)', 'https://www.niied.go.kr/web/niied/contents/niied_topik', null, false,
  false, false, null, 'granted',
  null, false, 'Faqat havola.')
on conflict (key) do update set kind = excluded.kind, name = excluded.name, holder = excluded.holder, url = excluded.url,
  license = excluded.license, commercial_use = excluded.commercial_use, redistribution_allowed = excluded.redistribution_allowed,
  attribution_required = excluded.attribution_required, attribution_text = excluded.attribution_text,
  license_status = excluded.license_status, proof_url = excluded.proof_url,
  per_item_proof_required = excluded.per_item_proof_required, notes = excluded.notes;
insert into public.sources (key, kind, name, holder, url, license, commercial_use, redistribution_allowed,
  attribution_required, attribution_text, license_status, proof_url, per_item_proof_required, notes)
values ('SRC-NIKL-KRDICT', 'licensed_third_party', '한국어기초사전 multimedia (audio)', '국립국어원 (NIKL)', 'https://krdict.korean.go.kr/', 'Individual multimedia license — tekshirilmagan', false,
  false, true, '국립국어원 한국어기초사전', 'not_requested',
  null, true, 'Har bir audio fayl alohida litsenziya bilan tekshiriladi. Tekshirilmaguncha hech biri foydalanuvchiga chiqmaydi.')
on conflict (key) do update set kind = excluded.kind, name = excluded.name, holder = excluded.holder, url = excluded.url,
  license = excluded.license, commercial_use = excluded.commercial_use, redistribution_allowed = excluded.redistribution_allowed,
  attribution_required = excluded.attribution_required, attribution_text = excluded.attribution_text,
  license_status = excluded.license_status, proof_url = excluded.proof_url,
  per_item_proof_required = excluded.per_item_proof_required, notes = excluded.notes;
insert into public.topics (key, name_ko, name_uz, sort) values ('TOP-POLITICS-WELFARE', '정치/복지', 'Siyosat va farovonlik', 1)
on conflict (key) do update set name_ko = excluded.name_ko, name_uz = excluded.name_uz, sort = excluded.sort;
insert into public.topics (key, name_ko, name_uz, sort) values ('TOP-HISTORY-CULTURE', '역사/문화', 'Tarix va madaniyat', 2)
on conflict (key) do update set name_ko = excluded.name_ko, name_uz = excluded.name_uz, sort = excluded.sort;
insert into public.topics (key, name_ko, name_uz, sort) values ('TOP-SCIENCE-TECH', '과학/기술', 'Fan va texnika', 3)
on conflict (key) do update set name_ko = excluded.name_ko, name_uz = excluded.name_uz, sort = excluded.sort;
insert into public.topics (key, name_ko, name_uz, sort) values ('TOP-ECONOMY', '경제', 'Iqtisodiyot', 4)
on conflict (key) do update set name_ko = excluded.name_ko, name_uz = excluded.name_uz, sort = excluded.sort;
insert into public.topics (key, name_ko, name_uz, sort) values ('TOP-ENVIRONMENT', '환경/기후', 'Atrof-muhit va iqlim', 5)
on conflict (key) do update set name_ko = excluded.name_ko, name_uz = excluded.name_uz, sort = excluded.sort;
insert into public.topics (key, name_ko, name_uz, sort) values ('TOP-PSYCHOLOGY', '심리/성격', 'Psixologiya va xarakter', 6)
on conflict (key) do update set name_ko = excluded.name_ko, name_uz = excluded.name_uz, sort = excluded.sort;
insert into public.topics (key, name_ko, name_uz, sort) values ('TOP-EDUCATION', '교육/육아', 'Ta’lim va bola tarbiyasi', 7)
on conflict (key) do update set name_ko = excluded.name_ko, name_uz = excluded.name_uz, sort = excluded.sort;
insert into public.topics (key, name_ko, name_uz, sort) values ('TOP-HEALTH', '건강/신체', 'Sog‘liq va tana', 8)
on conflict (key) do update set name_ko = excluded.name_ko, name_uz = excluded.name_uz, sort = excluded.sort;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0001', (select id from public.sources where key = 'SRC-REBELS'), 'human', '실시하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0001-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0001'), 'meaning', 'uz', 'amalga oshirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0002', (select id from public.sources where key = 'SRC-REBELS'), 'human', '시행하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0002-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0002'), 'meaning', 'uz', 'bajarilishini ta’minlamoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0003', (select id from public.sources where key = 'SRC-REBELS'), 'human', '제공하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0003-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0003'), 'meaning', 'uz', 'taqdim etmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0004', (select id from public.sources where key = 'SRC-REBELS'), 'human', '동의하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0004-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0004'), 'meaning', 'uz', 'rozi bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0005', (select id from public.sources where key = 'SRC-REBELS'), 'human', '해결하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0005-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0005'), 'meaning', 'uz', 'hal qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0006', (select id from public.sources where key = 'SRC-REBELS'), 'human', '점검하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0006-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0006'), 'meaning', 'uz', 'tekshirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0007', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공정하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0007-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0007'), 'meaning', 'uz', 'adolatli bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0008', (select id from public.sources where key = 'SRC-REBELS'), 'human', '규제하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0008-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0008'), 'meaning', 'uz', 'tartibga solmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0009', (select id from public.sources where key = 'SRC-REBELS'), 'human', '강화하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0009-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0009'), 'meaning', 'uz', 'kuchaytirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0010', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대처하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0010-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0010'), 'meaning', 'uz', 'chora ko‘rmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0011', (select id from public.sources where key = 'SRC-REBELS'), 'human', '처벌하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0011-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0011'), 'meaning', 'uz', 'jazolamoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0012', (select id from public.sources where key = 'SRC-REBELS'), 'human', '개선하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0012-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0012'), 'meaning', 'uz', 'yaxshilamoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0013', (select id from public.sources where key = 'SRC-REBELS'), 'human', '부작용을 방지하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0013-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0013'), 'meaning', 'uz', 'nojo‘ya ta’sirlarni oldini olmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0014', (select id from public.sources where key = 'SRC-REBELS'), 'human', '합리적으로 해결하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0014-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0014'), 'meaning', 'uz', 'oqilona hal qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0015', (select id from public.sources where key = 'SRC-REBELS'), 'human', '~현상을 줄이다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0015-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0015'), 'meaning', 'uz', '… holatni kamaytirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0016', (select id from public.sources where key = 'SRC-REBELS'), 'human', '예방하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0016-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0016'), 'meaning', 'uz', 'oldini olmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0017', (select id from public.sources where key = 'SRC-REBELS'), 'human', '책임지다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0017-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0017'), 'meaning', 'uz', 'javobgar bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0018', (select id from public.sources where key = 'SRC-REBELS'), 'human', '애용(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0018-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0018'), 'meaning', 'uz', 'muntazam foydalanmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0019', (select id from public.sources where key = 'SRC-REBELS'), 'human', '악용(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0019-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0019'), 'meaning', 'uz', 'yomon maqsadda foydalanmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0020', (select id from public.sources where key = 'SRC-REBELS'), 'human', '오용(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0020-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0020'), 'meaning', 'uz', 'noto‘g‘ri foydalanmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0021', (select id from public.sources where key = 'SRC-REBELS'), 'human', '남용(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0021-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0021'), 'meaning', 'uz', 'suiiste’mol qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0022', (select id from public.sources where key = 'SRC-REBELS'), 'human', '재발(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0022-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0022'), 'meaning', 'uz', 'qayta yuz bermoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0023', (select id from public.sources where key = 'SRC-REBELS'), 'human', '부작용', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0023-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0023'), 'meaning', 'uz', 'nojo‘ya ta’sir', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0024', (select id from public.sources where key = 'SRC-REBELS'), 'human', '반대하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0024-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0024'), 'meaning', 'uz', 'qarshilik qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0025', (select id from public.sources where key = 'SRC-REBELS'), 'human', '악화(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0025-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0025'), 'meaning', 'uz', 'yomonlashmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0026', (select id from public.sources where key = 'SRC-REBELS'), 'human', '갈등', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0026-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0026'), 'meaning', 'uz', 'ziddiyat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0027', (select id from public.sources where key = 'SRC-REBELS'), 'human', '분열(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0027-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0027'), 'meaning', 'uz', 'bo‘linmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0028', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불평등(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0028-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0028'), 'meaning', 'uz', 'tengsizlik (tengsiz bo‘lmoq)', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0029', (select id from public.sources where key = 'SRC-REBELS'), 'human', '양극화', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0029-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0029'), 'meaning', 'uz', 'qutblanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0030', (select id from public.sources where key = 'SRC-REBELS'), 'human', '떠넘기다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0030-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0030'), 'meaning', 'uz', 'ayblamoq/yuklamoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0031', (select id from public.sources where key = 'SRC-REBELS'), 'human', '미루다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0031-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0031'), 'meaning', 'uz', 'kechiktirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0032', (select id from public.sources where key = 'SRC-REBELS'), 'human', '방해하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0032-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0032'), 'meaning', 'uz', 'xalaqit bermoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0033', (select id from public.sources where key = 'SRC-REBELS'), 'human', '저해하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0033-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0033'), 'meaning', 'uz', 'to‘sqinlik qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0034', (select id from public.sources where key = 'SRC-REBELS'), 'human', '발생하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0034-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0034'), 'meaning', 'uz', 'sodir bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0035', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대립(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0035-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0035'), 'meaning', 'uz', 'qarama-qarshi bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0036', (select id from public.sources where key = 'SRC-REBELS'), 'human', '견제(하다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0036-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0036'), 'meaning', 'uz', 'nazorat qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0037', (select id from public.sources where key = 'SRC-REBELS'), 'human', '혼란스럽다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0037-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0037'), 'meaning', 'uz', 'tartibsiz bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0038', (select id from public.sources where key = 'SRC-REBELS'), 'human', '침해하다: buzmoq', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0038-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0038'), 'meaning', 'uz', 'huquqni buzish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0039', (select id from public.sources where key = 'SRC-REBELS'), 'human', '화합', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0039-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0039'), 'meaning', 'uz', 'uyg‘unlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0040', (select id from public.sources where key = 'SRC-REBELS'), 'human', '타협', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0040-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0040'), 'meaning', 'uz', 'kelishuv', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0041', (select id from public.sources where key = 'SRC-REBELS'), 'human', '조정', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0041-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0041'), 'meaning', 'uz', 'muvofiqlashtirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0042', (select id from public.sources where key = 'SRC-REBELS'), 'human', '통합', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0042-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0042'), 'meaning', 'uz', 'birlashtirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0043', (select id from public.sources where key = 'SRC-REBELS'), 'human', '해결', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0043-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0043'), 'meaning', 'uz', 'hal qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0044', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공정', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0044-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0044'), 'meaning', 'uz', 'adolat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0045', (select id from public.sources where key = 'SRC-REBELS'), 'human', '평등', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0045-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0045'), 'meaning', 'uz', 'tenglik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0046', (select id from public.sources where key = 'SRC-REBELS'), 'human', '협상', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0046-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0046'), 'meaning', 'uz', 'muzokara', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0047', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자율', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0047-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0047'), 'meaning', 'uz', 'mustaqillik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0048', (select id from public.sources where key = 'SRC-REBELS'), 'human', '취약', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0048-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0048'), 'meaning', 'uz', 'zaif', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0049', (select id from public.sources where key = 'SRC-REBELS'), 'human', '신속하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0049-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0049'), 'meaning', 'uz', 'tezkor bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0050', (select id from public.sources where key = 'SRC-REBELS'), 'human', '참여하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0050-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0050'), 'meaning', 'uz', 'ishtirok etmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0051', (select id from public.sources where key = 'SRC-REBELS'), 'human', '조화를 이루다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0051-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0051'), 'meaning', 'uz', 'uyg‘unlikka erishmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0052', (select id from public.sources where key = 'SRC-REBELS'), 'human', '균형을 이루다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0052-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0052'), 'meaning', 'uz', 'muvozanatga erishmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0053', (select id from public.sources where key = 'SRC-REBELS'), 'human', '반영하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0053-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0053'), 'meaning', 'uz', 'aks ettirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0054', (select id from public.sources where key = 'SRC-REBELS'), 'human', '소통하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0054-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0054'), 'meaning', 'uz', 'muloqot qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0055', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공감하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0055-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0055'), 'meaning', 'uz', 'hamdard bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0056', (select id from public.sources where key = 'SRC-REBELS'), 'human', '교류하다: almashmoq', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0056-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0056'), 'meaning', 'uz', 'fikr, madaniyat va boshqalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0057', (select id from public.sources where key = 'SRC-REBELS'), 'human', '세금', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0057-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0057'), 'meaning', 'uz', 'soliq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0058', (select id from public.sources where key = 'SRC-REBELS'), 'human', '혜택', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0058-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0058'), 'meaning', 'uz', 'imtiyoz', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0059', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지원', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0059-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0059'), 'meaning', 'uz', 'yordam', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0060', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자립', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0060-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0060'), 'meaning', 'uz', 'mustaqillik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0061', (select id from public.sources where key = 'SRC-REBELS'), 'human', '저소득층', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0061-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0061'), 'meaning', 'uz', 'past daromadli qatlam', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0062', (select id from public.sources where key = 'SRC-REBELS'), 'human', '노년', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0062-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0062'), 'meaning', 'uz', 'qarilik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0063', (select id from public.sources where key = 'SRC-REBELS'), 'human', '장려금', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0063-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0063'), 'meaning', 'uz', 'rag‘batlantiruvchi mablag‘', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0064', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지원금', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0064-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0064'), 'meaning', 'uz', 'yordam puli', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0065', (select id from public.sources where key = 'SRC-REBELS'), 'human', '설명회', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0065-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0065'), 'meaning', 'uz', 'tushuntirish yig‘ilishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0066', (select id from public.sources where key = 'SRC-REBELS'), 'human', '시설 확충', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0066-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0066'), 'meaning', 'uz', 'infratuzilmani kengaytirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0067', (select id from public.sources where key = 'SRC-REBELS'), 'human', '예산', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0067-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0067'), 'meaning', 'uz', 'byudjet', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0068', (select id from public.sources where key = 'SRC-REBELS'), 'human', '가해자', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0068-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0068'), 'meaning', 'uz', 'hujumchi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0069', (select id from public.sources where key = 'SRC-REBELS'), 'human', '피해자', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0069-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0069'), 'meaning', 'uz', 'jabrlanuvchi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0070', (select id from public.sources where key = 'SRC-REBELS'), 'human', '소송을 제기하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0070-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0070'), 'meaning', 'uz', 'sud ishini ochmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0071', (select id from public.sources where key = 'SRC-REBELS'), 'human', '분쟁이 생기다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0071-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0071'), 'meaning', 'uz', 'nizo paydo bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0072', (select id from public.sources where key = 'SRC-REBELS'), 'human', '다툼이 생기다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0072-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0072'), 'meaning', 'uz', 'janjal yuz bermoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0073', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-ㄹ/을 것으로 기대되다 / 기대하다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0073-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0073'), 'meaning', 'uz', 'kutilmoqda / umid qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0073-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0073'), '이 제도가 문제를 해결할 수 있을 것으로 기대하고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0073-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0073-EX1'), 'sentence', 'uz', 'Bu tizim muammoni hal qilishi kutilmoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0074', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-ㄹ/을 것으로 예상되다(전망되다)', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0074-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0074'), 'meaning', 'uz', 'kutilmoqda / prognoz qilinmoqda', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0074-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0074'), '부작용을 줄일 수 있을 것으로 예상된다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0074-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0074-EX1'), 'sentence', 'uz', 'Nojo‘ya ta’sirlarni kamaytirish mumkinligi kutilmoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0075', (select id from public.sources where key = 'SRC-REBELS'), 'human', '단적인 예로', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0075-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0075'), 'meaning', 'uz', 'aniq misol sifatida', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0075-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0075'), '최근 K-POP이 세계적으로 인기를 얻고 있다. 단적인 예로 BTS를 들 수 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0075-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0075-EX1'), 'sentence', 'uz', 'Yaqinda K-POP dunyo miqyosida mashhurlikka erishdi. Aniqlik uchun BTS misol bo‘la oladi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0076', (select id from public.sources where key = 'SRC-REBELS'), 'human', '악용되는 사례가 늘고 있다.', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0076-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0076'), 'meaning', 'uz', 'yomon maqsadda foydalanish holatlari ortmoqda', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0076-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0076'), '초소형 카메라가 원래의 목적과 달리 악용되는 사례가 늘고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0076-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0076-EX1'), 'sentence', 'uz', 'Mini kameralar asl maqsaddan tashqari yomon maqsadda ishlatilayotgan holatlar ortmoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0077', (select id from public.sources where key = 'SRC-REBELS'), 'human', '큰 폭으로 오르다', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0077-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0077'), 'meaning', 'uz', 'keskin ko‘tarilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0077-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0077'), '추석 전 소비자 물가가 큰 폭으로 올라 불만의 목소리가 높아지고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0077-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0077-EX1'), 'sentence', 'uz', 'Chusok bayrami oldidan iste’molchi narxlari keskin ko‘tarilib, noroziliklar oshmoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0078', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-은/는 경향이 있다.', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0078-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0078'), 'meaning', 'uz', '… ga moyillik bor', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0078-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0078'), '피로가 쌓이는 것을 중요하지 않게 생각하는 경향이 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0078-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0078-EX1'), 'sentence', 'uz', 'Charchoqqa jiddiy qarashni odatlarida moyillik mavjud.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0079', (select id from public.sources where key = 'SRC-REBELS'), 'human', '잊지 말아야 한다.', null, 1, null, (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0079-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0079'), 'meaning', 'uz', 'unutmaslik kerak', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0079-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0079'), '건강이 무엇보다 중요하다는 것을 잊지 말아야 한다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0079-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0079-EX1'), 'sentence', 'uz', 'Sog‘lik hamma narsadan muhim ekanini unutmaslik kerak.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0080', (select id from public.sources where key = 'SRC-REBELS'), 'human', '원시 시대', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0080-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0080'), 'meaning', 'uz', 'Dastlabki davr', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0081', (select id from public.sources where key = 'SRC-REBELS'), 'human', '삼국 시대', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0081-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0081'), 'meaning', 'uz', 'Uchlik davlatlar davri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0082', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고구려', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0082-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0082'), 'meaning', 'uz', 'Goguryeo', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0083', (select id from public.sources where key = 'SRC-REBELS'), 'human', '백제', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0083-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0083'), 'meaning', 'uz', 'Baekje', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0084', (select id from public.sources where key = 'SRC-REBELS'), 'human', '신라', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0084-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0084'), 'meaning', 'uz', 'Silla', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0085', (select id from public.sources where key = 'SRC-REBELS'), 'human', '가야', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0085-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0085'), 'meaning', 'uz', 'Gaya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0086', (select id from public.sources where key = 'SRC-REBELS'), 'human', '남북국 시대', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0086-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0086'), 'meaning', 'uz', 'Janubiy va Shimoliy davlatlar davri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0087', (select id from public.sources where key = 'SRC-REBELS'), 'human', '발해', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0087-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0087'), 'meaning', 'uz', 'Balhae', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0088', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고려 시대', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0088-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0088'), 'meaning', 'uz', 'Goryeo davri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0089', (select id from public.sources where key = 'SRC-REBELS'), 'human', '조선 시대', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0089-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0089'), 'meaning', 'uz', 'Choson davri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0090', (select id from public.sources where key = 'SRC-REBELS'), 'human', '책', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0090-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0090'), 'meaning', 'uz', 'Kitob', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0091', (select id from public.sources where key = 'SRC-REBELS'), 'human', '도자기', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0091-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0091'), 'meaning', 'uz', 'Keramika', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0092', (select id from public.sources where key = 'SRC-REBELS'), 'human', '그릇', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0092-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0092'), 'meaning', 'uz', 'Idishlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0093', (select id from public.sources where key = 'SRC-REBELS'), 'human', '기와', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0093-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0093'), 'meaning', 'uz', 'Chig‘anoqlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0094', (select id from public.sources where key = 'SRC-REBELS'), 'human', '귀걸이', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0094-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0094'), 'meaning', 'uz', 'Sirg‘alar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0095', (select id from public.sources where key = 'SRC-REBELS'), 'human', '왕관', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0095-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0095'), 'meaning', 'uz', 'Taxt', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0096', (select id from public.sources where key = 'SRC-REBELS'), 'human', '팔찌', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0096-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0096'), 'meaning', 'uz', 'Bilakuzuk', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0097', (select id from public.sources where key = 'SRC-REBELS'), 'human', '탑', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0097-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0097'), 'meaning', 'uz', 'Minora', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0098', (select id from public.sources where key = 'SRC-REBELS'), 'human', '종', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0098-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0098'), 'meaning', 'uz', 'Qo‘ng‘iroq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0099', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불상', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0099-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0099'), 'meaning', 'uz', 'Budda haykali', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0100', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0100-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0100'), 'meaning', 'uz', 'Budda rasmlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0101', (select id from public.sources where key = 'SRC-REBELS'), 'human', '비석', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0101-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0101'), 'meaning', 'uz', 'Yodgorlik toshlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0102', (select id from public.sources where key = 'SRC-REBELS'), 'human', '춤', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0102-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0102'), 'meaning', 'uz', 'Raqqoslik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0103', (select id from public.sources where key = 'SRC-REBELS'), 'human', '노래', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0103-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0103'), 'meaning', 'uz', 'Qo‘shiq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0104', (select id from public.sources where key = 'SRC-REBELS'), 'human', '소리', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0104-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0104'), 'meaning', 'uz', 'Ovoz', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0105', (select id from public.sources where key = 'SRC-REBELS'), 'human', '전통 문화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0105-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0105'), 'meaning', 'uz', 'An’anaviy madaniyat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0106', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공예', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0106-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0106'), 'meaning', 'uz', 'Hunarmandchilik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0107', (select id from public.sources where key = 'SRC-REBELS'), 'human', '천민 (노비, )', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0107-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0107'), 'meaning', 'uz', 'Quyoshqozon (qul, )', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0108', (select id from public.sources where key = 'SRC-REBELS'), 'human', '평민 (농민)', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0108-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0108'), 'meaning', 'uz', 'Oddiy odamlar (dehqonlar)', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0109', (select id from public.sources where key = 'SRC-REBELS'), 'human', '중인 (지방 하급 관리, 역관)', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0109-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0109'), 'meaning', 'uz', 'O‘rta sinf (hududiy past darajadagi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0110', (select id from public.sources where key = 'SRC-REBELS'), 'human', '양반 – Yangi sinf', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0110-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0110'), 'meaning', 'uz', 'qadimgi feodal aristokratiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0111', (select id from public.sources where key = 'SRC-REBELS'), 'human', '귀족', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0111-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0111'), 'meaning', 'uz', 'Zodagonlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0112', (select id from public.sources where key = 'SRC-REBELS'), 'human', '왕족', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0112-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0112'), 'meaning', 'uz', 'Shoh oilasi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0113', (select id from public.sources where key = 'SRC-REBELS'), 'human', '왕', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0113-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0113'), 'meaning', 'uz', 'Shoh', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0114', (select id from public.sources where key = 'SRC-REBELS'), 'human', '임금', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0114-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0114'), 'meaning', 'uz', 'Qirolichalik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0115', (select id from public.sources where key = 'SRC-REBELS'), 'human', '권력', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0115-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0115'), 'meaning', 'uz', 'Hokimiyat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0116', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유물', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0116-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0116'), 'meaning', 'uz', 'Buyumlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0117', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유적', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0117-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0117'), 'meaning', 'uz', 'Qoldiqlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0118', (select id from public.sources where key = 'SRC-REBELS'), 'human', '손상되다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0118-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0118'), 'meaning', 'uz', 'Zarar ko‘rmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0119', (select id from public.sources where key = 'SRC-REBELS'), 'human', '측정하다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0119-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0119'), 'meaning', 'uz', 'O‘lchamoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0120', (select id from public.sources where key = 'SRC-REBELS'), 'human', '복원', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0120-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0120'), 'meaning', 'uz', 'Tiklash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0121', (select id from public.sources where key = 'SRC-REBELS'), 'human', '보존', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0121-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0121'), 'meaning', 'uz', 'Saqlash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0122', (select id from public.sources where key = 'SRC-REBELS'), 'human', '발굴', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0122-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0122'), 'meaning', 'uz', 'Qazish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0123', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유네스코 세계(기록, 자연, 문화)유산', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0123-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0123'), 'meaning', 'uz', 'UNESCO', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0124', (select id from public.sources where key = 'SRC-REBELS'), 'human', '등재되다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0124-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0124'), 'meaning', 'uz', 'Ro‘yxatga olinmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0125', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유출되다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0125-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0125'), 'meaning', 'uz', 'Tashqariga chiqarilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0126', (select id from public.sources where key = 'SRC-REBELS'), 'human', '환수', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0126-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0126'), 'meaning', 'uz', 'Qaytarib olish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0127', (select id from public.sources where key = 'SRC-REBELS'), 'human', '반환', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0127-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0127'), 'meaning', 'uz', 'Qaytarish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0128', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대여', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0128-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0128'), 'meaning', 'uz', 'Ijaraga berish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0129', (select id from public.sources where key = 'SRC-REBELS'), 'human', '전승하다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0129-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0129'), 'meaning', 'uz', 'Meros qilib qoldirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0130', (select id from public.sources where key = 'SRC-REBELS'), 'human', '육성하다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0130-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0130'), 'meaning', 'uz', 'Tarbiyalamoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0131', (select id from public.sources where key = 'SRC-REBELS'), 'human', '그림', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0131-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0131'), 'meaning', 'uz', 'Rasm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0132', (select id from public.sources where key = 'SRC-REBELS'), 'human', '풍경화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0132-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0132'), 'meaning', 'uz', 'Manzara rasmi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0133', (select id from public.sources where key = 'SRC-REBELS'), 'human', '정물화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0133-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0133'), 'meaning', 'uz', 'Ob’ekt rasm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0134', (select id from public.sources where key = 'SRC-REBELS'), 'human', '초상화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0134-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0134'), 'meaning', 'uz', 'Portret', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0135', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자화상', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0135-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0135'), 'meaning', 'uz', 'O‘z portreti', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0136', (select id from public.sources where key = 'SRC-REBELS'), 'human', '산수화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0136-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0136'), 'meaning', 'uz', 'Landshaft rasm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0137', (select id from public.sources where key = 'SRC-REBELS'), 'human', '세밀화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0137-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0137'), 'meaning', 'uz', 'Detallangan rasm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0138', (select id from public.sources where key = 'SRC-REBELS'), 'human', '추상화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0138-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0138'), 'meaning', 'uz', 'Abstrakt rasm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0139', (select id from public.sources where key = 'SRC-REBELS'), 'human', '스케치', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0139-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0139'), 'meaning', 'uz', 'Eskiz', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0140', (select id from public.sources where key = 'SRC-REBELS'), 'human', '조각', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0140-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0140'), 'meaning', 'uz', 'Haykaltaroshlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0141', (select id from public.sources where key = 'SRC-REBELS'), 'human', '판화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0141-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0141'), 'meaning', 'uz', 'G‘oya rasm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0142', (select id from public.sources where key = 'SRC-REBELS'), 'human', '색채', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0142-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0142'), 'meaning', 'uz', 'Ranglar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0143', (select id from public.sources where key = 'SRC-REBELS'), 'human', '물감', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0143-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0143'), 'meaning', 'uz', 'Bo‘yoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0144', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0144-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0144'), 'meaning', 'uz', 'Yog‘li bo‘yoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0145', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수채화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0145-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0145'), 'meaning', 'uz', 'Suv bo‘yoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0146', (select id from public.sources where key = 'SRC-REBELS'), 'human', '섞다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0146-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0146'), 'meaning', 'uz', 'Aralashtirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0147', (select id from public.sources where key = 'SRC-REBELS'), 'human', '바르다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0147-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0147'), 'meaning', 'uz', 'Surmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0148', (select id from public.sources where key = 'SRC-REBELS'), 'human', '칠하다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0148-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0148'), 'meaning', 'uz', 'Yopmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0149', (select id from public.sources where key = 'SRC-REBELS'), 'human', '덧칠하다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0149-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0149'), 'meaning', 'uz', 'Qoplamoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0150', (select id from public.sources where key = 'SRC-REBELS'), 'human', '디자인', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0150-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0150'), 'meaning', 'uz', 'Dizayn', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0151', (select id from public.sources where key = 'SRC-REBELS'), 'human', '문양', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0151-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0151'), 'meaning', 'uz', 'Nakshta', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0152', (select id from public.sources where key = 'SRC-REBELS'), 'human', '순수 예술', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0152-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0152'), 'meaning', 'uz', 'Sof san’at', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0153', (select id from public.sources where key = 'SRC-REBELS'), 'human', '종합 예술', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0153-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0153'), 'meaning', 'uz', 'Umumiy san’at', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0154', (select id from public.sources where key = 'SRC-REBELS'), 'human', '조형 미술', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0154-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0154'), 'meaning', 'uz', 'Shakl san’ati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0155', (select id from public.sources where key = 'SRC-REBELS'), 'human', '생활 미술', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0155-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0155'), 'meaning', 'uz', 'Hayot san’ati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0156', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고전주의', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0156-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0156'), 'meaning', 'uz', 'Klassitsizm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0157', (select id from public.sources where key = 'SRC-REBELS'), 'human', '낭만주의', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0157-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0157'), 'meaning', 'uz', 'Romantizm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0158', (select id from public.sources where key = 'SRC-REBELS'), 'human', '사실주의', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0158-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0158'), 'meaning', 'uz', 'Realizm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0159', (select id from public.sources where key = 'SRC-REBELS'), 'human', '초현실주의', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0159-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0159'), 'meaning', 'uz', 'Surrealizm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0160', (select id from public.sources where key = 'SRC-REBELS'), 'human', '현대주의', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0160-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0160'), 'meaning', 'uz', 'Zamonaviyizm', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0161', (select id from public.sources where key = 'SRC-REBELS'), 'human', '시', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0161-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0161'), 'meaning', 'uz', 'She’r', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0162', (select id from public.sources where key = 'SRC-REBELS'), 'human', '소설', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0162-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0162'), 'meaning', 'uz', 'Roman', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0163', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수필', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0163-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0163'), 'meaning', 'uz', 'Essé', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0164', (select id from public.sources where key = 'SRC-REBELS'), 'human', '허구', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0164-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0164'), 'meaning', 'uz', 'Xayol', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0165', (select id from public.sources where key = 'SRC-REBELS'), 'human', '실화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0165-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0165'), 'meaning', 'uz', 'Haqiqiy voqea', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0166', (select id from public.sources where key = 'SRC-REBELS'), 'human', '해방감', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0166-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0166'), 'meaning', 'uz', 'Ozodlik hissi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0167', (select id from public.sources where key = 'SRC-REBELS'), 'human', '연대감', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0167-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0167'), 'meaning', 'uz', 'Hamjihatlik hissi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0168', (select id from public.sources where key = 'SRC-REBELS'), 'human', '즐거움', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0168-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0168'), 'meaning', 'uz', 'Xursandchilik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0169', (select id from public.sources where key = 'SRC-REBELS'), 'human', '죄책감', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0169-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0169'), 'meaning', 'uz', 'Aybni his qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0170', (select id from public.sources where key = 'SRC-REBELS'), 'human', '감정을 배제하다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0170-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0170'), 'meaning', 'uz', 'Hissiyotlarni chetlab o‘tish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0171', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이국적', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0171-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0171'), 'meaning', 'uz', 'Yagona, ekzotik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0172', (select id from public.sources where key = 'SRC-REBELS'), 'human', '실용적', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0172-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0172'), 'meaning', 'uz', 'Amaliy', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0173', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자유분방하다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0173-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0173'), 'meaning', 'uz', 'Ozod va erkin bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0174', (select id from public.sources where key = 'SRC-REBELS'), 'human', '다산', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0174-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0174'), 'meaning', 'uz', 'Ko‘p farzand', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0175', (select id from public.sources where key = 'SRC-REBELS'), 'human', '풍요', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0175-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0175'), 'meaning', 'uz', 'Boylik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0176', (select id from public.sources where key = 'SRC-REBELS'), 'human', '욕망', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0176-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0176'), 'meaning', 'uz', 'Istak', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0177', (select id from public.sources where key = 'SRC-REBELS'), 'human', '협동', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0177-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0177'), 'meaning', 'uz', 'Hamkorlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0178', (select id from public.sources where key = 'SRC-REBELS'), 'human', '조화', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0178-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0178'), 'meaning', 'uz', 'Moslik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0179', (select id from public.sources where key = 'SRC-REBELS'), 'human', '동참', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0179-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0179'), 'meaning', 'uz', 'Ishtirok etish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0180', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'N로/으로 인정을 받다 / N을/를 인정받다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0180-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0180'), 'meaning', 'uz', 'N sifatida tan olish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0181', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-가시적 / 가시적인 / 가시적으로', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0181-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0181'), 'meaning', 'uz', 'Ko‘zga ko‘rinadigan / aniqlanadigan', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0182', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자발적 / 자발적인 / 자발적으로', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0182-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0182'), 'meaning', 'uz', 'Erkin / o‘z xohishi bilan', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0183', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이러한 현상의 영향으로', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0183-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0183'), 'meaning', 'uz', 'Ushbu hodisaning ta’siri bilan', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0184', (select id from public.sources where key = 'SRC-REBELS'), 'human', '염두에 두다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0184-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0184'), 'meaning', 'uz', 'E’tiborga olish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0185', (select id from public.sources where key = 'SRC-REBELS'), 'human', '~을/ㄹ 수 있는 방안 마련이 필요하다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0185-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0185'), 'meaning', 'uz', '~ni saqlash imkonini yaratish zarur', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0186', (select id from public.sources where key = 'SRC-REBELS'), 'human', '을/를 비판하는 사람들이 많다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0186-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0186'), 'meaning', 'uz', '~ni tanqid qiluvchi ko‘p', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0187', (select id from public.sources where key = 'SRC-REBELS'), 'human', '빛을 보다 / 빛을 보지 못하다', null, 1, null, (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0187-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0187'), 'meaning', 'uz', 'Nur ko‘rmoq / nur ko‘rmaslik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0188', (select id from public.sources where key = 'SRC-REBELS'), 'human', '중력', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0188-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0188'), 'meaning', 'uz', 'jismoniy tortish kuchi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0189', (select id from public.sources where key = 'SRC-REBELS'), 'human', '원심력', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0189-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0189'), 'meaning', 'uz', 'markazdan tashqariga qarab tortuvchi kuch', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0190', (select id from public.sources where key = 'SRC-REBELS'), 'human', '구심력', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0190-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0190'), 'meaning', 'uz', 'markazga tortuvchi kuch', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0191', (select id from public.sources where key = 'SRC-REBELS'), 'human', '원동력', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0191-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0191'), 'meaning', 'uz', 'quvvat, harakatga keltiruvchi kuch', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0192', (select id from public.sources where key = 'SRC-REBELS'), 'human', '상상력', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0192-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0192'), 'meaning', 'uz', 'tasavvur kuchi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0193', (select id from public.sources where key = 'SRC-REBELS'), 'human', '마찰력', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0193-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0193'), 'meaning', 'uz', 'ishqalanish kuchi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0194', (select id from public.sources where key = 'SRC-REBELS'), 'human', '회전', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0194-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0194'), 'meaning', 'uz', 'aylanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0195', (select id from public.sources where key = 'SRC-REBELS'), 'human', '파장', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0195-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0195'), 'meaning', 'uz', 'to‘lqin uzunligi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0196', (select id from public.sources where key = 'SRC-REBELS'), 'human', '굴절', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0196-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0196'), 'meaning', 'uz', 'buralish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0197', (select id from public.sources where key = 'SRC-REBELS'), 'human', '채광', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0197-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0197'), 'meaning', 'uz', 'yoritish, tabiiy yorug‘likdan foydalanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0198', (select id from public.sources where key = 'SRC-REBELS'), 'human', '강하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0198-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0198'), 'meaning', 'uz', 'kuchli', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0199', (select id from public.sources where key = 'SRC-REBELS'), 'human', '약하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0199-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0199'), 'meaning', 'uz', 'zaif', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0200', (select id from public.sources where key = 'SRC-REBELS'), 'human', '뿌옇다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0200-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0200'), 'meaning', 'uz', 'tumanli', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0201', (select id from public.sources where key = 'SRC-REBELS'), 'human', '흐리다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0201-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0201'), 'meaning', 'uz', 'bulutli', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0202', (select id from public.sources where key = 'SRC-REBELS'), 'human', '선명하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0202-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0202'), 'meaning', 'uz', 'aniq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0203', (select id from public.sources where key = 'SRC-REBELS'), 'human', '도달하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0203-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0203'), 'meaning', 'uz', 'yetib borish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0204', (select id from public.sources where key = 'SRC-REBELS'), 'human', '통과하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0204-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0204'), 'meaning', 'uz', 'o‘tish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0205', (select id from public.sources where key = 'SRC-REBELS'), 'human', '반사되다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0205-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0205'), 'meaning', 'uz', 'aks etish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0206', (select id from public.sources where key = 'SRC-REBELS'), 'human', '입자', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0206-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0206'), 'meaning', 'uz', 'zarrachalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0207', (select id from public.sources where key = 'SRC-REBELS'), 'human', '알갱이', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0207-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0207'), 'meaning', 'uz', 'kichik zarrachalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0208', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수증기', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0208-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0208'), 'meaning', 'uz', 'bug‘, suv bug‘i', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0209', (select id from public.sources where key = 'SRC-REBELS'), 'human', '오므라들다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0209-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0209'), 'meaning', 'uz', 'siqilish, qisqarish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0210', (select id from public.sources where key = 'SRC-REBELS'), 'human', '새어 나가다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0210-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0210'), 'meaning', 'uz', 'tashqariga chiqish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0211', (select id from public.sources where key = 'SRC-REBELS'), 'human', '빠져 나가다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0211-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0211'), 'meaning', 'uz', 'chiqib ketish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0212', (select id from public.sources where key = 'SRC-REBELS'), 'human', '산소', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0212-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0212'), 'meaning', 'uz', 'kislorod', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0213', (select id from public.sources where key = 'SRC-REBELS'), 'human', '질소', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0213-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0213'), 'meaning', 'uz', 'azot', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0214', (select id from public.sources where key = 'SRC-REBELS'), 'human', '산화열', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0214-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0214'), 'meaning', 'uz', 'oksidlanish issiqligi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0215', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대기', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0215-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0215'), 'meaning', 'uz', 'atmosfera', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0216', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대기층', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0216-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0216'), 'meaning', 'uz', 'atmosfera qatlamlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0217', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대류', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0217-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0217'), 'meaning', 'uz', 'konveksiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0218', (select id from public.sources where key = 'SRC-REBELS'), 'human', '단열', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0218-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0218'), 'meaning', 'uz', 'izolyatsiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0219', (select id from public.sources where key = 'SRC-REBELS'), 'human', '환기', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0219-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0219'), 'meaning', 'uz', 'havalandirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0220', (select id from public.sources where key = 'SRC-REBELS'), 'human', '숨구멍', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0220-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0220'), 'meaning', 'uz', 'nafas olish teshigi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0221', (select id from public.sources where key = 'SRC-REBELS'), 'human', '단서', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0221-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0221'), 'meaning', 'uz', 'dalil', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0222', (select id from public.sources where key = 'SRC-REBELS'), 'human', '혈흔', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0222-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0222'), 'meaning', 'uz', 'qon izlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0223', (select id from public.sources where key = 'SRC-REBELS'), 'human', '발자국', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0223-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0223'), 'meaning', 'uz', 'oyoq izlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0224', (select id from public.sources where key = 'SRC-REBELS'), 'human', '파편', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0224-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0224'), 'meaning', 'uz', 'bo‘laklar, parchalangan qismlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0225', (select id from public.sources where key = 'SRC-REBELS'), 'human', '목소리', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0225-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0225'), 'meaning', 'uz', 'ovoz', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0226', (select id from public.sources where key = 'SRC-REBELS'), 'human', '추정하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0226-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0226'), 'meaning', 'uz', 'taxmin qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0227', (select id from public.sources where key = 'SRC-REBELS'), 'human', '재현하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0227-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0227'), 'meaning', 'uz', 'takrorlash, tiklash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0228', (select id from public.sources where key = 'SRC-REBELS'), 'human', '사건', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0228-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0228'), 'meaning', 'uz', 'hodisa, voqea', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0229', (select id from public.sources where key = 'SRC-REBELS'), 'human', '채취하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0229-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0229'), 'meaning', 'uz', 'olib olish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0230', (select id from public.sources where key = 'SRC-REBELS'), 'human', '물', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0230-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0230'), 'meaning', 'uz', 'suv', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0231', (select id from public.sources where key = 'SRC-REBELS'), 'human', '단백질', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0231-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0231'), 'meaning', 'uz', 'oqsil', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0232', (select id from public.sources where key = 'SRC-REBELS'), 'human', '항균 물질', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0232-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0232'), 'meaning', 'uz', 'antibakterial modda', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0233', (select id from public.sources where key = 'SRC-REBELS'), 'human', '노폐물', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0233-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0233'), 'meaning', 'uz', 'yig‘ilgan chiqindilar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0234', (select id from public.sources where key = 'SRC-REBELS'), 'human', '미생물', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0234-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0234'), 'meaning', 'uz', 'mikroorganizmlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0235', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불순물', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0235-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0235'), 'meaning', 'uz', 'aralashmalar, noxush moddalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0236', (select id from public.sources where key = 'SRC-REBELS'), 'human', '무인 자동차', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0236-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0236'), 'meaning', 'uz', 'haydovchisiz avtomobil', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0237', (select id from public.sources where key = 'SRC-REBELS'), 'human', '바이오 산업', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0237-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0237'), 'meaning', 'uz', 'biotexnologiya sanoati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0238', (select id from public.sources where key = 'SRC-REBELS'), 'human', '원천 기술', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0238-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0238'), 'meaning', 'uz', 'asl texnologiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0239', (select id from public.sources where key = 'SRC-REBELS'), 'human', '원리', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0239-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0239'), 'meaning', 'uz', 'printsip', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0240', (select id from public.sources where key = 'SRC-REBELS'), 'human', '적용하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0240-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0240'), 'meaning', 'uz', 'qo‘llash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0241', (select id from public.sources where key = 'SRC-REBELS'), 'human', '특허', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0241-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0241'), 'meaning', 'uz', 'patent', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0242', (select id from public.sources where key = 'SRC-REBELS'), 'human', '특허권', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0242-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0242'), 'meaning', 'uz', 'patent huquqi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0243', (select id from public.sources where key = 'SRC-REBELS'), 'human', '출원', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0243-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0243'), 'meaning', 'uz', 'ariza berish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0244', (select id from public.sources where key = 'SRC-REBELS'), 'human', '등록', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0244-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0244'), 'meaning', 'uz', 'ro‘yxatdan o‘tkazish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0245', (select id from public.sources where key = 'SRC-REBELS'), 'human', '착안하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0245-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0245'), 'meaning', 'uz', 'diqqatni jalb qilish, e’tibor berish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0246', (select id from public.sources where key = 'SRC-REBELS'), 'human', '인공지능', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0246-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0246'), 'meaning', 'uz', 'sun’iy intellekt', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0247', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지식서비스', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0247-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0247'), 'meaning', 'uz', 'bilim xizmatlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0248', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유도하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0248-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0248'), 'meaning', 'uz', 'yo‘naltirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0249', (select id from public.sources where key = 'SRC-REBELS'), 'human', '독려하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0249-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0249'), 'meaning', 'uz', 'rag‘batlantirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0250', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지지하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0250-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0250'), 'meaning', 'uz', 'qo‘llab-quvvatlash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0251', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고무적이다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0251-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0251'), 'meaning', 'uz', 'ilhomlantiruvchi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0252', (select id from public.sources where key = 'SRC-REBELS'), 'human', '혁신적이다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0252-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0252'), 'meaning', 'uz', 'innovatsion', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0253', (select id from public.sources where key = 'SRC-REBELS'), 'human', '우려하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0253-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0253'), 'meaning', 'uz', 'havotirlanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0254', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지원하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0254-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0254'), 'meaning', 'uz', 'yordam berish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0255', (select id from public.sources where key = 'SRC-REBELS'), 'human', '전망하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0255-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0255'), 'meaning', 'uz', 'kelajakni ko‘rish, taxmin qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0256', (select id from public.sources where key = 'SRC-REBELS'), 'human', '무기력하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0256-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0256'), 'meaning', 'uz', 'quvvatdan mahrum bo‘lish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0257', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대비하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0257-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0257'), 'meaning', 'uz', 'tayyorlanish, oldindan tayyorlash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0258', (select id from public.sources where key = 'SRC-REBELS'), 'human', '예측하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0258-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0258'), 'meaning', 'uz', 'oldindan bashorat qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0259', (select id from public.sources where key = 'SRC-REBELS'), 'human', '반성하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0259-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0259'), 'meaning', 'uz', 'o‘zini tahlil qilish, qayta o‘ylash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0260', (select id from public.sources where key = 'SRC-REBELS'), 'human', '효율', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0260-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0260'), 'meaning', 'uz', 'samaradorlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0261', (select id from public.sources where key = 'SRC-REBELS'), 'human', '손실', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0261-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0261'), 'meaning', 'uz', 'yo‘qotish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0262', (select id from public.sources where key = 'SRC-REBELS'), 'human', '친환경', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0262-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0262'), 'meaning', 'uz', 'atrof-muhitga do‘st', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0263', (select id from public.sources where key = 'SRC-REBELS'), 'human', '절감', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0263-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0263'), 'meaning', 'uz', 'tejamkorlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0264', (select id from public.sources where key = 'SRC-REBELS'), 'human', '절약', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0264-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0264'), 'meaning', 'uz', 'tejash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0265', (select id from public.sources where key = 'SRC-REBELS'), 'human', '(중요한/큰/결정적인) 역할을 하다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0265-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0265'), '이 증거가 사건을 해결하는 데 결정적인 역할을 했다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0265-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0265-EX1'), 'sentence', 'uz', '(Muhim/Katta/Qaroriy) rol o‘ynash', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0266', (select id from public.sources where key = 'SRC-REBELS'), 'human', '단지 ~~이/가 아니라', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0266-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0266'), '단지 에너지의 절약만이 아니라 환경의 보호를 위해서도 중요한 일이다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0266-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0266-EX1'), 'sentence', 'uz', 'Faqat ~~ emas', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0267', (select id from public.sources where key = 'SRC-REBELS'), 'human', '~은/는 현상이 두드러지게 나타나다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0267-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0267'), '요즘 남자와 여자의 역할에 구분이 없어지는 현상이 두드러지게 나타나고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0267-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0267-EX1'), 'sentence', 'uz', '~ ning hodisasi sezilarli darajada ko‘rinishi ko‘rinmoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0268', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'ㄹ/을 가능성이 (크다/높다/낮다)', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0268-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0268'), '현재의 상황으로 볼 때 드론이 많은 부분에 활용될 가능성이 높다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0268-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0268-EX1'), 'sentence', 'uz', '~ qilish ehtimoli (yirik/yuqori/past)', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0269', (select id from public.sources where key = 'SRC-REBELS'), 'human', '상황이 점점 심각해지다', null, 1, null, (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0269-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0269'), '발전소 건설로 인해 주민들의 피해 상황이 점점 심각해지고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0269-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0269-EX1'), 'sentence', 'uz', 'Vaziyat tobora jiddiylashmoq', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0270', (select id from public.sources where key = 'SRC-REBELS'), 'human', '상품', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0270-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0270'), 'meaning', 'uz', 'mahsulot', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0271', (select id from public.sources where key = 'SRC-REBELS'), 'human', '물건', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0271-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0271'), 'meaning', 'uz', 'tovar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0272', (select id from public.sources where key = 'SRC-REBELS'), 'human', '제품', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0272-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0272'), 'meaning', 'uz', 'ishlab chiqarilgan mahsulot', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0273', (select id from public.sources where key = 'SRC-REBELS'), 'human', '개발', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0273-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0273'), 'meaning', 'uz', 'ishlab chiqish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0274', (select id from public.sources where key = 'SRC-REBELS'), 'human', '제작', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0274-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0274'), 'meaning', 'uz', 'yaratish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0275', (select id from public.sources where key = 'SRC-REBELS'), 'human', '생산', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0275-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0275'), 'meaning', 'uz', 'ishlab chiqarish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0276', (select id from public.sources where key = 'SRC-REBELS'), 'human', '판매', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0276-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0276'), 'meaning', 'uz', 'sotish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0277', (select id from public.sources where key = 'SRC-REBELS'), 'human', '홍보', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0277-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0277'), 'meaning', 'uz', 'reklama', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0278', (select id from public.sources where key = 'SRC-REBELS'), 'human', '마케팅', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0278-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0278'), 'meaning', 'uz', 'marketing', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0279', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유통', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0279-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0279'), 'meaning', 'uz', 'tarqatish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0280', (select id from public.sources where key = 'SRC-REBELS'), 'human', '출하', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0280-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0280'), 'meaning', 'uz', 'yuborish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0281', (select id from public.sources where key = 'SRC-REBELS'), 'human', '경쟁력', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0281-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0281'), 'meaning', 'uz', 'raqobatbardoshlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0282', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수익', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0282-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0282'), 'meaning', 'uz', 'foyda', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0283', (select id from public.sources where key = 'SRC-REBELS'), 'human', '저금하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0283-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0283'), 'meaning', 'uz', 'jamg‘arish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0284', (select id from public.sources where key = 'SRC-REBELS'), 'human', '원금', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0284-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0284'), 'meaning', 'uz', 'asliyot', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0285', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이자', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0285-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0285'), 'meaning', 'uz', 'foyda', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0286', (select id from public.sources where key = 'SRC-REBELS'), 'human', '적금', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0286-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0286'), 'meaning', 'uz', 'jamg‘arma', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0287', (select id from public.sources where key = 'SRC-REBELS'), 'human', '예금', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0287-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0287'), 'meaning', 'uz', 'depozit', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0288', (select id from public.sources where key = 'SRC-REBELS'), 'human', '펀드', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0288-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0288'), 'meaning', 'uz', 'fond', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0289', (select id from public.sources where key = 'SRC-REBELS'), 'human', '주식', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0289-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0289'), 'meaning', 'uz', 'aktsiyalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0290', (select id from public.sources where key = 'SRC-REBELS'), 'human', '통장', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0290-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0290'), 'meaning', 'uz', 'hisob varaqasi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0291', (select id from public.sources where key = 'SRC-REBELS'), 'human', '계좌번호', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0291-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0291'), 'meaning', 'uz', 'hisob raqami', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0292', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이체', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0292-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0292'), 'meaning', 'uz', 'o‘tkazma', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0293', (select id from public.sources where key = 'SRC-REBELS'), 'human', '송금', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0293-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0293'), 'meaning', 'uz', 'pul yuborish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0294', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수수료', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0294-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0294'), 'meaning', 'uz', 'komissiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0295', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 투자하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0295-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0295'), 'meaning', 'uz', 'investitsiya qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0296', (select id from public.sources where key = 'SRC-REBELS'), 'human', '사다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0296-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0296'), 'meaning', 'uz', 'sotib olish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0297', (select id from public.sources where key = 'SRC-REBELS'), 'human', '구입하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0297-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0297'), 'meaning', 'uz', 'harid qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0298', (select id from public.sources where key = 'SRC-REBELS'), 'human', '구매하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0298-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0298'), 'meaning', 'uz', 'sotib olish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0299', (select id from public.sources where key = 'SRC-REBELS'), 'human', '충동구매', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0299-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0299'), 'meaning', 'uz', 'impulsiv xarid', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0300', (select id from public.sources where key = 'SRC-REBELS'), 'human', '쇼핑', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0300-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0300'), 'meaning', 'uz', 'xarid qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0301', (select id from public.sources where key = 'SRC-REBELS'), 'human', '추천', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0301-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0301'), 'meaning', 'uz', 'tavsiyalash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0302', (select id from public.sources where key = 'SRC-REBELS'), 'human', '교환', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0302-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0302'), 'meaning', 'uz', 'almashish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0303', (select id from public.sources where key = 'SRC-REBELS'), 'human', '환불', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0303-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0303'), 'meaning', 'uz', 'pulni qaytarish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0304', (select id from public.sources where key = 'SRC-REBELS'), 'human', '결제', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0304-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0304'), 'meaning', 'uz', 'to‘lov', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0305', (select id from public.sources where key = 'SRC-REBELS'), 'human', '상품평', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0305-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0305'), 'meaning', 'uz', 'mahsulot sharhi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0306', (select id from public.sources where key = 'SRC-REBELS'), 'human', '검색', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0306-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0306'), 'meaning', 'uz', 'qidirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0307', (select id from public.sources where key = 'SRC-REBELS'), 'human', '소비심리', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0307-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0307'), 'meaning', 'uz', 'iste’mol ruhiyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0308', (select id from public.sources where key = 'SRC-REBELS'), 'human', '소득', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0308-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0308'), 'meaning', 'uz', 'daromad', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0309', (select id from public.sources where key = 'SRC-REBELS'), 'human', '호황', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0309-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0309'), 'meaning', 'uz', 'o‘sish davri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0310', (select id from public.sources where key = 'SRC-REBELS'), 'human', '활황', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0310-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0310'), 'meaning', 'uz', 'faollik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0311', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불황', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0311-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0311'), 'meaning', 'uz', 'tanazzul', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0312', (select id from public.sources where key = 'SRC-REBELS'), 'human', '과잉', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0312-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0312'), 'meaning', 'uz', 'ortiqcha', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0313', (select id from public.sources where key = 'SRC-REBELS'), 'human', '물가 상승', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0313-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0313'), 'meaning', 'uz', 'narxlarning o‘sishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0314', (select id from public.sources where key = 'SRC-REBELS'), 'human', '(생산, 공급, 물가) 불안', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0314-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0314'), 'meaning', 'uz', 'tashvish, noaniqlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0315', (select id from public.sources where key = 'SRC-REBELS'), 'human', '안정', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0315-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0315'), 'meaning', 'uz', 'barqarorlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0316', (select id from public.sources where key = 'SRC-REBELS'), 'human', '급등', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0316-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0316'), 'meaning', 'uz', 'keskin o‘sish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0317', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불경기', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0317-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0317'), 'meaning', 'uz', 'qiyin iqtisodiy holat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0318', (select id from public.sources where key = 'SRC-REBELS'), 'human', '긴축 경제', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0318-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0318'), 'meaning', 'uz', 'qattiq iqtisodiy siyosat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0319', (select id from public.sources where key = 'SRC-REBELS'), 'human', '성장률', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0319-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0319'), 'meaning', 'uz', 'o‘sish sur’ati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0320', (select id from public.sources where key = 'SRC-REBELS'), 'human', '균형 발전', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0320-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0320'), 'meaning', 'uz', 'muvozanatli rivojlanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0321', (select id from public.sources where key = 'SRC-REBELS'), 'human', '적자', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0321-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0321'), 'meaning', 'uz', 'kamomad', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0322', (select id from public.sources where key = 'SRC-REBELS'), 'human', '흑자', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0322-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0322'), 'meaning', 'uz', 'foyda', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0323', (select id from public.sources where key = 'SRC-REBELS'), 'human', '억제', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0323-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0323'), 'meaning', 'uz', 'cheklash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0324', (select id from public.sources where key = 'SRC-REBELS'), 'human', '저렴하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0324-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0324'), 'meaning', 'uz', 'arzon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0325', (select id from public.sources where key = 'SRC-REBELS'), 'human', '싸다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0325-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0325'), 'meaning', 'uz', 'arzon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0326', (select id from public.sources where key = 'SRC-REBELS'), 'human', '비싸다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0326-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0326'), 'meaning', 'uz', 'qimmat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0327', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고가', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0327-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0327'), 'meaning', 'uz', 'yuqori narx', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0328', (select id from public.sources where key = 'SRC-REBELS'), 'human', '가성비', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0328-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0328'), 'meaning', 'uz', 'narx va sifatga nisbatan qiymat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0329', (select id from public.sources where key = 'SRC-REBELS'), 'human', '합리적인 가격', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0329-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0329'), 'meaning', 'uz', 'maqbul narx', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0330', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지폐', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0330-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0330'), 'meaning', 'uz', 'pul', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0331', (select id from public.sources where key = 'SRC-REBELS'), 'human', '위조', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0331-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0331'), 'meaning', 'uz', 'soxta', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0332', (select id from public.sources where key = 'SRC-REBELS'), 'human', '동전', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0332-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0332'), 'meaning', 'uz', 'pul tanga', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0333', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수표', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0333-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0333'), 'meaning', 'uz', 'chek', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0334', (select id from public.sources where key = 'SRC-REBELS'), 'human', '일시불', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0334-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0334'), 'meaning', 'uz', 'bir to‘lovda', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0335', (select id from public.sources where key = 'SRC-REBELS'), 'human', '할부', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0335-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0335'), 'meaning', 'uz', 'bo‘lib to‘lash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0336', (select id from public.sources where key = 'SRC-REBELS'), 'human', '무이자', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0336-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0336'), 'meaning', 'uz', 'foyidasiz', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0337', (select id from public.sources where key = 'SRC-REBELS'), 'human', '인하', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0337-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0337'), 'meaning', 'uz', 'pasayish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0338', (select id from public.sources where key = 'SRC-REBELS'), 'human', '인상', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0338-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0338'), 'meaning', 'uz', 'oshirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0339', (select id from public.sources where key = 'SRC-REBELS'), 'human', '책정하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0339-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0339'), 'meaning', 'uz', 'belgilash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0340', (select id from public.sources where key = 'SRC-REBELS'), 'human', '소비자가', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0340-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0340'), 'meaning', 'uz', 'iste’molchi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0341', (select id from public.sources where key = 'SRC-REBELS'), 'human', '판매가', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0341-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0341'), 'meaning', 'uz', 'sotuv narxi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0342', (select id from public.sources where key = 'SRC-REBELS'), 'human', '설치하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0342-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0342'), 'meaning', 'uz', 'o‘rnatish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0343', (select id from public.sources where key = 'SRC-REBELS'), 'human', '건설하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0343-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0343'), 'meaning', 'uz', 'bino qurish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0344', (select id from public.sources where key = 'SRC-REBELS'), 'human', '설계하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0344-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0344'), 'meaning', 'uz', 'loyihalash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0345', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공사하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0345-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0345'), 'meaning', 'uz', 'qurilish ishlarini bajarish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0346', (select id from public.sources where key = 'SRC-REBELS'), 'human', '편익', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0346-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0346'), 'meaning', 'uz', 'foyda', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0347', (select id from public.sources where key = 'SRC-REBELS'), 'human', '비용', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0347-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0347'), 'meaning', 'uz', 'xarajat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0348', (select id from public.sources where key = 'SRC-REBELS'), 'human', '타당성', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0348-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0348'), 'meaning', 'uz', 'asoslilik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0349', (select id from public.sources where key = 'SRC-REBELS'), 'human', '효율성', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0349-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0349'), 'meaning', 'uz', 'samaradorlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0350', (select id from public.sources where key = 'SRC-REBELS'), 'human', '추진가능성', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0350-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0350'), 'meaning', 'uz', 'amaliyotga joriy qilish imkoniyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0351', (select id from public.sources where key = 'SRC-REBELS'), 'human', '전문가 의견', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0351-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0351'), 'meaning', 'uz', 'mutaxassis fikri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0352', (select id from public.sources where key = 'SRC-REBELS'), 'human', '환경 영향 평가', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0352-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0352'), 'meaning', 'uz', 'atmosfera ta’sirini baholash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0353', (select id from public.sources where key = 'SRC-REBELS'), 'human', '기한', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0353-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0353'), 'meaning', 'uz', 'muddat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0354', (select id from public.sources where key = 'SRC-REBELS'), 'human', '검토하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0354-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0354'), 'meaning', 'uz', 'ko‘rib chiqish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0355', (select id from public.sources where key = 'SRC-REBELS'), 'human', '결정하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0355-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0355'), 'meaning', 'uz', 'qaror qabul qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0356', (select id from public.sources where key = 'SRC-REBELS'), 'human', '주저하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0356-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0356'), 'meaning', 'uz', 'ikkilanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0357', (select id from public.sources where key = 'SRC-REBELS'), 'human', '망설이다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0357-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0357'), 'meaning', 'uz', 'shubhalanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0358', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유보하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0358-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0358'), 'meaning', 'uz', 'kechiktirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0359', (select id from public.sources where key = 'SRC-REBELS'), 'human', '확신하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0359-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0359'), 'meaning', 'uz', 'ishonch hosil qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0360', (select id from public.sources where key = 'SRC-REBELS'), 'human', '추진하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0360-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0360'), 'meaning', 'uz', 'boshlash, ilgari surish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0361', (select id from public.sources where key = 'SRC-REBELS'), 'human', '도입하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0361-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0361'), 'meaning', 'uz', 'kiritish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0362', (select id from public.sources where key = 'SRC-REBELS'), 'human', '염려하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0362-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0362'), 'meaning', 'uz', 'havotirlanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0363', (select id from public.sources where key = 'SRC-REBELS'), 'human', '촉구하다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0363-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0363'), 'meaning', 'uz', 'majbur qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0364', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공짜(무료)로 끼워주다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0364-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0364'), 'meaning', 'uz', 'Bepul (harajat) bilan berish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0364-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0364'), '무료로 끼워주는 상품 때문에 물건을 사는 경우도 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0364-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0364-EX1'), 'sentence', 'uz', 'Bepul beriladigan mahsulot tufayli ba’zida tovar sotib olinadi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0365', (select id from public.sources where key = 'SRC-REBELS'), 'human', '다양한 목적에 따라', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0365-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0365'), 'meaning', 'uz', 'Turli maqsadlar bo‘yicha', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0365-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0365'), '장기적으로 다양한 목적에 따라 자금을 분산시키는 것이 좋다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0365-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0365-EX1'), 'sentence', 'uz', 'Uzoq muddatda turli maqsadlar bo‘yicha mablag‘larni taqsimlash yaxshi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0366', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이러한 문제를 해결하기 위한 방안의 하나로', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0366-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0366'), 'meaning', 'uz', 'Bu muammoni hal qilishning bir yo‘li sifatida', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0366-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0366'), '이러한 문제를 해결하기 위한 방안의 하나로 비대면 회의가 주목받고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0366-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0366-EX1'), 'sentence', 'uz', 'Bu muammoni hal qilishning bir yo‘li sifatida onlayn uchrashuvlar ommalashmoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0367', (select id from public.sources where key = 'SRC-REBELS'), 'human', '단정하기는 어렵다', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0367-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0367'), 'meaning', 'uz', 'Xulosa qilish qiyin', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0367-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0367'), '비대면 교육이 효과가 없다고 단정하기는 어렵다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0367-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0367-EX1'), 'sentence', 'uz', 'Masofaviy ta’limning samarasiz ekanligini aytish qiyin.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0368', (select id from public.sources where key = 'SRC-REBELS'), 'human', '다양한 측면에서', null, 1, null, (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0368-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0368'), 'meaning', 'uz', 'Turli jihatlardan', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0368-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0368'), '해결 방안을 찾기 위해 다양한 측면에서 살펴봐야 한다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0368-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0368-EX1'), 'sentence', 'uz', 'Yechimni topish uchun turli jihatlarni ko‘rib chiqish kerak.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0369', (select id from public.sources where key = 'SRC-REBELS'), 'human', '생태계', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0369-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0369'), 'meaning', 'uz', 'ekotizim', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0370', (select id from public.sources where key = 'SRC-REBELS'), 'human', '개체 수', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0370-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0370'), 'meaning', 'uz', 'individlar soni', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0371', (select id from public.sources where key = 'SRC-REBELS'), 'human', '생존(하다)', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0371-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0371'), 'meaning', 'uz', 'hayot kechirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0372', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 적응(하다)', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0372-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0372'), 'meaning', 'uz', 'moslashish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0373', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이/가 멸종(되다)', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0373-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0373'), 'meaning', 'uz', 'yo‘qolish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0374', (select id from public.sources where key = 'SRC-REBELS'), 'human', '멸종 위기', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0374-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0374'), 'meaning', 'uz', 'yo‘qolish xavfi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0375', (select id from public.sources where key = 'SRC-REBELS'), 'human', '먹이사슬', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0375-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0375'), 'meaning', 'uz', 'oziqlanish zanjiri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0376', (select id from public.sources where key = 'SRC-REBELS'), 'human', '외래종', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0376-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0376'), 'meaning', 'uz', 'begona tur', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0377', (select id from public.sources where key = 'SRC-REBELS'), 'human', '토종', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0377-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0377'), 'meaning', 'uz', 'mahalliy tur', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0378', (select id from public.sources where key = 'SRC-REBELS'), 'human', '번식', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0378-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0378'), 'meaning', 'uz', 'Ko‘payish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0379', (select id from public.sources where key = 'SRC-REBELS'), 'human', '알', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0379-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0379'), 'meaning', 'uz', 'tuxum', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0380', (select id from public.sources where key = 'SRC-REBELS'), 'human', '애벌레', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0380-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0380'), 'meaning', 'uz', 'qurt', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0381', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유충', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0381-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0381'), 'meaning', 'uz', 'larva', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0382', (select id from public.sources where key = 'SRC-REBELS'), 'human', '성충', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0382-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0382'), 'meaning', 'uz', 'katta va o‘sgan hayvon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0383', (select id from public.sources where key = 'SRC-REBELS'), 'human', '새끼', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0383-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0383'), 'meaning', 'uz', 'bolalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0384', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자궁', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0384-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0384'), 'meaning', 'uz', 'qorin', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0385', (select id from public.sources where key = 'SRC-REBELS'), 'human', '탯줄', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0385-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0385'), 'meaning', 'uz', 'pupok', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0386', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수정', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0386-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0386'), 'meaning', 'uz', 'tuxumlanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0387', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수컷', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0387-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0387'), 'meaning', 'uz', 'erkak', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0388', (select id from public.sources where key = 'SRC-REBELS'), 'human', '암컷', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0388-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0388'), 'meaning', 'uz', 'urg‘ochi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0389', (select id from public.sources where key = 'SRC-REBELS'), 'human', '먹이', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0389-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0389'), 'meaning', 'uz', 'oziq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0390', (select id from public.sources where key = 'SRC-REBELS'), 'human', '섭취', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0390-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0390'), 'meaning', 'uz', 'yutish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0391', (select id from public.sources where key = 'SRC-REBELS'), 'human', '귀화 식물', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0391-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0391'), 'meaning', 'uz', 'so‘nggi o‘simliklar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0392', (select id from public.sources where key = 'SRC-REBELS'), 'human', '출산', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0392-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0392'), 'meaning', 'uz', 'tug‘ilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0393', (select id from public.sources where key = 'SRC-REBELS'), 'human', '양육', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0393-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0393'), 'meaning', 'uz', 'parvarishlash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0394', (select id from public.sources where key = 'SRC-REBELS'), 'human', '동물의 특징', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0394-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0394'), 'meaning', 'uz', 'Hayvonlarning xususiyatlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0395', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이상 행동', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0395-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0395'), 'meaning', 'uz', 'noaniq/xato harakatlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0396', (select id from public.sources where key = 'SRC-REBELS'), 'human', '특수 감각', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0396-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0396'), 'meaning', 'uz', 'maxsus sezgi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0397', (select id from public.sources where key = 'SRC-REBELS'), 'human', '초음파', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0397-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0397'), 'meaning', 'uz', 'ultrasonik to‘lqinlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0398', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지표 생물', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0398-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0398'), 'meaning', 'uz', 'indikatator organizmlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0399', (select id from public.sources where key = 'SRC-REBELS'), 'human', '기후', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0399-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0399'), 'meaning', 'uz', 'Iqlim', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0400', (select id from public.sources where key = 'SRC-REBELS'), 'human', '태풍', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0400-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0400'), 'meaning', 'uz', 'to‘fon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0401', (select id from public.sources where key = 'SRC-REBELS'), 'human', '폭우', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0401-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0401'), 'meaning', 'uz', 'yomg‘ir', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0402', (select id from public.sources where key = 'SRC-REBELS'), 'human', '폭풍', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0402-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0402'), 'meaning', 'uz', 'bo‘ron', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0403', (select id from public.sources where key = 'SRC-REBELS'), 'human', '가뭄', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0403-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0403'), 'meaning', 'uz', 'qurg‘oqchilik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0404', (select id from public.sources where key = 'SRC-REBELS'), 'human', '폭설', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0404-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0404'), 'meaning', 'uz', 'kuchli qor yog‘ishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0405', (select id from public.sources where key = 'SRC-REBELS'), 'human', '폭염', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0405-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0405'), 'meaning', 'uz', 'issiq to‘fon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0406', (select id from public.sources where key = 'SRC-REBELS'), 'human', '무더위', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0406-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0406'), 'meaning', 'uz', 'issiqlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0407', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이상 기온', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0407-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0407'), 'meaning', 'uz', 'g‘ayritabiiy harorat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0408', (select id from public.sources where key = 'SRC-REBELS'), 'human', '장마', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0408-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0408'), 'meaning', 'uz', 'musson yomg‘iri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0409', (select id from public.sources where key = 'SRC-REBELS'), 'human', '봄', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0409-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0409'), 'meaning', 'uz', 'Bahor', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0410', (select id from public.sources where key = 'SRC-REBELS'), 'human', '춘곤증', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0410-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0410'), 'meaning', 'uz', 'bahor charchoqligi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0411', (select id from public.sources where key = 'SRC-REBELS'), 'human', '새싹', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0411-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0411'), 'meaning', 'uz', 'yangi o‘simliklar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0412', (select id from public.sources where key = 'SRC-REBELS'), 'human', '개화', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0412-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0412'), 'meaning', 'uz', 'gul ochish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0413', (select id from public.sources where key = 'SRC-REBELS'), 'human', '아지랑이', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0413-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0413'), 'meaning', 'uz', 'issiqdan havoning titrashishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0414', (select id from public.sources where key = 'SRC-REBELS'), 'human', '여름', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0414-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0414'), 'meaning', 'uz', 'Yoz', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0415', (select id from public.sources where key = 'SRC-REBELS'), 'human', '녹음', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0415-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0415'), 'meaning', 'uz', 'o‘simliklar yashilligi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0416', (select id from public.sources where key = 'SRC-REBELS'), 'human', '습도', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0416-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0416'), 'meaning', 'uz', 'namlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0417', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불쾌지수', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0417-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0417'), 'meaning', 'uz', 'noqulaylik ko‘rsatkichi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0418', (select id from public.sources where key = 'SRC-REBELS'), 'human', '열대야', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0418-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0418'), 'meaning', 'uz', 'tropik kechalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0419', (select id from public.sources where key = 'SRC-REBELS'), 'human', '모기', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0419-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0419'), 'meaning', 'uz', 'chivinlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0420', (select id from public.sources where key = 'SRC-REBELS'), 'human', '매미', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0420-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0420'), 'meaning', 'uz', 'kriketlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0421', (select id from public.sources where key = 'SRC-REBELS'), 'human', '가을', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0421-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0421'), 'meaning', 'uz', 'Kuz', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0422', (select id from public.sources where key = 'SRC-REBELS'), 'human', '단풍', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0422-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0422'), 'meaning', 'uz', 'kuzgi barglar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0423', (select id from public.sources where key = 'SRC-REBELS'), 'human', '햇과일', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0423-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0423'), 'meaning', 'uz', 'qaynoq mevalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0424', (select id from public.sources where key = 'SRC-REBELS'), 'human', '햇곡식', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0424-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0424'), 'meaning', 'uz', 'qaynoq don mahsulotlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0425', (select id from public.sources where key = 'SRC-REBELS'), 'human', '천고마비', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0425-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0425'), 'meaning', 'uz', 'yuqori osmon, boylik davri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0426', (select id from public.sources where key = 'SRC-REBELS'), 'human', '높은 하늘', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0426-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0426'), 'meaning', 'uz', 'baland osmon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0427', (select id from public.sources where key = 'SRC-REBELS'), 'human', '일교차', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0427-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0427'), 'meaning', 'uz', 'kun va tun harorati farqi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0428', (select id from public.sources where key = 'SRC-REBELS'), 'human', '겨울', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0428-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0428'), 'meaning', 'uz', 'Qish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0429', (select id from public.sources where key = 'SRC-REBELS'), 'human', '눈사태', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0429-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0429'), 'meaning', 'uz', 'qor toshqini', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0430', (select id from public.sources where key = 'SRC-REBELS'), 'human', '건조', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0430-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0430'), 'meaning', 'uz', 'quruqlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0431', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자연 재해', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0431-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0431'), 'meaning', 'uz', 'Tabiat ofatlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0432', (select id from public.sources where key = 'SRC-REBELS'), 'human', '산사태', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0432-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0432'), 'meaning', 'uz', 'tog‘ siljishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0433', (select id from public.sources where key = 'SRC-REBELS'), 'human', '해일', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0433-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0433'), 'meaning', 'uz', 'tsunami', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0434', (select id from public.sources where key = 'SRC-REBELS'), 'human', '범람', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0434-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0434'), 'meaning', 'uz', 'yopirilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0435', (select id from public.sources where key = 'SRC-REBELS'), 'human', '침수', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0435-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0435'), 'meaning', 'uz', 'to‘kilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0436', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지진', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0436-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0436'), 'meaning', 'uz', 'zilzila', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0437', (select id from public.sources where key = 'SRC-REBELS'), 'human', '물(수질 오염)', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0437-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0437'), 'meaning', 'uz', 'Suv (suv ifloslanishi)', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0438', (select id from public.sources where key = 'SRC-REBELS'), 'human', '생활 하수', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0438-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0438'), 'meaning', 'uz', 'uyma chiqindilari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0439', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공장 폐수', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0439-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0439'), 'meaning', 'uz', 'zavod chiqindilari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0440', (select id from public.sources where key = 'SRC-REBELS'), 'human', '농업용수', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0440-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0440'), 'meaning', 'uz', 'dehqonchilik suvlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0441', (select id from public.sources where key = 'SRC-REBELS'), 'human', '기름 유출', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0441-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0441'), 'meaning', 'uz', 'neftning to‘kilishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0442', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수질 오염', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0442-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0442'), 'meaning', 'uz', 'suvning ifloslanishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0443', (select id from public.sources where key = 'SRC-REBELS'), 'human', '땅(토양 오염)', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0443-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0443'), 'meaning', 'uz', 'Yer (tuproq ifloslanishi)', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0444', (select id from public.sources where key = 'SRC-REBELS'), 'human', '농약', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0444-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0444'), 'meaning', 'uz', 'pestitsidlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0445', (select id from public.sources where key = 'SRC-REBELS'), 'human', '가축의 배설물', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0445-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0445'), 'meaning', 'uz', 'chorva hayvonlari axlati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0446', (select id from public.sources where key = 'SRC-REBELS'), 'human', '일회용품 사용', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0446-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0446'), 'meaning', 'uz', 'bir martalik mahsulotlardan foydalanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0447', (select id from public.sources where key = 'SRC-REBELS'), 'human', '비닐 포장', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0447-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0447'), 'meaning', 'uz', 'polietilen qadoqlash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0448', (select id from public.sources where key = 'SRC-REBELS'), 'human', '쓰레기', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0448-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0448'), 'meaning', 'uz', 'axlat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0449', (select id from public.sources where key = 'SRC-REBELS'), 'human', '플라스틱', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0449-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0449'), 'meaning', 'uz', 'plastmassa', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0450', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공기(대기 오염)', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0450-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0450'), 'meaning', 'uz', 'Havo (havo ifloslanishi)', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0451', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자동차 배기가스', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0451-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0451'), 'meaning', 'uz', 'avtomobil gazlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0452', (select id from public.sources where key = 'SRC-REBELS'), 'human', '쓰레기 태우기(소각)', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0452-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0452'), 'meaning', 'uz', 'axlatni yoqish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0453', (select id from public.sources where key = 'SRC-REBELS'), 'human', '나무 없애기', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0453-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0453'), 'meaning', 'uz', 'daraxtlarni yo‘qotish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0454', (select id from public.sources where key = 'SRC-REBELS'), 'human', '아파트', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0454-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0454'), 'meaning', 'uz', 'ko‘p qavatli uylar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0455', (select id from public.sources where key = 'SRC-REBELS'), 'human', '골프장 건설', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0455-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0455'), 'meaning', 'uz', 'golf maydonlari qurilishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0456', (select id from public.sources where key = 'SRC-REBELS'), 'human', '온실가스 배출', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0456-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0456'), 'meaning', 'uz', 'issiqxona gazlarini chiqarish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0457', (select id from public.sources where key = 'SRC-REBELS'), 'human', '환경오염의 결과', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0457-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0457'), 'meaning', 'uz', 'Atrof-muhit ifloslanishining oqibatlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0458', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지구 온난화', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0458-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0458'), 'meaning', 'uz', 'yerning isishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0459', (select id from public.sources where key = 'SRC-REBELS'), 'human', '오존층 파괴', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0459-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0459'), 'meaning', 'uz', 'ozon qatlamining buzilishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0460', (select id from public.sources where key = 'SRC-REBELS'), 'human', '미세 먼지', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0460-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0460'), 'meaning', 'uz', 'nozik chang', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0461', (select id from public.sources where key = 'SRC-REBELS'), 'human', '사막화', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0461-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0461'), 'meaning', 'uz', 'sahrolashish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0462', (select id from public.sources where key = 'SRC-REBELS'), 'human', '물 부족', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0462-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0462'), 'meaning', 'uz', 'suv yetishmasligi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0463', (select id from public.sources where key = 'SRC-REBELS'), 'human', '환경 문제 해결을 위한 노력', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0463-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0463'), 'meaning', 'uz', 'Atrof-muhit muammolarini hal qilish uchun sa’y-harakatlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0463-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0463'), '시멘트 생산을 위해 플라스틱 연료로 사용', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0463-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0463-EX1'), 'sentence', 'uz', 'sement ishlab chiqarish uchun plastmassani yoqilg‘i sifatida ishlatish', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0464', (select id from public.sources where key = 'SRC-REBELS'), 'human', '썩는 플라스틱 개발', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0464-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0464'), 'meaning', 'uz', 'parchalanuvchi plastmassani ishlab chiqish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0465', (select id from public.sources where key = 'SRC-REBELS'), 'human', '새로운 소재 개발', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0465-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0465'), 'meaning', 'uz', 'yangi materiallar ishlab chiqish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0466', (select id from public.sources where key = 'SRC-REBELS'), 'human', '일회용품 줄이기', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0466-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0466'), 'meaning', 'uz', 'bir martalik mahsulotlarni kamaytirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0467', (select id from public.sources where key = 'SRC-REBELS'), 'human', '분리수거', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0467-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0467'), 'meaning', 'uz', 'ajratib yig‘ish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0468', (select id from public.sources where key = 'SRC-REBELS'), 'human', '재활용', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0468-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0468'), 'meaning', 'uz', 'qayta ishlash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0469', (select id from public.sources where key = 'SRC-REBELS'), 'human', '바닷물 담수 처리', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0469-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0469'), 'meaning', 'uz', 'dengiz suvini tozalash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0470', (select id from public.sources where key = 'SRC-REBELS'), 'human', '하수 처리 시설', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0470-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0470'), 'meaning', 'uz', 'kanalizatsiya tozalash inshootlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0471', (select id from public.sources where key = 'SRC-REBELS'), 'human', '폐수 정화 시설', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0471-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0471'), 'meaning', 'uz', 'suv chiqindilarini tozalash inshootlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0472', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-로 인한 피해가 발생하고/증가하고 있다.', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0472-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0472'), 'meaning', 'uz', '-dan kelib chiqqan zararlar sodir bo‘lmoqda/ko‘paymoqda.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0472-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0472'), 'Misol: 일회용품 사용으로 인한 피해가 증가하고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0472-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0472-EX1'), 'sentence', 'uz', 'Bir martalik mahsulotlar ishlatilishi natijasida zararlar ko‘paymoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0473', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'A는 B와/과 비교할 수 없을 정도로', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0473-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0473'), 'meaning', 'uz', 'A B bilan solishtirib bo‘lmaydigan darajada.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0473-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0473'), 'Misol: 동물들은 사람과 비교할 수 없을 정도로 뛰어난 감각을 가지고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0473-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0473-EX1'), 'sentence', 'uz', 'Hayvonlar inson bilan solishtirib bo‘lmaydigan darajada ajoyib sezgiga ega.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0474', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-라고(간접인용) 생각하기 쉽다. 그러나', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0474-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0474'), 'meaning', 'uz', '-deb o‘ylash oson, lekin…', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0474-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0474'), 'Misol: 나무는 감정이 없다고 생각하기 쉽다. 그러나 나무도 위험을 느낄 수 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0474-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0474-EX1'), 'sentence', 'uz', 'Daraxtda his-tuyg‘u yo‘q deb o‘ylash oson, lekin daraxt ham xavfni his qila oladi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0475', (select id from public.sources where key = 'SRC-REBELS'), 'human', '합리적인 대책이 마련되어야 한다.', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0475-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0475'), 'meaning', 'uz', 'Mantiqiy chora-tadbirlar tayyorlanishi kerak.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0475-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0475'), 'Misol: 일회용품 사용의 급격한 증가를 해결하기 위한 합리적인 대책이 마련되어야 한다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0475-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0475-EX1'), 'sentence', 'uz', 'Bir martalik mahsulotlar ishlatilishining keskin ortishini hal qilish uchun mantiqiy chora-tadbirlar tayyorlanishi kerak.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0476', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에도 불구하고', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0476-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0476'), 'meaning', 'uz', '-ga qaramay…', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0476-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0476'), 'Misol: 환경 단체의 반대에도 불구하고 골프장을 건설해서 문제가 되고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0476-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0476-EX1'), 'sentence', 'uz', 'Atrof-muhit tashkilotlarining qarshiligiga qaramay golf maydonchasi qurildi va bu muammoga aylanyapti.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0477', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-을/를 최우선으로 생각하다', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0477-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0477'), 'meaning', 'uz', '-ni eng birinchi o‘rinda turishi kerak deb o‘ylash.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0477-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0477'), 'Misol: 이 문제를 해결하기 위해 환경오염을 줄이는 방안을 최우선으로 생각해야 한다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0477-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0477-EX1'), 'sentence', 'uz', 'Ushbu muammoni hal qilish uchun atrof-muhitning ifloslanishini kamaytirish yo‘llarini eng birinchi o‘rinda turishi kerak deb o‘ylashimiz kerak.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0478', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-을 것으로 기대하다', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0478-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0478'), 'meaning', 'uz', '- bo‘lishini kutish.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0478-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0478'), 'Misol: 새로운 포장재의 개발이 환경 문제에 대한 해결책이 될 것으로 기대하고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0478-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0478-EX1'), 'sentence', 'uz', 'Yangi o‘ralash materialining ishlab chiqilishi atrof-muhit muammolariga yechim bo‘lishini kutishmoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0479', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 대비하다', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0479-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0479'), 'meaning', 'uz', '- ga tayyorlanish.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0479-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0479'), 'Misol: 물 부족 시대에 대비하기 위한 연구 개발이 필요한 시점이다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0479-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0479-EX1'), 'sentence', 'uz', 'Suv tanqisligi davriga tayyorlanish uchun ilmiy tadqiqotlar va ishlab chiqish kerak.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0480', (select id from public.sources where key = 'SRC-REBELS'), 'human', '없어서는 안 되다', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0480-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0480'), 'meaning', 'uz', 'Bo‘lmasligi kerak emas.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0480-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0480'), 'Misol: 숲의 생태계에 없어서는 안 될 존재가 바로 나방이다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0480-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0480-EX1'), 'sentence', 'uz', 'O‘rmon ekotizimida bo‘lmasligi kerak bo‘lmagan mavjudot bu nafar.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0481', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-와/과 마찬가지로', null, 1, null, (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0481-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0481'), 'meaning', 'uz', '-ga o‘xshab.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0481-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0481'), 'Misol: 새끼 상어는 인간과 마찬가지로 어미의 자궁 속에서 약 10개월을 보낸다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0481-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0481-EX1'), 'sentence', 'uz', 'Bola akulalar, insonlarga o‘xshab, onalarining bachadonida taxminan 10 oy o‘tkazadi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0482', (select id from public.sources where key = 'SRC-REBELS'), 'human', '힐링', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0482-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0482'), 'meaning', 'uz', 'healing', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0483', (select id from public.sources where key = 'SRC-REBELS'), 'human', '치유', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0483-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0483'), 'meaning', 'uz', 'davolash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0484', (select id from public.sources where key = 'SRC-REBELS'), 'human', '위로', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0484-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0484'), 'meaning', 'uz', 'quvvatlash, tasalli berish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0485', (select id from public.sources where key = 'SRC-REBELS'), 'human', '마음의 평화', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0485-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0485'), 'meaning', 'uz', 'yurak tinchligi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0486', (select id from public.sources where key = 'SRC-REBELS'), 'human', '휴식', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0486-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0486'), 'meaning', 'uz', 'dam olish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0487', (select id from public.sources where key = 'SRC-REBELS'), 'human', '편안하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0487-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0487'), 'meaning', 'uz', 'qulay, huzurli', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0488', (select id from public.sources where key = 'SRC-REBELS'), 'human', '안도감', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0488-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0488'), 'meaning', 'uz', 'xotirjamlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0489', (select id from public.sources where key = 'SRC-REBELS'), 'human', '평온함', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0489-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0489'), 'meaning', 'uz', 'tinchlik, sokinlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0490', (select id from public.sources where key = 'SRC-REBELS'), 'human', '신뢰하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0490-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0490'), 'meaning', 'uz', 'ishonmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0491', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유사성', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0491-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0491'), 'meaning', 'uz', 'o‘xshashlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0492', (select id from public.sources where key = 'SRC-REBELS'), 'human', '믿음', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0492-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0492'), 'meaning', 'uz', 'ishonch', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0493', (select id from public.sources where key = 'SRC-REBELS'), 'human', '신념', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0493-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0493'), 'meaning', 'uz', 'e’tiqod', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0494', (select id from public.sources where key = 'SRC-REBELS'), 'human', '친밀도', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0494-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0494'), 'meaning', 'uz', 'yaqinlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0495', (select id from public.sources where key = 'SRC-REBELS'), 'human', '외롭다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0495-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0495'), 'meaning', 'uz', 'yolg‘iz his qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0496', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고독하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0496-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0496'), 'meaning', 'uz', 'yolg‘izlikni his qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0497', (select id from public.sources where key = 'SRC-REBELS'), 'human', '두려움', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0497-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0497'), 'meaning', 'uz', 'qo‘rquv', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0498', (select id from public.sources where key = 'SRC-REBELS'), 'human', '분노', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0498-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0498'), 'meaning', 'uz', 'g‘azab', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0499', (select id from public.sources where key = 'SRC-REBELS'), 'human', '적개심', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0499-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0499'), 'meaning', 'uz', 'dushmanlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0500', (select id from public.sources where key = 'SRC-REBELS'), 'human', '아쉬움', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0500-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0500'), 'meaning', 'uz', 'afsuslanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0501', (select id from public.sources where key = 'SRC-REBELS'), 'human', '긴장감', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0501-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0501'), 'meaning', 'uz', 'konsentratsiya, kuchli shovqin', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0502', (select id from public.sources where key = 'SRC-REBELS'), 'human', '안타까움', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0502-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0502'), 'meaning', 'uz', 'afsus, qayg‘u', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0503', (select id from public.sources where key = 'SRC-REBELS'), 'human', '거부감', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0503-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0503'), 'meaning', 'uz', 'qarshilik his qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0504', (select id from public.sources where key = 'SRC-REBELS'), 'human', '당황하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0504-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0504'), 'meaning', 'uz', 'hayratda qolmoq, ajablanmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0505', (select id from public.sources where key = 'SRC-REBELS'), 'human', '끔찍하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0505-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0505'), 'meaning', 'uz', 'qo‘rqinchli bo‘lish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0506', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이기심', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0506-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0506'), 'meaning', 'uz', 'kamsitish, o‘zgalar ustidan g‘alaba', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0507', (select id from public.sources where key = 'SRC-REBELS'), 'human', '좌절하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0507-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0507'), 'meaning', 'uz', 'umidsizlikka tushmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0508', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유리하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0508-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0508'), 'meaning', 'uz', 'foydali bo‘lish, qulay bo‘lish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0509', (select id from public.sources where key = 'SRC-REBELS'), 'human', '도움을 받다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0509-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0509'), 'meaning', 'uz', 'yordam olish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0510', (select id from public.sources where key = 'SRC-REBELS'), 'human', '돌파구를 찾다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0510-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0510'), 'meaning', 'uz', 'yo‘l topish, yechim izlash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0511', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이기다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0511-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0511'), 'meaning', 'uz', 'g‘alaba qozonmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0512', (select id from public.sources where key = 'SRC-REBELS'), 'human', '도전하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0512-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0512'), 'meaning', 'uz', 'chaqiriq qilish, sinab ko‘rmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0513', (select id from public.sources where key = 'SRC-REBELS'), 'human', '기회를 잡다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0513-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0513'), 'meaning', 'uz', 'imkoniyatdan foydalanmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0514', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불리하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0514-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0514'), 'meaning', 'uz', 'noqulay bo‘lish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0515', (select id from public.sources where key = 'SRC-REBELS'), 'human', '가난하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0515-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0515'), 'meaning', 'uz', 'kambag‘al bo‘lish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0516', (select id from public.sources where key = 'SRC-REBELS'), 'human', '위기에 처하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0516-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0516'), 'meaning', 'uz', 'xavfli holatga tushmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0517', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고립되다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0517-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0517'), 'meaning', 'uz', 'yolg‘izlanmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0518', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고립시키다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0518-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0518'), 'meaning', 'uz', 'yolg‘izlashtirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0519', (select id from public.sources where key = 'SRC-REBELS'), 'human', '벽에 부딪히다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0519-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0519'), 'meaning', 'uz', 'devorga urilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0520', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이/가 부딪히다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0520-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0520'), 'meaning', 'uz', 'urilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0521', (select id from public.sources where key = 'SRC-REBELS'), 'human', '충돌하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0521-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0521'), 'meaning', 'uz', 'to‘qnashmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0522', (select id from public.sources where key = 'SRC-REBELS'), 'human', '거절당하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0522-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0522'), 'meaning', 'uz', 'rad etilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0523', (select id from public.sources where key = 'SRC-REBELS'), 'human', '포기하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0523-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0523'), 'meaning', 'uz', 'taslim bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0524', (select id from public.sources where key = 'SRC-REBELS'), 'human', '진화(하다)', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0524-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0524'), 'meaning', 'uz', 'evolyutsiya qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0525', (select id from public.sources where key = 'SRC-REBELS'), 'human', '퇴보(하다)', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0525-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0525'), 'meaning', 'uz', 'orqaga qaytish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0526', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이겨내다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0526-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0526'), 'meaning', 'uz', 'yengib o‘tmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0527', (select id from public.sources where key = 'SRC-REBELS'), 'human', '극복하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0527-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0527'), 'meaning', 'uz', 'yengib chiqmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0528', (select id from public.sources where key = 'SRC-REBELS'), 'human', '체감하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0528-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0528'), 'meaning', 'uz', 'his qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0529', (select id from public.sources where key = 'SRC-REBELS'), 'human', '설득하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0529-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0529'), 'meaning', 'uz', 'ishontirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0530', (select id from public.sources where key = 'SRC-REBELS'), 'human', '결심하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0530-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0530'), 'meaning', 'uz', 'qaror qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0531', (select id from public.sources where key = 'SRC-REBELS'), 'human', '다짐하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0531-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0531'), 'meaning', 'uz', 'qasd qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0532', (select id from public.sources where key = 'SRC-REBELS'), 'human', '선언하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0532-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0532'), 'meaning', 'uz', 'e’lon qilmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0533', (select id from public.sources where key = 'SRC-REBELS'), 'human', '약속하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0533-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0533'), 'meaning', 'uz', 'va’da berish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0534', (select id from public.sources where key = 'SRC-REBELS'), 'human', '실천에 옮기다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0534-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0534'), 'meaning', 'uz', 'amalga oshirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0535', (select id from public.sources where key = 'SRC-REBELS'), 'human', '책임을 지다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0535-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0535'), 'meaning', 'uz', 'mas’uliyatni olish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0536', (select id from public.sources where key = 'SRC-REBELS'), 'human', '협상하다', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0536-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0536'), 'meaning', 'uz', 'muzokara qilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0537', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이/가 점점 많아지고 있다.', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0537-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0537'), 'meaning', 'uz', '- oshib bormoqda.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0537-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0537'), '온라인을 통해 공부하는 사람들이 점점 많아지고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0537-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0537-EX1'), 'sentence', 'uz', 'Onlayn orqali o‘qiyotgan odamlar tobora ko‘payib bormoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0538', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-을/를 중요하게 생각하는 사람들이 늘고 있다.', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0538-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0538'), 'meaning', 'uz', '-ni muhim deb hisoblovchi odamlar ko‘payib bormoqda.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0538-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0538'), '직업을 구할 때 사회의 인식보다 개인의 만족을 중요하게 생각하는 사람들이 늘고 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0538-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0538-EX1'), 'sentence', 'uz', 'Ish topishda jamiyatning qarashlaridan ko‘ra shaxsiy qoniqishni muhim deb hisoblovchi odamlar ko‘payib bormoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0539', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-을/를 유발하기도 한다.', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0539-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0539'), 'meaning', 'uz', '-ga sabab bo‘lishi mumkin.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0539-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0539'), '지방이 많이 들어있는 음식은 고혈압을 유발하기도 한다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0539-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0539-EX1'), 'sentence', 'uz', 'Ko‘p yog‘li ovqatlar yuqori qon bosimini keltirib chiqarishi mumkin.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0540', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-은/는 태도가 우선되어야 한다.', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0540-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0540'), 'meaning', 'uz', '- munosabat birinchi o‘rinda bo‘lishi kerak.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0540-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0540'), '토론을 할 때 다른 사람의 의견을 주의 깊게 듣는 태도가 우선되어야 한다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0540-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0540-EX1'), 'sentence', 'uz', 'Munozara qilishda boshqalar fikrini diqqat bilan tinglash munosabati birinchi o‘rinda bo‘lishi kerak.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0541', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-은/는 것은 사실이다. 그렇지만(하지만, 그런데, 그러나)', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0541-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0541'), 'meaning', 'uz', '- bu haqiqat. Ammo…', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0541-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0541'), '외국어 능력이 업무에 도움이 되는 것은 사실이다. 그렇지만 외국어 능력이 전부는 아니다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0541-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0541-EX1'), 'sentence', 'uz', 'Chet tili bilimi ishga yordam beradi, bu haqiqat. Ammo chet tili bilimi hamma narsaga yetarli emas.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0542', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-A은/는 B와/과 큰 차이가 있다.', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0542-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0542'), 'meaning', 'uz', '-A va B o‘rtasida katta farq bor.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0542-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0542'), '경험하지 않은 일을 하는 것은 경험한 일을 하는 것과 큰 차이가 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0542-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0542-EX1'), 'sentence', 'uz', 'Tajriba qilmagan ishni bajarish, tajriba qilingan ishni bajarishdan katta farq qiladi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0543', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-은/는/ㄴ 이유가 바로 여기에 있다.', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0543-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0543'), 'meaning', 'uz', '-ning sababi aynan shu yerda.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0543-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0543'), '독서가 필요한 이유가 바로 여기에 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0543-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0543-EX1'), 'sentence', 'uz', 'Kitob o‘qishning zarurligi aynan shu yerda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0544', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-이/가 언제나 효과적인 것은 아니다.', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0544-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0544'), 'meaning', 'uz', '- har doim samarali bo‘lmaydi.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0544-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0544'), '장점만을 강조하는 것이 언제나 효과적인 것은 아니다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0544-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0544-EX1'), 'sentence', 'uz', 'Faqat afzalliklarni ta’kidlash har doim samarali bo‘lmaydi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0545', (select id from public.sources where key = 'SRC-REBELS'), 'human', '문제는 ~라는/다는 사실이다.', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0545-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0545'), 'meaning', 'uz', 'Muammo - bu…', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0545-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0545'), '문제는 본인 스스로는 그것을 인식하지 못한다는 사실이다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0545-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0545-EX1'), 'sentence', 'uz', 'Muammo shundaki, odam o‘zini tanib yetmaydi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0546', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-임에 틀림없다. (이/가 틀림없다, -은/는 것에 틀림없다)', null, 1, null, (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0546-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0546'), 'meaning', 'uz', '- ekanligi shubhasiz.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0546-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0546'), '그가 사실을 숨기고 있음에 틀림없다. (숨기고 있음이 틀림없다)', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0546-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0546-EX1'), 'sentence', 'uz', 'U haqiqatni yashirayotgani shubhasiz.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0547', (select id from public.sources where key = 'SRC-REBELS'), 'human', '교육기관', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0547-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0547'), 'meaning', 'uz', 'Ta’lim muassasalari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0547-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0547'), '공교육:', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0547-EX2', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0547'), '사교육:', 2, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0548', (select id from public.sources where key = 'SRC-REBELS'), 'human', '어린이집', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0548-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0548'), 'meaning', 'uz', 'bolalar bog‘chasi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0549', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유치원', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0549-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0549'), 'meaning', 'uz', 'maktabgacha ta’lim muassasasi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0550', (select id from public.sources where key = 'SRC-REBELS'), 'human', '초등학교', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0550-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0550'), 'meaning', 'uz', 'boshlang‘ich maktab', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0551', (select id from public.sources where key = 'SRC-REBELS'), 'human', '중학교', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0551-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0551'), 'meaning', 'uz', 'o‘rta maktab', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0552', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고등학교', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0552-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0552'), 'meaning', 'uz', 'o‘rta maxsus maktab', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0553', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대학교', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0553-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0553'), 'meaning', 'uz', 'universitet', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0554', (select id from public.sources where key = 'SRC-REBELS'), 'human', '과외', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0554-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0554'), 'meaning', 'uz', 'qo‘shimcha dars', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0555', (select id from public.sources where key = 'SRC-REBELS'), 'human', '개인수업', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0555-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0555'), 'meaning', 'uz', 'shaxsiy dars', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0556', (select id from public.sources where key = 'SRC-REBELS'), 'human', '학원', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0556-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0556'), 'meaning', 'uz', 'o‘quv markazi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0557', (select id from public.sources where key = 'SRC-REBELS'), 'human', '학습지', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0557-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0557'), 'meaning', 'uz', 'o‘quv materiallari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0558', (select id from public.sources where key = 'SRC-REBELS'), 'human', '선행학습', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0558-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0558'), 'meaning', 'uz', 'oldindan o‘rganish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0559', (select id from public.sources where key = 'SRC-REBELS'), 'human', '조기 교육', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0559-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0559'), 'meaning', 'uz', 'erta ta’lim', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0560', (select id from public.sources where key = 'SRC-REBELS'), 'human', '적기 교육', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0560-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0560'), 'meaning', 'uz', 'to‘g‘ri vaqtda ta’lim', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0561', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공립', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0561-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0561'), 'meaning', 'uz', 'davlat maktabi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0562', (select id from public.sources where key = 'SRC-REBELS'), 'human', '사립', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0562-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0562'), 'meaning', 'uz', 'xususiy maktab', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0563', (select id from public.sources where key = 'SRC-REBELS'), 'human', '국립', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0563-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0563'), 'meaning', 'uz', 'milliy maktab', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0564', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대안학교', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0564-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0564'), 'meaning', 'uz', 'alternativ maktab', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0565', (select id from public.sources where key = 'SRC-REBELS'), 'human', '서당', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0565-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0565'), 'meaning', 'uz', 'eski maktab', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0566', (select id from public.sources where key = 'SRC-REBELS'), 'human', '서원', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0566-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0566'), 'meaning', 'uz', 'madrasah', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0567', (select id from public.sources where key = 'SRC-REBELS'), 'human', '향교 - xyonkyo', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0567-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0567'), 'meaning', 'uz', 'an’anaviy o‘qitish tizimi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0568', (select id from public.sources where key = 'SRC-REBELS'), 'human', '성균관', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0568-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0568'), 'meaning', 'uz', 'Seonggyungwan', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0569', (select id from public.sources where key = 'SRC-REBELS'), 'human', '토론', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0569-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0569'), 'meaning', 'uz', 'munozara', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0570', (select id from public.sources where key = 'SRC-REBELS'), 'human', '발표', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0570-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0570'), 'meaning', 'uz', 'taqdimot', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0571', (select id from public.sources where key = 'SRC-REBELS'), 'human', '회의', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0571-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0571'), 'meaning', 'uz', 'yig‘ilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0572', (select id from public.sources where key = 'SRC-REBELS'), 'human', '조별 활동', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0572-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0572'), 'meaning', 'uz', 'guruh faoliyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0573', (select id from public.sources where key = 'SRC-REBELS'), 'human', '필기 시험', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0573-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0573'), 'meaning', 'uz', 'yozma imtihon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0574', (select id from public.sources where key = 'SRC-REBELS'), 'human', '실기 시험', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0574-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0574'), 'meaning', 'uz', 'amaliy imtihon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0575', (select id from public.sources where key = 'SRC-REBELS'), 'human', '질문', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0575-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0575'), 'meaning', 'uz', 'savol', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0576', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대답', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0576-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0576'), 'meaning', 'uz', 'javob', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0577', (select id from public.sources where key = 'SRC-REBELS'), 'human', '현장 학습 - dala o‘qitish', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0577-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0577'), 'meaning', 'uz', 'yoki amaliy tajriba', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0578', (select id from public.sources where key = 'SRC-REBELS'), 'human', '체험 학습', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0578-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0578'), 'meaning', 'uz', 'tajriba o‘rganish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0579', (select id from public.sources where key = 'SRC-REBELS'), 'human', '안전 교육', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0579-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0579'), 'meaning', 'uz', 'xavfsizlik ta’limi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0580', (select id from public.sources where key = 'SRC-REBELS'), 'human', '봉사 활동', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0580-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0580'), 'meaning', 'uz', 'xayriya faoliyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0581', (select id from public.sources where key = 'SRC-REBELS'), 'human', '게임', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0581-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0581'), 'meaning', 'uz', 'o‘yin', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0582', (select id from public.sources where key = 'SRC-REBELS'), 'human', '가상의 공간', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0582-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0582'), 'meaning', 'uz', 'virtual makon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0583', (select id from public.sources where key = 'SRC-REBELS'), 'human', '익명', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0583-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0583'), 'meaning', 'uz', 'anonim', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0584', (select id from public.sources where key = 'SRC-REBELS'), 'human', '직접적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0584-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0584'), 'meaning', 'uz', 'to‘g‘ridan-to‘g‘ri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0585', (select id from public.sources where key = 'SRC-REBELS'), 'human', '간접적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0585-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0585'), 'meaning', 'uz', 'bilvosita', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0586', (select id from public.sources where key = 'SRC-REBELS'), 'human', '계획적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0586-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0586'), 'meaning', 'uz', 'rejalashtirilgan', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0587', (select id from public.sources where key = 'SRC-REBELS'), 'human', '정서적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0587-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0587'), 'meaning', 'uz', 'hissiy', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0588', (select id from public.sources where key = 'SRC-REBELS'), 'human', '직접 참여', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0588-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0588'), 'meaning', 'uz', 'to‘g‘ridan-to‘g‘ri ishtirok etish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0589', (select id from public.sources where key = 'SRC-REBELS'), 'human', '정보', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0589-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0589'), 'meaning', 'uz', 'ma’lumot', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0590', (select id from public.sources where key = 'SRC-REBELS'), 'human', '칭찬', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0590-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0590'), 'meaning', 'uz', 'maqtov', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0591', (select id from public.sources where key = 'SRC-REBELS'), 'human', '훈육', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0591-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0591'), 'meaning', 'uz', 'tarbiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0592', (select id from public.sources where key = 'SRC-REBELS'), 'human', '놀이', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0592-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0592'), 'meaning', 'uz', 'o‘yin', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0593', (select id from public.sources where key = 'SRC-REBELS'), 'human', '감각 발달', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0593-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0593'), 'meaning', 'uz', 'sezgi rivojlanishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0594', (select id from public.sources where key = 'SRC-REBELS'), 'human', '문자 교육', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0594-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0594'), 'meaning', 'uz', 'yozma ta’lim', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0595', (select id from public.sources where key = 'SRC-REBELS'), 'human', '인성 교육', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0595-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0595'), 'meaning', 'uz', 'shaxsiyatni rivojlantirish ta’limi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0596', (select id from public.sources where key = 'SRC-REBELS'), 'human', '권위', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0596-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0596'), 'meaning', 'uz', 'obro‘', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0597', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자기 계발', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0597-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0597'), 'meaning', 'uz', 'o‘zini o‘stirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0598', (select id from public.sources where key = 'SRC-REBELS'), 'human', '흥미', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0598-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0598'), 'meaning', 'uz', 'qiziqish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0599', (select id from public.sources where key = 'SRC-REBELS'), 'human', '동기', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0599-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0599'), 'meaning', 'uz', 'motivatsiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0600', (select id from public.sources where key = 'SRC-REBELS'), 'human', '효과적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0600-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0600'), 'meaning', 'uz', 'samarali', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0601', (select id from public.sources where key = 'SRC-REBELS'), 'human', '필수적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0601-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0601'), 'meaning', 'uz', 'majburiy', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0602', (select id from public.sources where key = 'SRC-REBELS'), 'human', '목표 달성', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0602-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0602'), 'meaning', 'uz', 'maqsadga erishish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0603', (select id from public.sources where key = 'SRC-REBELS'), 'human', '긍정적 영향을 미치다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0603-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0603'), 'meaning', 'uz', 'ijobiy ta’sir ko‘rsatish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0604', (select id from public.sources where key = 'SRC-REBELS'), 'human', '활용하다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0604-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0604'), 'meaning', 'uz', 'foydalanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0605', (select id from public.sources where key = 'SRC-REBELS'), 'human', '부작용을 최소화하다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0605-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0605'), 'meaning', 'uz', 'nojo‘ya ta’sirlarni minimallashtirish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0605-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0605'), '개발에 대한 부작용을 최소화하려는 노력이 필요하다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0605-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0605-EX1'), 'sentence', 'uz', 'Rivojlanishning nojo‘ya ta’sirlarini minimallashtirish uchun harakat qilish kerak.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0606', (select id from public.sources where key = 'SRC-REBELS'), 'human', '인지능력', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0606-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0606'), 'meaning', 'uz', 'idrok qobiliyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0607', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지각능력 (지능)', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0607-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0607'), 'meaning', 'uz', 'sezish qobiliyati (aqlli)', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0608', (select id from public.sources where key = 'SRC-REBELS'), 'human', '관찰력', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0608-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0608'), 'meaning', 'uz', 'kuzatish qobiliyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0609', (select id from public.sources where key = 'SRC-REBELS'), 'human', '어휘력', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0609-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0609'), 'meaning', 'uz', 'lug‘at qobiliyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0610', (select id from public.sources where key = 'SRC-REBELS'), 'human', '습득력', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0610-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0610'), 'meaning', 'uz', 'o‘zlashtirish qobiliyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0611', (select id from public.sources where key = 'SRC-REBELS'), 'human', '창의력', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0611-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0611'), 'meaning', 'uz', 'ijodkorlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0612', (select id from public.sources where key = 'SRC-REBELS'), 'human', '통찰력', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0612-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0612'), 'meaning', 'uz', 'anglash qobiliyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0613', (select id from public.sources where key = 'SRC-REBELS'), 'human', '분석력', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0613-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0613'), 'meaning', 'uz', 'tahlil qilish qobiliyati', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0614', (select id from public.sources where key = 'SRC-REBELS'), 'human', '기억력', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0614-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0614'), 'meaning', 'uz', 'xotira', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0615', (select id from public.sources where key = 'SRC-REBELS'), 'human', '적극적/소극적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0615-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0615'), 'meaning', 'uz', 'faollik/inersiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0616', (select id from public.sources where key = 'SRC-REBELS'), 'human', '활발하다/조용하다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0616-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0616'), 'meaning', 'uz', 'faol/sokin', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0617', (select id from public.sources where key = 'SRC-REBELS'), 'human', '내성적/외향적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0617-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0617'), 'meaning', 'uz', 'ichki/ochiq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0618', (select id from public.sources where key = 'SRC-REBELS'), 'human', '개방적/보수적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0618-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0618'), 'meaning', 'uz', 'ochiq/yopiq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0619', (select id from public.sources where key = 'SRC-REBELS'), 'human', '의존적/독립적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0619-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0619'), 'meaning', 'uz', 'bog‘liqlik/mustaqillik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0620', (select id from public.sources where key = 'SRC-REBELS'), 'human', '능동적/수동적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0620-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0620'), 'meaning', 'uz', 'faollik/pasivlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0621', (select id from public.sources where key = 'SRC-REBELS'), 'human', '부끄러움을 타다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0621-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0621'), 'meaning', 'uz', 'uyatli', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0622', (select id from public.sources where key = 'SRC-REBELS'), 'human', '공격적', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0622-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0622'), 'meaning', 'uz', 'hujumkor', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0623', (select id from public.sources where key = 'SRC-REBELS'), 'human', '개성이 강하다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0623-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0623'), 'meaning', 'uz', 'kuchli shaxsiyatga ega', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0624', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유대감', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0624-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0624'), 'meaning', 'uz', 'bog‘lanish hissi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0625', (select id from public.sources where key = 'SRC-REBELS'), 'human', '신뢰감', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0625-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0625'), 'meaning', 'uz', 'ishonch hissi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0626', (select id from public.sources where key = 'SRC-REBELS'), 'human', '차분하다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0626-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0626'), 'meaning', 'uz', 'tinch', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0627', (select id from public.sources where key = 'SRC-REBELS'), 'human', '자신감', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0627-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0627'), 'meaning', 'uz', 'o‘ziga ishonch', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0628', (select id from public.sources where key = 'SRC-REBELS'), 'human', '부담감', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0628-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0628'), 'meaning', 'uz', 'bosim hissi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0629', (select id from public.sources where key = 'SRC-REBELS'), 'human', '육아 휴직', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0629-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0629'), 'meaning', 'uz', 'ota-ona ta’tili', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0630', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유급/무급 휴직', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0630-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0630'), 'meaning', 'uz', 'to‘langan/to‘lanmagan ta’til', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0631', (select id from public.sources where key = 'SRC-REBELS'), 'human', '장학 제도', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0631-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0631'), 'meaning', 'uz', 'stipendiya tizimi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0632', (select id from public.sources where key = 'SRC-REBELS'), 'human', '탄력적 근무제', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0632-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0632'), 'meaning', 'uz', 'moslashuvchan ish tartibi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0633', (select id from public.sources where key = 'SRC-REBELS'), 'human', '을/를 보장하다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0633-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0633'), 'meaning', 'uz', 'ta’minlash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0634', (select id from public.sources where key = 'SRC-REBELS'), 'human', '이/가 보장되다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0634-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0634'), 'meaning', 'uz', 'ta’minlanishi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0635', (select id from public.sources where key = 'SRC-REBELS'), 'human', '말처럼 쉬운 일이 아니다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0635-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0635'), 'meaning', 'uz', 'Gapirgandek oson emas', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0635-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0635'), '매일 단어를 3개씩 외우는 것은 말처럼 쉬운 일이 아니다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0635-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0635-EX1'), 'sentence', 'uz', 'Har kuni 3 ta so‘zni yodlash, gapirgandek oson emas.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0636', (select id from public.sources where key = 'SRC-REBELS'), 'human', '거의 불가능하다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0636-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0636'), 'meaning', 'uz', 'Deyarli imkonsiz', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0636-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0636'), '탄수화물을 먹지 않고 사는 것은 거의 불가능하다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0636-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0636-EX1'), 'sentence', 'uz', 'Uglevodlar yemay yashash deyarli imkonsiz.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0637', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-다는 장점도 있다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0637-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0637'), 'meaning', 'uz', '-ning ham foydali tomonlari bor', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0637-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0637'), '재미있게 공부할 수 있다는 장점도 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0637-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0637-EX1'), 'sentence', 'uz', 'Qiziqarli o‘rganishning ham foydali tomoni bor.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0638', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 매우 중요하다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0638-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0638'), 'meaning', 'uz', '- juda muhim', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0638-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0638'), '아이의 정서 발달에 매우 중요하다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0638-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0638-EX1'), 'sentence', 'uz', 'Bolaning hissiy rivojlanishi juda muhim.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0639', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-라는 인식이 지배적이다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0639-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0639'), 'meaning', 'uz', '- degan tushuncha hukmron', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0639-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0639'), '외국어 공부는 무조건 일찍 시켜야 한다는 인식이 지배적이었다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0639-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0639-EX1'), 'sentence', 'uz', 'Chet tilda o‘rganishni har doim erta boshlash kerakligi haqidagi tushuncha hukmron edi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0640', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-찬반 의견이 팽팽하다', null, 1, null, (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0640-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0640'), 'meaning', 'uz', '-ga qarshi va qo‘llab-quvvatlovchi fikrlar teng', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0640-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0640'), '공원을 없애고 주차장을 만드는 것에 대한 찬반 의견이 팽팽한 상황이다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0640-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0640-EX1'), 'sentence', 'uz', 'Parkni yo‘q qilib, avtoturargoh qilish haqida qarshi va qo‘llab-quvvatlovchi fikrlar teng.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0641', (select id from public.sources where key = 'SRC-REBELS'), 'human', '세포', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0641-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0641'), 'meaning', 'uz', 'hujayra', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0642', (select id from public.sources where key = 'SRC-REBELS'), 'human', '피부', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0642-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0642'), 'meaning', 'uz', 'teri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0643', (select id from public.sources where key = 'SRC-REBELS'), 'human', '근육', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0643-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0643'), 'meaning', 'uz', 'mushak', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0644', (select id from public.sources where key = 'SRC-REBELS'), 'human', '뼈', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0644-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0644'), 'meaning', 'uz', 'suyak', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0645', (select id from public.sources where key = 'SRC-REBELS'), 'human', '혈관', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0645-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0645'), 'meaning', 'uz', 'qon tomiri', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0646', (select id from public.sources where key = 'SRC-REBELS'), 'human', '관절', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0646-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0646'), 'meaning', 'uz', 'bo‘g‘im', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0647', (select id from public.sources where key = 'SRC-REBELS'), 'human', '기관: organ', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0647-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0647'), 'meaning', 'uz', 'ichki a’zo', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0648', (select id from public.sources where key = 'SRC-REBELS'), 'human', '척추', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0648-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0648'), 'meaning', 'uz', 'umurtqa', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0649', (select id from public.sources where key = 'SRC-REBELS'), 'human', '뇌', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0649-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0649'), 'meaning', 'uz', 'miya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0650', (select id from public.sources where key = 'SRC-REBELS'), 'human', '팔', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0650-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0650'), 'meaning', 'uz', 'qo‘l', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0651', (select id from public.sources where key = 'SRC-REBELS'), 'human', '다리', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0651-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0651'), 'meaning', 'uz', 'oyoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0652', (select id from public.sources where key = 'SRC-REBELS'), 'human', '허리', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0652-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0652'), 'meaning', 'uz', 'bel', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0653', (select id from public.sources where key = 'SRC-REBELS'), 'human', '손톱', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0653-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0653'), 'meaning', 'uz', 'qo‘l tirnog‘i', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0654', (select id from public.sources where key = 'SRC-REBELS'), 'human', '발톱', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0654-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0654'), 'meaning', 'uz', 'oyoq tirnog‘i', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0655', (select id from public.sources where key = 'SRC-REBELS'), 'human', '치아', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0655-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0655'), 'meaning', 'uz', 'tish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0656', (select id from public.sources where key = 'SRC-REBELS'), 'human', '잇몸', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0656-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0656'), 'meaning', 'uz', 'milk', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0657', (select id from public.sources where key = 'SRC-REBELS'), 'human', '위', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0657-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0657'), 'meaning', 'uz', 'oshqozon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0658', (select id from public.sources where key = 'SRC-REBELS'), 'human', '간', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0658-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0658'), 'meaning', 'uz', 'jigar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0659', (select id from public.sources where key = 'SRC-REBELS'), 'human', '신장(콩팥)', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0659-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0659'), 'meaning', 'uz', 'buyrak', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0660', (select id from public.sources where key = 'SRC-REBELS'), 'human', '허파(폐)', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0660-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0660'), 'meaning', 'uz', 'o‘pka', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0661', (select id from public.sources where key = 'SRC-REBELS'), 'human', '심장', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0661-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0661'), 'meaning', 'uz', 'yurak', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0662', (select id from public.sources where key = 'SRC-REBELS'), 'human', '대장', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0662-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0662'), 'meaning', 'uz', 'yo‘g‘on ichak', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0663', (select id from public.sources where key = 'SRC-REBELS'), 'human', '신경 세포', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0663-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0663'), 'meaning', 'uz', 'asab hujayrasi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0664', (select id from public.sources where key = 'SRC-REBELS'), 'human', '호르몬', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0664-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0664'), 'meaning', 'uz', 'gormon', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0665', (select id from public.sources where key = 'SRC-REBELS'), 'human', '전달 물질', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0665-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0665'), 'meaning', 'uz', 'signal moddasi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0666', (select id from public.sources where key = 'SRC-REBELS'), 'human', '시각', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0666-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0666'), 'meaning', 'uz', 'ko‘rish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0667', (select id from public.sources where key = 'SRC-REBELS'), 'human', '청각', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0667-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0667'), 'meaning', 'uz', 'eshitish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0668', (select id from public.sources where key = 'SRC-REBELS'), 'human', '후각', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0668-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0668'), 'meaning', 'uz', 'hid bilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0669', (select id from public.sources where key = 'SRC-REBELS'), 'human', '미각', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0669-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0669'), 'meaning', 'uz', 'ta’m bilish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0670', (select id from public.sources where key = 'SRC-REBELS'), 'human', '촉각', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0670-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0670'), 'meaning', 'uz', 'teginish hissi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0671', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-을/를 자극하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0671-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0671'), 'meaning', 'uz', 'qo‘zg‘atmoq / ta’sir ko‘rsatmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0672', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 반응하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0672-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0672'), 'meaning', 'uz', 'javob bermoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0673', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 무리가 가다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0673-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0673'), 'meaning', 'uz', 'zo‘riqmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0674', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 해롭다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0674-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0674'), 'meaning', 'uz', 'zararli bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0675', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 도움이 되다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0675-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0675'), 'meaning', 'uz', 'foydali bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0676', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-이/가 예민하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0676-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0676'), 'meaning', 'uz', 'sezgir bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0677', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-이/가 둔하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0677-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0677'), 'meaning', 'uz', 'nozik emas / bo‘g‘iq bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0678', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-이/가 발달하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0678-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0678'), 'meaning', 'uz', 'rivojlanmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0679', (select id from public.sources where key = 'SRC-REBELS'), 'human', '퇴화하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0679-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0679'), 'meaning', 'uz', 'zaiflashmoq / qisqarish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0680', (select id from public.sources where key = 'SRC-REBELS'), 'human', '소화 불량', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0680-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0680'), 'meaning', 'uz', 'hazm bo‘lmaslik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0681', (select id from public.sources where key = 'SRC-REBELS'), 'human', '통증', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0681-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0681'), 'meaning', 'uz', 'og‘riq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0682', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불면증', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0682-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0682'), 'meaning', 'uz', 'uyqusizlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0683', (select id from public.sources where key = 'SRC-REBELS'), 'human', '무기력', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0683-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0683'), 'meaning', 'uz', 'charchoq / quvvat yo‘qligi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0684', (select id from public.sources where key = 'SRC-REBELS'), 'human', '만성 피로', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0684-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0684'), 'meaning', 'uz', 'surunkali charchoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0685', (select id from public.sources where key = 'SRC-REBELS'), 'human', '성인병', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0685-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0685'), 'meaning', 'uz', 'kattalar kasalliklari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0686', (select id from public.sources where key = 'SRC-REBELS'), 'human', '비만', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0686-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0686'), 'meaning', 'uz', 'semizlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0687', (select id from public.sources where key = 'SRC-REBELS'), 'human', '당뇨', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0687-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0687'), 'meaning', 'uz', 'diabet', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0688', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고혈압', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0688-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0688'), 'meaning', 'uz', 'yuqori qon bosimi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0689', (select id from public.sources where key = 'SRC-REBELS'), 'human', '고지혈증', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0689-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0689'), 'meaning', 'uz', 'yuqori xolesterin', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0690', (select id from public.sources where key = 'SRC-REBELS'), 'human', '치매', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0690-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0690'), 'meaning', 'uz', 'aqli zaiflik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0691', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 걸리다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0691-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0691'), 'meaning', 'uz', '(kasallikka) chalinmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0692', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-을/를 일으키다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0692-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0692'), 'meaning', 'uz', 'sabab bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0693', (select id from public.sources where key = 'SRC-REBELS'), 'human', '회복되다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0693-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0693'), 'meaning', 'uz', 'tiklanmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0694', (select id from public.sources where key = 'SRC-REBELS'), 'human', '호전되다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0694-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0694'), 'meaning', 'uz', 'yaxshilanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0695', (select id from public.sources where key = 'SRC-REBELS'), 'human', '악화되다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0695-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0695'), 'meaning', 'uz', 'yomonlashish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0696', (select id from public.sources where key = 'SRC-REBELS'), 'human', '심각하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0696-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0696'), 'meaning', 'uz', 'jiddiy bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0697', (select id from public.sources where key = 'SRC-REBELS'), 'human', '피로 회복', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0697-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0697'), 'meaning', 'uz', 'charchoqni tiklash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0698', (select id from public.sources where key = 'SRC-REBELS'), 'human', '혈압 조절', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0698-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0698'), 'meaning', 'uz', 'qon bosimini boshqarish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0699', (select id from public.sources where key = 'SRC-REBELS'), 'human', '피부 미용', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0699-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0699'), 'meaning', 'uz', 'teri go‘zalligi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0700', (select id from public.sources where key = 'SRC-REBELS'), 'human', '소화를 돕다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0700-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0700'), 'meaning', 'uz', 'hazmni yaxshilash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0701', (select id from public.sources where key = 'SRC-REBELS'), 'human', '유해하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0701-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0701'), 'meaning', 'uz', 'zararli bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0702', (select id from public.sources where key = 'SRC-REBELS'), 'human', '무해하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0702-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0702'), 'meaning', 'uz', 'zararsiz bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0703', (select id from public.sources where key = 'SRC-REBELS'), 'human', '무방하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0703-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0703'), 'meaning', 'uz', 'zarar qilmaslik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0704', (select id from public.sources where key = 'SRC-REBELS'), 'human', '신진대사', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0704-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0704'), 'meaning', 'uz', 'modda almashinuvi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0705', (select id from public.sources where key = 'SRC-REBELS'), 'human', '기초 대사량', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0705-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0705'), 'meaning', 'uz', 'bazal modda almashinuvi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0706', (select id from public.sources where key = 'SRC-REBELS'), 'human', '약', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0706-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0706'), 'meaning', 'uz', 'dori', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0707', (select id from public.sources where key = 'SRC-REBELS'), 'human', '의약품', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0707-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0707'), 'meaning', 'uz', 'dori vositalari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0708', (select id from public.sources where key = 'SRC-REBELS'), 'human', '주사', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0708-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0708'), 'meaning', 'uz', 'in’ektsiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0709', (select id from public.sources where key = 'SRC-REBELS'), 'human', '처방', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0709-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0709'), 'meaning', 'uz', 'retsept', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0710', (select id from public.sources where key = 'SRC-REBELS'), 'human', '안전하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0710-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0710'), 'meaning', 'uz', 'xavfsiz bo‘lmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0711', (select id from public.sources where key = 'SRC-REBELS'), 'human', '내복약', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0711-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0711'), 'meaning', 'uz', 'ichish uchun dori', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0712', (select id from public.sources where key = 'SRC-REBELS'), 'human', '외용약', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0712-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0712'), 'meaning', 'uz', 'tashqi foydalanish uchun dori', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0713', (select id from public.sources where key = 'SRC-REBELS'), 'human', '복용하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0713-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0713'), 'meaning', 'uz', 'dori ichmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0714', (select id from public.sources where key = 'SRC-REBELS'), 'human', '숙지하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0714-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0714'), 'meaning', 'uz', 'tushunib yetmoq / o‘rganmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0715', (select id from public.sources where key = 'SRC-REBELS'), 'human', '채식', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0715-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0715'), 'meaning', 'uz', 'vegetarian', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0716', (select id from public.sources where key = 'SRC-REBELS'), 'human', '육식', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0716-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0716'), 'meaning', 'uz', 'go‘shtli ovqat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0717', (select id from public.sources where key = 'SRC-REBELS'), 'human', '채식주의', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0717-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0717'), 'meaning', 'uz', 'vegetarianlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0718', (select id from public.sources where key = 'SRC-REBELS'), 'human', '식물성', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0718-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0718'), 'meaning', 'uz', 'o‘simlik mahsulotlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0719', (select id from public.sources where key = 'SRC-REBELS'), 'human', '동물성', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0719-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0719'), 'meaning', 'uz', 'hayvon mahsulotlari', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0720', (select id from public.sources where key = 'SRC-REBELS'), 'human', '인스턴트 식품', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0720-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0720'), 'meaning', 'uz', 'tez tayyorlanadigan ovqat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0721', (select id from public.sources where key = 'SRC-REBELS'), 'human', '발효 식품', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0721-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0721'), 'meaning', 'uz', 'fermentlangan oziq-ovqat', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0722', (select id from public.sources where key = 'SRC-REBELS'), 'human', '정크푸드', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0722-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0722'), 'meaning', 'uz', 'junk food', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0723', (select id from public.sources where key = 'SRC-REBELS'), 'human', '슬로우푸드', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0723-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0723'), 'meaning', 'uz', 'slow food', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0724', (select id from public.sources where key = 'SRC-REBELS'), 'human', '지방', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0724-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0724'), 'meaning', 'uz', 'yog‘', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0725', (select id from public.sources where key = 'SRC-REBELS'), 'human', '비타민', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0725-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0725'), 'meaning', 'uz', 'vitamin', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0726', (select id from public.sources where key = 'SRC-REBELS'), 'human', '탄수화물', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0726-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0726'), 'meaning', 'uz', 'uglevodlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0727', (select id from public.sources where key = 'SRC-REBELS'), 'human', '무기질', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0727-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0727'), 'meaning', 'uz', 'minerallar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0728', (select id from public.sources where key = 'SRC-REBELS'), 'human', '섬유소', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0728-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0728'), 'meaning', 'uz', 'tolalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0729', (select id from public.sources where key = 'SRC-REBELS'), 'human', '열량', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0729-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0729'), 'meaning', 'uz', 'kaloriyalar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0730', (select id from public.sources where key = 'SRC-REBELS'), 'human', '칼로리', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0730-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0730'), 'meaning', 'uz', 'kaloriya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0731', (select id from public.sources where key = 'SRC-REBELS'), 'human', '균형', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0731-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0731'), 'meaning', 'uz', 'balans', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0732', (select id from public.sources where key = 'SRC-REBELS'), 'human', '불균형', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0732-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0732'), 'meaning', 'uz', 'disbalans', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0733', (select id from public.sources where key = 'SRC-REBELS'), 'human', '균형 잡힌 식단', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0733-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0733'), 'meaning', 'uz', 'muvozanatli ovqatlanish', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0734', (select id from public.sources where key = 'SRC-REBELS'), 'human', '조미료', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0734-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0734'), 'meaning', 'uz', 'ziravorlar', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0735', (select id from public.sources where key = 'SRC-REBELS'), 'human', '수분', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0735-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0735'), 'meaning', 'uz', 'namlik', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0736', (select id from public.sources where key = 'SRC-REBELS'), 'human', '향', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0736-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0736'), 'meaning', 'uz', 'hid', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0737', (select id from public.sources where key = 'SRC-REBELS'), 'human', '첨가하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0737-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0737'), 'meaning', 'uz', 'qo‘shmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0738', (select id from public.sources where key = 'SRC-REBELS'), 'human', '넣다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0738-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0738'), 'meaning', 'uz', 'solmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0739', (select id from public.sources where key = 'SRC-REBELS'), 'human', '더하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0739-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0739'), 'meaning', 'uz', 'qo‘shmoq, oshirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0740', (select id from public.sources where key = 'SRC-REBELS'), 'human', '끓이다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0740-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0740'), 'meaning', 'uz', 'qaynatmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0741', (select id from public.sources where key = 'SRC-REBELS'), 'human', '가열하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0741-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0741'), 'meaning', 'uz', 'isitmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0742', (select id from public.sources where key = 'SRC-REBELS'), 'human', '데우다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0742-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0742'), 'meaning', 'uz', 'isitmok', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0743', (select id from public.sources where key = 'SRC-REBELS'), 'human', '삶다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0743-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0743'), 'meaning', 'uz', 'qovurmoq, qaynatmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0744', (select id from public.sources where key = 'SRC-REBELS'), 'human', '볶다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0744-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0744'), 'meaning', 'uz', 'qovurmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0745', (select id from public.sources where key = 'SRC-REBELS'), 'human', '찌다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0745-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0745'), 'meaning', 'uz', 'bug‘lash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0746', (select id from public.sources where key = 'SRC-REBELS'), 'human', '졸이다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0746-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0746'), 'meaning', 'uz', 'pishirib qoldirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0747', (select id from public.sources where key = 'SRC-REBELS'), 'human', '비비다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0747-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0747'), 'meaning', 'uz', 'aralashtirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0748', (select id from public.sources where key = 'SRC-REBELS'), 'human', '젓다 : aralashtirmoq', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0748-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0748'), 'meaning', 'uz', 'qaynoq suyuqliklar uchun', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0749', (select id from public.sources where key = 'SRC-REBELS'), 'human', '썰다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0749-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0749'), 'meaning', 'uz', 'kesmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0750', (select id from public.sources where key = 'SRC-REBELS'), 'human', '다지다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0750-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0750'), 'meaning', 'uz', 'maydalamoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0751', (select id from public.sources where key = 'SRC-REBELS'), 'human', '뿌리다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0751-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0751'), 'meaning', 'uz', 'sepmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0752', (select id from public.sources where key = 'SRC-REBELS'), 'human', '냉각하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0752-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0752'), 'meaning', 'uz', 'sovitmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0753', (select id from public.sources where key = 'SRC-REBELS'), 'human', '응고하다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0753-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0753'), 'meaning', 'uz', 'qotirmoq', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0754', (select id from public.sources where key = 'SRC-REBELS'), 'human', '식초의 새로운 사용법이 주목을 받고 있다.', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0754-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0754'), 'meaning', 'uz', 'Sirkani yangi qo‘llanilishi e’tibor qozonmoqda.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0755', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-이/가 -보다 더 나은 것은 결코 아니다.', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0755-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0755'), 'meaning', 'uz', '-ga qaraganda yaxshiroq bo‘lgan narsa hech qachon yo‘q.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0755-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0755'), '사람들의 생각처럼 꿀이 설탕보다 더 나은 것은 결코 아니다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0755-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0755-EX1'), 'sentence', 'uz', 'Odamlarning fikriga ko‘ra, asal shakarni qaraganda yaxshiroq emas.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0756', (select id from public.sources where key = 'SRC-REBELS'), 'human', '비만을 걱정하지 않는다면 먹어도 무방하다.', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0756-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0756'), 'meaning', 'uz', 'Semirib ketishni o‘ylamasangiz, yeyish mumkin.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0757', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-은/는 경향이 있다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0757-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0757'), 'meaning', 'uz', 'odatda shunday bo‘ladi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0757-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0757'), '사람들은 숫자를 사용한 주장을 쉽게 믿는 경향이 있다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0757-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0757-EX1'), 'sentence', 'uz', 'Odamlar raqamlar bilan keltirilgan dalillarni osonlikcha ishonib qabul qilishadi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0758', (select id from public.sources where key = 'SRC-REBELS'), 'human', '나쁜 자세는 척추 건강에 부정적 영향을 끼친다.', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0758-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0758'), 'meaning', 'uz', 'Yomon holat umurtqa sog‘lig‘iga salbiy ta’sir qiladi.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0759', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-은/는 추세이다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0759-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0759'), 'meaning', 'uz', 'o‘zgarmayotgan tendensiya', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0759-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0759'), '최근에는 깊은맛에 대한 관심이 높아지는 추세이다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0759-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0759-EX1'), 'sentence', 'uz', 'So‘nggi paytlarda chuqur ta’mga bo‘lgan qiziqish ortib bormoqda.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0760', (select id from public.sources where key = 'SRC-REBELS'), 'human', '세금을 올리면 판매가격이 높아질 수밖에 없다.', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0760-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0760'), 'meaning', 'uz', 'Soliqni ko‘tarilsa, narxlar oshishi muqarrar.', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0761', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-에 대해서 다양한 각도에서 생각해 보다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0761-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0761'), 'meaning', 'uz', 'turli tomondan o‘ylash', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0761-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0761'), '그 문제에 대해서는 다양한 각도에서 생각해 봐야 한다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0761-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0761-EX1'), 'sentence', 'uz', 'Shu muammoni turli burchaklardan ko‘rib chiqish kerak.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0762', (select id from public.sources where key = 'SRC-REBELS'), 'human', '오히려 -기 쉽다', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0762-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0762'), 'meaning', 'uz', 'aksincha, osonroq bo‘ladi', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0762-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0762'), '지나치게 깨끗한 환경은 오히려 피부를 약하게 만들기 쉽다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0762-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0762-EX1'), 'sentence', 'uz', 'Haddan tashqari toza muhit, aksincha, terini zaiflashtiradi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values ('VOC-RB-0763', (select id from public.sources where key = 'SRC-REBELS'), 'human', '-뿐만 아니라 -도', null, 1, null, (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values ('VOC-RB-0763-MEANING-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_entries',
  (select id from public.vocab_entries where key = 'VOC-RB-0763'), 'meaning', 'uz', 'nafaqat balki ham', 'draft', null)
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;
insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values ('VOC-RB-0763-EX1', (select id from public.sources where key = 'SRC-REBELS'), 'human', (select id from public.vocab_entries where key = 'VOC-RB-0763'), '건강을 위해 채소뿐만 아니라 과일도 충분히 섭취하는 것이 좋습니다.', 1, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;
insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values ('VOC-RB-0763-EX1-UZ', (select id from public.sources where key = 'SRC-REBELS'), 'human', 'vocab_examples',
  (select id from public.vocab_examples where key = 'VOC-RB-0763-EX1'), 'sentence', 'uz', 'Sog‘lik uchun nafaqat sabzavotlar, balki mevalarni ham yetarlicha iste’mol qilish yaxshi.', 'draft')
on conflict (key) do update set text = excluded.text;
insert into public.plan_templates (key, source_id, authored_by, title, total_days, target_level, status, reviewed_by)
values ('PLN-45-TOPIK2-L4', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', '45 kunlik TOPIK II (4급) tayyorgarlik rejasi', 45, 4, 'draft', null)
on conflict (key) do update set title = excluded.title, total_days = excluded.total_days, target_level = excluded.target_level,
  source_id = excluded.source_id, authored_by = excluded.authored_by;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D01-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 1, 1,
  'vocabulary', 'Siyosat va farovonlik — 1-qism', '정치/복지', 15, '/vocabulary?topic=TOP-POLITICS-WELFARE&part=1', (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D01-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 1, 2,
  'grammar', 'Yangi ifodalar', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D01-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 1, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D02-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 2, 1,
  'vocabulary', 'Siyosat va farovonlik — 2-qism', '정치/복지', 15, '/vocabulary?topic=TOP-POLITICS-WELFARE&part=2', (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D02-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 2, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D02-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 2, 3,
  'writing', '51–52: gap to‘ldirish', null, 20, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D03-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 3, 1,
  'vocabulary', 'Siyosat va farovonlik — 3-qism', '정치/복지', 15, '/vocabulary?topic=TOP-POLITICS-WELFARE&part=3', (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D03-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 3, 2,
  'grammar', 'Takrorlash va mashq', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D03-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 3, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D04-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 4, 1,
  'vocabulary', 'Siyosat va farovonlik — 4-qism', '정치/복지', 15, '/vocabulary?topic=TOP-POLITICS-WELFARE&part=4', (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D04-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 4, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D04-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 4, 3,
  'writing', '53: grafik bo‘yicha matn (200–300 belgi)', null, 30, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D05-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 5, 1,
  'vocabulary', 'Siyosat va farovonlik — 5-qism', '정치/복지', 15, '/vocabulary?topic=TOP-POLITICS-WELFARE&part=5', (select id from public.topics where key = 'TOP-POLITICS-WELFARE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D05-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 5, 2,
  'writing', '54: insho (600–700 belgi)', null, 50, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D06-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 6, 1,
  'vocabulary', 'Tarix va madaniyat — 1-qism', '역사/문화', 15, '/vocabulary?topic=TOP-HISTORY-CULTURE&part=1', (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D06-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 6, 2,
  'grammar', 'Yangi ifodalar', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D06-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 6, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D07-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 7, 1,
  'vocabulary', 'Tarix va madaniyat — 2-qism', '역사/문화', 15, '/vocabulary?topic=TOP-HISTORY-CULTURE&part=2', (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D07-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 7, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D07-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 7, 3,
  'writing', '51–52: gap to‘ldirish', null, 20, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D08-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 8, 1,
  'vocabulary', 'Tarix va madaniyat — 3-qism', '역사/문화', 15, '/vocabulary?topic=TOP-HISTORY-CULTURE&part=3', (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D08-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 8, 2,
  'grammar', 'Takrorlash va mashq', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D08-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 8, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D09-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 9, 1,
  'vocabulary', 'Tarix va madaniyat — 4-qism', '역사/문화', 15, '/vocabulary?topic=TOP-HISTORY-CULTURE&part=4', (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D09-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 9, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D09-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 9, 3,
  'writing', '53: grafik bo‘yicha matn (200–300 belgi)', null, 30, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D10-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 10, 1,
  'vocabulary', 'Tarix va madaniyat — 5-qism', '역사/문화', 15, '/vocabulary?topic=TOP-HISTORY-CULTURE&part=5', (select id from public.topics where key = 'TOP-HISTORY-CULTURE'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D10-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 10, 2,
  'mock', 'Bo‘lim sinovi: o‘tgan 10 kunni tekshirish', null, 60, '/mock-tests', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D11-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 11, 1,
  'vocabulary', 'Fan va texnika — 1-qism', '과학/기술', 15, '/vocabulary?topic=TOP-SCIENCE-TECH&part=1', (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D11-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 11, 2,
  'grammar', 'Yangi ifodalar', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D11-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 11, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D12-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 12, 1,
  'vocabulary', 'Fan va texnika — 2-qism', '과학/기술', 15, '/vocabulary?topic=TOP-SCIENCE-TECH&part=2', (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D12-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 12, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D12-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 12, 3,
  'writing', '51–52: gap to‘ldirish', null, 20, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D13-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 13, 1,
  'vocabulary', 'Fan va texnika — 3-qism', '과학/기술', 15, '/vocabulary?topic=TOP-SCIENCE-TECH&part=3', (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D13-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 13, 2,
  'grammar', 'Takrorlash va mashq', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D13-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 13, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D14-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 14, 1,
  'vocabulary', 'Fan va texnika — 4-qism', '과학/기술', 15, '/vocabulary?topic=TOP-SCIENCE-TECH&part=4', (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D14-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 14, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D14-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 14, 3,
  'writing', '53: grafik bo‘yicha matn (200–300 belgi)', null, 30, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D15-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 15, 1,
  'vocabulary', 'Fan va texnika — 5-qism', '과학/기술', 15, '/vocabulary?topic=TOP-SCIENCE-TECH&part=5', (select id from public.topics where key = 'TOP-SCIENCE-TECH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D15-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 15, 2,
  'writing', '54: insho (600–700 belgi)', null, 50, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D16-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 16, 1,
  'vocabulary', 'Iqtisodiyot — 1-qism', '경제', 15, '/vocabulary?topic=TOP-ECONOMY&part=1', (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D16-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 16, 2,
  'grammar', 'Yangi ifodalar', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D16-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 16, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D17-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 17, 1,
  'vocabulary', 'Iqtisodiyot — 2-qism', '경제', 15, '/vocabulary?topic=TOP-ECONOMY&part=2', (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D17-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 17, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D17-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 17, 3,
  'writing', '51–52: gap to‘ldirish', null, 20, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D18-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 18, 1,
  'vocabulary', 'Iqtisodiyot — 3-qism', '경제', 15, '/vocabulary?topic=TOP-ECONOMY&part=3', (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D18-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 18, 2,
  'grammar', 'Takrorlash va mashq', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D18-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 18, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D19-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 19, 1,
  'vocabulary', 'Iqtisodiyot — 4-qism', '경제', 15, '/vocabulary?topic=TOP-ECONOMY&part=4', (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D19-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 19, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D19-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 19, 3,
  'writing', '53: grafik bo‘yicha matn (200–300 belgi)', null, 30, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D20-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 20, 1,
  'vocabulary', 'Iqtisodiyot — 5-qism', '경제', 15, '/vocabulary?topic=TOP-ECONOMY&part=5', (select id from public.topics where key = 'TOP-ECONOMY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D20-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 20, 2,
  'mock', 'Bo‘lim sinovi: o‘tgan 10 kunni tekshirish', null, 60, '/mock-tests', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D21-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 21, 1,
  'vocabulary', 'Atrof-muhit va iqlim — 1-qism', '환경/기후', 15, '/vocabulary?topic=TOP-ENVIRONMENT&part=1', (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D21-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 21, 2,
  'grammar', 'Yangi ifodalar', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D21-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 21, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D22-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 22, 1,
  'vocabulary', 'Atrof-muhit va iqlim — 2-qism', '환경/기후', 15, '/vocabulary?topic=TOP-ENVIRONMENT&part=2', (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D22-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 22, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D22-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 22, 3,
  'writing', '51–52: gap to‘ldirish', null, 20, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D23-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 23, 1,
  'vocabulary', 'Atrof-muhit va iqlim — 3-qism', '환경/기후', 15, '/vocabulary?topic=TOP-ENVIRONMENT&part=3', (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D23-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 23, 2,
  'grammar', 'Takrorlash va mashq', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D23-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 23, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D24-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 24, 1,
  'vocabulary', 'Atrof-muhit va iqlim — 4-qism', '환경/기후', 15, '/vocabulary?topic=TOP-ENVIRONMENT&part=4', (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D24-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 24, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D24-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 24, 3,
  'writing', '53: grafik bo‘yicha matn (200–300 belgi)', null, 30, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D25-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 25, 1,
  'vocabulary', 'Atrof-muhit va iqlim — 5-qism', '환경/기후', 15, '/vocabulary?topic=TOP-ENVIRONMENT&part=5', (select id from public.topics where key = 'TOP-ENVIRONMENT'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D25-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 25, 2,
  'writing', '54: insho (600–700 belgi)', null, 50, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D26-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 26, 1,
  'vocabulary', 'Psixologiya va xarakter — 1-qism', '심리/성격', 15, '/vocabulary?topic=TOP-PSYCHOLOGY&part=1', (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D26-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 26, 2,
  'grammar', 'Yangi ifodalar', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D26-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 26, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D27-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 27, 1,
  'vocabulary', 'Psixologiya va xarakter — 2-qism', '심리/성격', 15, '/vocabulary?topic=TOP-PSYCHOLOGY&part=2', (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D27-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 27, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D27-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 27, 3,
  'writing', '51–52: gap to‘ldirish', null, 20, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D28-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 28, 1,
  'vocabulary', 'Psixologiya va xarakter — 3-qism', '심리/성격', 15, '/vocabulary?topic=TOP-PSYCHOLOGY&part=3', (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D28-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 28, 2,
  'grammar', 'Takrorlash va mashq', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D28-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 28, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D29-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 29, 1,
  'vocabulary', 'Psixologiya va xarakter — 4-qism', '심리/성격', 15, '/vocabulary?topic=TOP-PSYCHOLOGY&part=4', (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D29-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 29, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D29-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 29, 3,
  'writing', '53: grafik bo‘yicha matn (200–300 belgi)', null, 30, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D30-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 30, 1,
  'vocabulary', 'Psixologiya va xarakter — 5-qism', '심리/성격', 15, '/vocabulary?topic=TOP-PSYCHOLOGY&part=5', (select id from public.topics where key = 'TOP-PSYCHOLOGY'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D30-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 30, 2,
  'mock', 'Bo‘lim sinovi: o‘tgan 10 kunni tekshirish', null, 60, '/mock-tests', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D31-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 31, 1,
  'vocabulary', 'Ta’lim va bola tarbiyasi — 1-qism', '교육/육아', 15, '/vocabulary?topic=TOP-EDUCATION&part=1', (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D31-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 31, 2,
  'grammar', 'Yangi ifodalar', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D31-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 31, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D32-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 32, 1,
  'vocabulary', 'Ta’lim va bola tarbiyasi — 2-qism', '교육/육아', 15, '/vocabulary?topic=TOP-EDUCATION&part=2', (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D32-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 32, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D32-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 32, 3,
  'writing', '51–52: gap to‘ldirish', null, 20, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D33-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 33, 1,
  'vocabulary', 'Ta’lim va bola tarbiyasi — 3-qism', '교육/육아', 15, '/vocabulary?topic=TOP-EDUCATION&part=3', (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D33-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 33, 2,
  'grammar', 'Takrorlash va mashq', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D33-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 33, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D34-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 34, 1,
  'vocabulary', 'Ta’lim va bola tarbiyasi — 4-qism', '교육/육아', 15, '/vocabulary?topic=TOP-EDUCATION&part=4', (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D34-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 34, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D34-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 34, 3,
  'writing', '53: grafik bo‘yicha matn (200–300 belgi)', null, 30, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D35-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 35, 1,
  'vocabulary', 'Ta’lim va bola tarbiyasi — 5-qism', '교육/육아', 15, '/vocabulary?topic=TOP-EDUCATION&part=5', (select id from public.topics where key = 'TOP-EDUCATION'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D35-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 35, 2,
  'writing', '54: insho (600–700 belgi)', null, 50, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D36-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 36, 1,
  'vocabulary', 'Sog‘liq va tana — 1-qism', '건강/신체', 15, '/vocabulary?topic=TOP-HEALTH&part=1', (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D36-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 36, 2,
  'grammar', 'Yangi ifodalar', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D36-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 36, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D37-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 37, 1,
  'vocabulary', 'Sog‘liq va tana — 2-qism', '건강/신체', 15, '/vocabulary?topic=TOP-HEALTH&part=2', (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D37-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 37, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D37-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 37, 3,
  'writing', '51–52: gap to‘ldirish', null, 20, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D38-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 38, 1,
  'vocabulary', 'Sog‘liq va tana — 3-qism', '건강/신체', 15, '/vocabulary?topic=TOP-HEALTH&part=3', (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D38-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 38, 2,
  'grammar', 'Takrorlash va mashq', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D38-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 38, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D39-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 39, 1,
  'vocabulary', 'Sog‘liq va tana — 4-qism', '건강/신체', 15, '/vocabulary?topic=TOP-HEALTH&part=4', (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D39-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 39, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D39-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 39, 3,
  'writing', '53: grafik bo‘yicha matn (200–300 belgi)', null, 30, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D40-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 40, 1,
  'vocabulary', 'Sog‘liq va tana — 5-qism', '건강/신체', 15, '/vocabulary?topic=TOP-HEALTH&part=5', (select id from public.topics where key = 'TOP-HEALTH'), 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D40-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 40, 2,
  'mock', 'Bo‘lim sinovi: o‘tgan 10 kunni tekshirish', null, 60, '/mock-tests', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D41-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 41, 1,
  'vocabulary', 'Takrorlash: barcha mavzular', null, 20, '/vocabulary', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D41-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 41, 2,
  'grammar', 'Yangi ifodalar', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D41-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 41, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D42-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 42, 1,
  'vocabulary', 'Takrorlash: barcha mavzular', null, 20, '/vocabulary', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D42-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 42, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D42-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 42, 3,
  'writing', '51–52: gap to‘ldirish', null, 20, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D43-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 43, 1,
  'vocabulary', 'Takrorlash: barcha mavzular', null, 20, '/vocabulary', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D43-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 43, 2,
  'grammar', 'Takrorlash va mashq', null, 20, '/grammar', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D43-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 43, 3,
  'listening', 'TOPIK II formatidagi mashq', null, 25, '/listening', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D44-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 44, 1,
  'vocabulary', 'Takrorlash: barcha mavzular', null, 20, '/vocabulary', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D44-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 44, 2,
  'reading', 'TOPIK II formatidagi mashq', null, 25, '/reading', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D44-3', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 44, 3,
  'writing', '53: grafik bo‘yicha matn (200–300 belgi)', null, 30, '/writing', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D45-1', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 45, 1,
  'vocabulary', 'Takrorlash: barcha mavzular', null, 20, '/vocabulary', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values ('PLN-45-TOPIK2-L4-D45-2', (select id from public.sources where key = 'SRC-SABAQ-ORIGINAL'), 'ai', (select id from public.plan_templates where key = 'PLN-45-TOPIK2-L4'), 45, 2,
  'mock', 'To‘liq sinov imtihoni (tinglash, yozish, o‘qish)', null, 180, '/mock-tests', null, 'draft', null)
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;
commit;
