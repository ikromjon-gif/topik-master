/**
 * content/ → supabase/seed/content.sql   (npm run content:seed)
 *
 * Qoidalar:
 *  - `key` bo‘yicha idempotent upsert: qayta ishga tushirish xavfsiz.
 *  - Mavjud yozuvning statusi seed orqali O‘ZGARTIRILMAYDI (pasaytirilmaydi ham,
 *    oshirilmaydi ham). Kontent o‘zgarsa, DB triggeri versiyani oshiradi va
 *    statusni `draft` ga tushiradi.
 *  - Yangi yozuv faylda `reviewed` bo‘lsa, `reviewed_by` (profiles.id) bilan
 *    kiritiladi; `verified` fayldan hech qachon qabul qilinmaydi (sxema rad etadi).
 *
 * Fayl Supabase SQL Editor'da yoki `psql -f` bilan ishga tushiriladi
 * (service role / postgres huquqi bilan).
 */
import { mkdirSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { loadContent, ROOT } from "./load.ts";

const c = loadContent();
if (c.errors.length) {
  console.error(`Kontentda ${c.errors.length} ta xato bor — avval: npm run content:validate`);
  process.exit(1);
}

const q = (v: string | null | undefined) => (v === null || v === undefined ? "null" : `'${v.replace(/'/g, "''")}'`);
const n = (v: number | null | undefined) => (v === null || v === undefined ? "null" : String(v));
const b = (v: boolean | undefined) => (v ? "true" : "false");
const src = (key: string) => `(select id from public.sources where key = ${q(key)})`;
const topic = (key: string | null) => (key ? `(select id from public.topics where key = ${q(key)})` : "null");

const out: string[] = [];
out.push("-- AVTOMATIK YARATILGAN: npm run content:seed (scripts/content/build-seed.ts). Qo‘lda tahrirlamang.");
out.push("begin;");
out.push("set local sabaq.change_note = 'content seed';");

// Manbalar
for (const s of c.sources) {
  out.push(`insert into public.sources (key, kind, name, holder, url, license, commercial_use, redistribution_allowed,
  attribution_required, attribution_text, license_status, proof_url, per_item_proof_required, notes)
values (${q(s.key)}, ${q(s.kind)}, ${q(s.name)}, ${q(s.holder)}, ${q(s.url)}, ${q(s.license)}, ${b(s.commercial_use)},
  ${b(s.redistribution_allowed)}, ${b(s.attribution_required)}, ${q(s.attribution_text)}, ${q(s.license_status)},
  ${q(s.proof_url ?? null)}, ${b(s.per_item_proof_required)}, ${q(s.notes)})
on conflict (key) do update set kind = excluded.kind, name = excluded.name, holder = excluded.holder, url = excluded.url,
  license = excluded.license, commercial_use = excluded.commercial_use, redistribution_allowed = excluded.redistribution_allowed,
  attribution_required = excluded.attribution_required, attribution_text = excluded.attribution_text,
  license_status = excluded.license_status, proof_url = excluded.proof_url,
  per_item_proof_required = excluded.per_item_proof_required, notes = excluded.notes;`);
}

// Mavzular
for (const t of c.topics) {
  out.push(`insert into public.topics (key, name_ko, name_uz, sort) values (${q(t.key)}, ${q(t.name_ko)}, ${q(t.name_uz)}, ${t.sort})
on conflict (key) do update set name_ko = excluded.name_ko, name_uz = excluded.name_uz, sort = excluded.sort;`);
}

/** Yangi yozuv uchun status ustunlari (faqat insert'da). */
function statusCols(r: { status: string; reviewed_by: string | null }) {
  return r.status === "reviewed" ? `'reviewed', ${q(r.reviewed_by)}` : `'draft', null`;
}

// Lug‘at
let vocabCount = 0;
for (const { data } of c.vocab) {
  for (const e of data.entries) {
    vocabCount += 1;
    out.push(`insert into public.vocab_entries (key, source_id, authored_by, term, pos, sense_no, level, topic_id, status, reviewed_by)
values (${q(e.key)}, ${src(e.source)}, ${q(e.authored_by)}, ${q(e.term)}, ${q(e.pos)}, ${e.sense_no}, ${n(e.level)}, ${topic(e.topic)}, ${statusCols(e.review)})
on conflict (key) do update set source_id = excluded.source_id, authored_by = excluded.authored_by, term = excluded.term,
  pos = excluded.pos, sense_no = excluded.sense_no, level = excluded.level, topic_id = excluded.topic_id;`);
    if (e.meaning) {
      out.push(`insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status, reviewed_by)
values (${q(`${e.key}-MEANING-UZ`)}, ${src(e.source)}, ${q(e.authored_by)}, 'vocab_entries',
  (select id from public.vocab_entries where key = ${q(e.key)}), 'meaning', 'uz', ${q(e.meaning.text)}, ${statusCols({ status: e.meaning.status, reviewed_by: e.review.reviewed_by })})
on conflict (key) do update set text = excluded.text, source_id = excluded.source_id;`);
    }
    e.examples.forEach((ex, i) => {
      const exKey = `${e.key}-EX${i + 1}`;
      out.push(`insert into public.vocab_examples (key, source_id, authored_by, entry_id, sentence_ko, sort, status)
values (${q(exKey)}, ${src(e.source)}, ${q(ex.authored_by)}, (select id from public.vocab_entries where key = ${q(e.key)}), ${q(ex.ko)}, ${i + 1}, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;`);
      if (ex.uz) {
        out.push(`insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values (${q(`${exKey}-UZ`)}, ${src(e.source)}, ${q(ex.authored_by)}, 'vocab_examples',
  (select id from public.vocab_examples where key = ${q(exKey)}), 'sentence', 'uz', ${q(ex.uz.text)}, 'draft')
on conflict (key) do update set text = excluded.text;`);
      }
    });
  }
}

// Reja shablonlari
for (const { data: p } of c.plans) {
  out.push(`insert into public.plan_templates (key, source_id, authored_by, title, total_days, target_level, status, reviewed_by)
values (${q(p.key)}, ${src(p.source)}, ${q(p.authored_by)}, ${q(p.title)}, ${p.total_days}, ${p.target_level}, ${statusCols(p.review)})
on conflict (key) do update set title = excluded.title, total_days = excluded.total_days, target_level = excluded.target_level,
  source_id = excluded.source_id, authored_by = excluded.authored_by;`);
  for (const t of p.tasks) {
    const key = `${p.key}-D${String(t.day).padStart(2, "0")}-${t.position}`;
    out.push(`insert into public.plan_template_tasks (key, source_id, authored_by, template_id, day, position, section, title, title_ko, estimated_minutes, href, topic_id, status, reviewed_by)
values (${q(key)}, ${src(p.source)}, ${q(p.authored_by)}, (select id from public.plan_templates where key = ${q(p.key)}), ${t.day}, ${t.position},
  ${q(t.section)}, ${q(t.title)}, ${q(t.title_ko)}, ${n(t.estimated_minutes)}, ${q(t.href)}, ${topic(t.topic)}, ${statusCols(p.review)})
on conflict (key) do update set day = excluded.day, position = excluded.position, section = excluded.section, title = excluded.title,
  title_ko = excluded.title_ko, estimated_minutes = excluded.estimated_minutes, href = excluded.href, topic_id = excluded.topic_id;`);
  }
}

out.push("commit;");
const dir = join(ROOT, "supabase", "seed");
mkdirSync(dir, { recursive: true });
writeFileSync(join(dir, "content.sql"), out.join("\n") + "\n");
console.log(`supabase/seed/content.sql: ${c.sources.length} manba, ${c.topics.length} mavzu, ${vocabCount} lug‘at yozuvi, ${c.plans.length} reja shabloni`);
