-- =============================================================================
-- Kontent va audio qoidalari testlari (bootstrap + migration'lardan keyin).
-- Har bir blok muvaffaqiyatsiz bo'lsa, psql ON_ERROR_STOP bilan to'xtaydi.
-- =============================================================================
\set ON_ERROR_STOP on
\set QUIET on

-- Yordamchilar --------------------------------------------------------------
create or replace function pg_temp.act_as(p uuid) returns void language sql as $$
  select set_config('request.jwt.claim.sub', coalesce(p::text, ''), false);
$$;

create or replace function pg_temp.expect_error(p_sql text, p_like text) returns void
language plpgsql as $$
begin
  begin
    execute p_sql;
  exception when others then
    if sqlerrm not ilike p_like then
      raise exception 'Kutilmagan xato: % (kutilgan: %)', sqlerrm, p_like;
    end if;
    return;
  end;
  raise exception 'Xato kutilgan edi, lekin so''rov bajarildi: %', p_sql;
end;
$$;

create or replace function pg_temp.ok(p_cond boolean, p_msg text) returns void
language plpgsql as $$
begin
  if not coalesce(p_cond, false) then
    raise exception 'FAIL: %', p_msg;
  end if;
  raise notice 'ok — %', p_msg;
end;
$$;

-- Foydalanuvchilar ----------------------------------------------------------
insert into auth.users (id, email) values
  ('00000000-0000-0000-0000-00000000000a', 'learner@test'),
  ('00000000-0000-0000-0000-00000000000b', 'editor@test'),
  ('00000000-0000-0000-0000-00000000000c', 'expert@test'),
  ('00000000-0000-0000-0000-00000000000d', 'admin@test');

update public.profiles set role = 'editor'        where id = '00000000-0000-0000-0000-00000000000b';
update public.profiles set role = 'korean_expert' where id = '00000000-0000-0000-0000-00000000000c';
update public.profiles set role = 'admin'         where id = '00000000-0000-0000-0000-00000000000d';

select pg_temp.ok((select count(*) = 4 from public.profiles), 'auth.users -> profiles avtomatik yaratildi');

-- 1. Profil roli: learner o'zini ko'tara olmaydi ----------------------------
select pg_temp.act_as('00000000-0000-0000-0000-00000000000a');
set role authenticated;
select pg_temp.expect_error(
  $q$update public.profiles set role = 'admin' where id = '00000000-0000-0000-0000-00000000000a'$q$,
  '%faqat admin%');
reset role;
select pg_temp.ok(true, 'learner o''z rolini o''zgartira olmaydi');

-- Test ma'lumotlari (service role sifatida) -----------------------------------
select pg_temp.act_as(null);
insert into public.topics (key, name_ko, name_uz) values ('TOP-POLITICS', '정치', 'Siyosat');
insert into public.sources (key, kind, name, holder, license_status, attribution_required, attribution_text)
values ('SRC-REBELS', 'licensed_third_party', 'Rebels lug''ati', 'Jack korean', 'pending',
        true, 'Lug''at: Rebels / Jack korean');

-- 2. Havola turidagi manbaga tijoriy huquq berilmaydi -----------------------
select pg_temp.expect_error(
  $q$insert into public.sources (key, kind, name, commercial_use)
     values ('SRC-LINK', 'official_reference', 'Havola', true)$q$,
  '%sources_link_only_no_rights%');
select pg_temp.ok(true, 'official_reference manbasiga tijoriy huquq berilmaydi');

-- 3. Lug'at: versiya, revision, status oqimi --------------------------------
insert into public.vocab_entries (key, source_id, authored_by, term, pos, level)
select 'VOC-000001', id, 'ai', '실시하다', 'verb', 4 from public.sources where key = 'SRC-SABAQ-ORIGINAL';

select pg_temp.ok(
  (select status = 'draft' and version = 1 and checksum is not null
     from public.vocab_entries where key = 'VOC-000001'),
  'yangi yozuv: draft, v1, checksum hisoblandi');
select pg_temp.ok(
  (select count(*) = 1 from public.content_revisions where entity_key = 'VOC-000001'),
  'v1 revision yozildi');

-- editor verified qila olmaydi
select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
select pg_temp.expect_error(
  $q$update public.vocab_entries
       set status = 'verified',
           reviewed_by = '00000000-0000-0000-0000-00000000000b',
           verified_by = '00000000-0000-0000-0000-00000000000b'
     where key = 'VOC-000001'$q$,
  '%korean_expert%');
select pg_temp.ok(true, 'editor verified bera olmaydi');

-- editor boshqa odam nomidan reviewed qila olmaydi
select pg_temp.expect_error(
  $q$update public.vocab_entries
       set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-00000000000c'
     where key = 'VOC-000001'$q$,
  '%joriy foydalanuvchi%');
select pg_temp.ok(true, 'reviewed_by faqat joriy foydalanuvchi');

update public.vocab_entries
   set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-00000000000b'
 where key = 'VOC-000001';
reset role;

-- service role ham AI kontentni mutaxassissiz verified qila olmaydi
select pg_temp.act_as(null);
select pg_temp.expect_error(
  $q$update public.vocab_entries set status = 'verified' where key = 'VOC-000001'$q$,
  '%korean_expert%');
select pg_temp.ok(true, 'AI kontent mutaxassissiz verified bo''lmaydi (service role ham)');

-- korean_expert verified qiladi
select pg_temp.act_as('00000000-0000-0000-0000-00000000000c');
set role authenticated;
update public.vocab_entries
   set status = 'verified', verified_by = '00000000-0000-0000-0000-00000000000c'
 where key = 'VOC-000001';
reset role;

select pg_temp.ok(
  (select status = 'verified' and verified_at is not null and version = 1
     from public.vocab_entries where key = 'VOC-000001'),
  'korean_expert verified qildi, versiya o''zgarmadi');
select pg_temp.ok(
  (select array_agg(to_status::text order by created_at) = array['draft', 'reviewed', 'verified']
     from public.content_reviews where entity_key = 'VOC-000001'),
  'status tarixi: draft -> reviewed -> verified');

-- kontent o'zgarsa: v2, draft, tasdiqlar tozalanadi
select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
update public.vocab_entries set term = '시행하다' where key = 'VOC-000001';
reset role;
select pg_temp.ok(
  (select version = 2 and status = 'draft' and verified_by is null and reviewed_by is null
     from public.vocab_entries where key = 'VOC-000001'),
  'kontent o''zgardi: v2, draft, tasdiqlar tozalandi');
select pg_temp.ok(
  (select count(*) = 2 from public.content_revisions where entity_key = 'VOC-000001'),
  'v2 revision yozildi, v1 tarixda qoldi');

-- 4. RLS: learner faqat nashr qilingan kontentni ko'radi ----------------------
select pg_temp.act_as(null);
insert into public.vocab_entries (key, source_id, term, pos, status)
select 'VOC-000002', id, '제공하다', 'verb', 'draft' from public.sources where key = 'SRC-REBELS';

-- reviewed, lekin manba pending -> ko'rinmaydi
select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
update public.vocab_entries set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-00000000000b'
 where key = 'VOC-000002';
reset role;

select pg_temp.act_as('00000000-0000-0000-0000-00000000000a');
set role authenticated;
select pg_temp.ok(
  (select count(*) = 0 from public.vocab_entries),
  'learner: draft va litsenziyasi tasdiqlanmagan manba kontenti ko''rinmaydi');
reset role;

select pg_temp.act_as(null);
-- Matnli manba dalil (proof_url) siz ham granted bo'lishi mumkin.
update public.sources set license_status = 'granted' where key = 'SRC-REBELS';

select pg_temp.act_as('00000000-0000-0000-0000-00000000000a');
set role authenticated;
select pg_temp.ok(
  (select array_agg(key) = array['VOC-000002'] from public.vocab_entries),
  'learner: manba granted bo''lgach reviewed yozuv ko''rinadi');
select pg_temp.expect_error(
  $q$insert into public.vocab_entries (key, source_id, term)
     select 'VOC-X', id, 'x' from public.sources limit 1$q$,
  '%row-level security%');
reset role;
select pg_temp.ok(true, 'learner kontent yoza olmaydi');

-- 5. Savolni nashr qilish shartlari ------------------------------------------
select pg_temp.act_as(null);
insert into public.question_types (code, section, number_from, number_to, name_ko, name_uz, points_per_item)
values ('L-04-08', 'listening', 4, 8, '이어질 수 있는 말 고르기', 'Keyingi gapni tanlash', 2);

insert into public.questions (key, source_id, section, question_type_id, stem_ko)
select 'QST-000001', s.id, 'listening', qt.id, '다음 대화를 잘 듣고 이어질 수 있는 말을 고르십시오.'
from public.sources s, public.question_types qt
where s.key = 'SRC-SABAQ-ORIGINAL' and qt.code = 'L-04-08';

insert into public.question_options (key, source_id, question_id, label, text_ko, is_correct)
select 'QST-000001-' || n, s.id, q.id, n, '선택지 ' || n, n = 2
from public.sources s, public.questions q, generate_series(1, 3) n
where s.key = 'SRC-SABAQ-ORIGINAL' and q.key = 'QST-000001';

select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
select pg_temp.expect_error(
  $q$update public.questions set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-00000000000b'
     where key = 'QST-000001'$q$,
  '%4 ta variant%');
reset role;
select pg_temp.ok(true, '3 ta variantli savol nashr qilinmaydi');

select pg_temp.act_as(null);
insert into public.question_options (key, source_id, question_id, label, text_ko, is_correct)
select 'QST-000001-4', s.id, q.id, 4, '선택지 4', false
from public.sources s, public.questions q
where s.key = 'SRC-SABAQ-ORIGINAL' and q.key = 'QST-000001';

select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
select pg_temp.expect_error(
  $q$update public.questions set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-00000000000b'
     where key = 'QST-000001'$q$,
  '%izoh%');
reset role;
select pg_temp.ok(true, 'izohsiz savol nashr qilinmaydi');

select pg_temp.act_as(null);
insert into public.explanations (key, source_id, question_id, body_md)
select 'EXP-000001', s.id, q.id, 'To''g''ri javob 2, chunki ...'
from public.sources s, public.questions q
where s.key = 'SRC-SABAQ-ORIGINAL' and q.key = 'QST-000001';

select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
update public.questions set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-00000000000b'
 where key = 'QST-000001';
reset role;
select pg_temp.ok(
  (select status = 'reviewed' from public.questions where key = 'QST-000001'),
  '4 variant + 1 to''g''ri + izoh: savol reviewed bo''ldi');

-- 6. Tarjima polimorf tozalanishi --------------------------------------------
select pg_temp.act_as(null);
insert into public.translations (key, source_id, entity_table, entity_id, field, text)
select 'TRN-000001', s.id, 'vocab_entries', v.id, 'meaning', 'taqdim etmoq'
from public.sources s, public.vocab_entries v
where s.key = 'SRC-REBELS' and v.key = 'VOC-000002';
delete from public.vocab_entries where key = 'VOC-000002';
select pg_temp.ok(
  (select count(*) = 0 from public.translations where key = 'TRN-000001'),
  'yozuv o''chirilganda tarjimasi ham o''chdi');

-- 7. Audio huquqlari ---------------------------------------------------------
insert into public.sources (key, kind, name, holder, license, commercial_use, redistribution_allowed,
                            license_status, proof_url)
values ('SRC-VT-0001', 'original_recording', 'Ovoz shartnomasi: VT-0001', 'Sabaq',
        'Voice talent release', true, true, 'granted', 'legal/voice/VT-0001.pdf');

insert into public.sources (key, kind, name, holder, url, license, commercial_use, redistribution_allowed,
                            attribution_required, attribution_text, license_status, proof_url,
                            per_item_proof_required)
values ('SRC-NIKL', 'licensed_third_party', '한국어기초사전 multimedia', '국립국어원',
        'https://krdict.korean.go.kr/', 'Individual multimedia license', true, true,
        true, '국립국어원 한국어기초사전', 'granted', 'legal/nikl/agreement.pdf', true);

insert into public.passages (key, source_id, section, kind, body_ko)
select 'PSG-000001', id, 'listening', 'dialogue', '남자: 안녕하세요. 여자: 네, 안녕하세요.'
from public.sources where key = 'SRC-SABAQ-ORIGINAL';

insert into public.audio_assets (key, source_id, storage_path, mime, provider,
                                 transcript_passage_id, transcript_version)
select 'AUD-000001', s.id, 'audio/listening/AUD-000001.mp3', 'audio/mpeg', 'native_recording', p.id, p.version
from public.sources s, public.passages p
where s.key = 'SRC-VT-0001' and p.key = 'PSG-000001';

-- editor huquqni tasdiqlay olmaydi
select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
select pg_temp.expect_error(
  $q$update public.audio_assets set rights_status = 'verified',
       rights_verified_by = '00000000-0000-0000-0000-00000000000b' where key = 'AUD-000001'$q$,
  '%faqat admin%');
reset role;
select pg_temp.ok(true, 'editor audio huquqini tasdiqlay olmaydi');

-- NIKL: asset darajasidagi proof_url'siz tasdiqlanmaydi
select pg_temp.act_as(null);
insert into public.audio_assets (key, source_id, storage_path, mime, provider)
select 'AUD-000002', id, 'audio/vocab/AUD-000002.mp3', 'audio/mpeg', 'licensed_file'
from public.sources where key = 'SRC-NIKL';

select pg_temp.act_as('00000000-0000-0000-0000-00000000000d');
set role authenticated;
select pg_temp.expect_error(
  $q$update public.audio_assets set rights_status = 'verified',
       rights_verified_by = '00000000-0000-0000-0000-00000000000d' where key = 'AUD-000002'$q$,
  '%har bir faylning%');
reset role;
select pg_temp.ok(true, 'NIKL fayli o''z proof_url''isiz tasdiqlanmaydi');

-- Admin huquqni tasdiqlaydi, lekin sifat hali draft -> chiqmaydi
select pg_temp.act_as('00000000-0000-0000-0000-00000000000d');
set role authenticated;
update public.audio_assets set rights_status = 'verified',
       rights_verified_by = '00000000-0000-0000-0000-00000000000d'
 where key = 'AUD-000001';
reset role;
select pg_temp.ok(
  (select count(*) = 0 from public.publishable_audio_assets),
  'huquq tasdiqlangan, sifat draft: audio chiqmaydi');

select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
update public.audio_assets set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-00000000000b'
 where key = 'AUD-000001';
reset role;

select pg_temp.act_as('00000000-0000-0000-0000-00000000000a');
set role authenticated;
select pg_temp.ok(
  (select array_agg(key) = array['AUD-000001'] from public.publishable_audio_assets),
  'learner: huquq + sifat tasdiqlangan audio view orqali ko''rinadi');
select pg_temp.ok(
  (select count(*) = 0 from public.audio_assets),
  'learner audio_assets jadvalini to''g''ridan-to''g''ri o''qiy olmaydi');
reset role;

-- Huquq maydoni o'zgarsa tasdiq bekor bo'ladi
select pg_temp.act_as(null);
update public.audio_assets set commercial_use = false where key = 'AUD-000001';
select pg_temp.ok(
  (select rights_status = 'unverified' from public.audio_assets where key = 'AUD-000001'),
  'huquq maydoni o''zgardi: rights_status unverified bo''ldi');
select pg_temp.ok(
  (select count(*) = 0 from public.publishable_audio_assets),
  'huquqi bekor bo''lgan audio chiqmaydi');

-- Qayta tasdiqlash, keyin transcript eskirishi
update public.audio_assets set commercial_use = null where key = 'AUD-000001';
select pg_temp.act_as('00000000-0000-0000-0000-00000000000d');
set role authenticated;
update public.audio_assets set rights_status = 'verified',
       rights_verified_by = '00000000-0000-0000-0000-00000000000d'
 where key = 'AUD-000001';
reset role;
select pg_temp.ok(
  (select count(*) = 1 from public.publishable_audio_assets),
  'qayta tasdiqlangan audio yana chiqadi');

select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
update public.passages set body_ko = '남자: 안녕하세요? 여자: 반갑습니다.' where key = 'PSG-000001';
reset role;
select pg_temp.ok(
  (select count(*) = 0 from public.publishable_audio_assets),
  'transcript o''zgardi: eskirgan audio chiqmaydi');

-- Litsenziya bekor qilinsa
select pg_temp.act_as(null);
update public.audio_assets a set transcript_version = p.version
  from public.passages p where p.id = a.transcript_passage_id and a.key = 'AUD-000001';
select pg_temp.act_as('00000000-0000-0000-0000-00000000000b');
set role authenticated;
update public.audio_assets set status = 'reviewed', reviewed_by = '00000000-0000-0000-0000-00000000000b'
 where key = 'AUD-000001';
reset role;
select pg_temp.ok(
  (select count(*) = 1 from public.publishable_audio_assets),
  'transcript versiyasi yangilangach audio qaytadi');
select pg_temp.act_as(null);
update public.sources set license_status = 'revoked' where key = 'SRC-VT-0001';
select pg_temp.ok(
  (select count(*) = 0 from public.publishable_audio_assets),
  'manba litsenziyasi revoked: audio darhol chiqmaydi');

-- 8. Storage bucket'lar yopiq ------------------------------------------------
select pg_temp.ok(
  (select bool_and(not public) and count(*) = 2 from storage.buckets where id in ('audio', 'legal')),
  'audio va legal bucket''lari yopiq');

