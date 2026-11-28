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

// Savol turlari
for (const t of c.questionTypes) {
  out.push(`insert into public.question_types (code, section, number_from, number_to, name_ko, name_uz, points_per_item)
values (${q(t.code)}, ${q(t.section)}, ${t.number_from}, ${t.number_to}, ${q(t.name_ko)}, ${q(t.name_uz)}, ${t.points_per_item})
on conflict (code, exam_format_version) do update set section = excluded.section, number_from = excluded.number_from,
  number_to = excluded.number_to, name_ko = excluded.name_ko, name_uz = excluded.name_uz, points_per_item = excluded.points_per_item;`);
}

/** Polimorf tarjima (faqat insert/upsert matni; status seed orqali o‘zgarmaydi). */
function tr(key: string, source: string, by: string, table: string, entityKeySql: string, field: string, text: string) {
  out.push(`insert into public.translations (key, source_id, authored_by, entity_table, entity_id, field, locale, text, status)
values (${q(key)}, ${src(source)}, ${q(by)}, ${q(table)}, ${entityKeySql}, ${q(field)}, 'uz', ${q(text)}, 'draft')
on conflict (key) do update set text = excluded.text;`);
}
const idOf = (table: string, key: string) => `(select id from public.${table} where key = ${q(key)})`;

// Grammatika
let grammarCount = 0;
for (const { data } of c.grammar) {
  for (const g of data.entries) {
    grammarCount += 1;
    out.push(`insert into public.grammar_points (key, source_id, authored_by, pattern, formula, level, status, reviewed_by)
values (${q(g.key)}, ${src(g.source)}, ${q(g.authored_by)}, ${q(g.pattern)}, ${q(g.formula)}, ${n(g.level)}, ${statusCols(g.review)})
on conflict (key) do update set pattern = excluded.pattern, formula = excluded.formula, level = excluded.level, source_id = excluded.source_id;`);
    tr(`${g.key}-EXPL-UZ`, g.source, g.authored_by, "grammar_points", idOf("grammar_points", g.key), "explanation", g.explanation.text);
    g.examples.forEach((ex, i) => {
      const k = `${g.key}-EX${i + 1}`;
      out.push(`insert into public.grammar_examples (key, source_id, authored_by, point_id, sentence_ko, sort, status)
values (${q(k)}, ${src(g.source)}, ${q(ex.authored_by)}, ${idOf("grammar_points", g.key)}, ${q(ex.ko)}, ${i + 1}, 'draft')
on conflict (key) do update set sentence_ko = excluded.sentence_ko, sort = excluded.sort;`);
      if (ex.uz) tr(`${k}-UZ`, g.source, ex.authored_by, "grammar_examples", idOf("grammar_examples", k), "sentence", ex.uz.text);
    });
  }
}

// Matnlar va savollar
let questionCount = 0;
for (const { data } of c.questions) {
  for (const p of data.passages) {
    out.push(`insert into public.passages (key, source_id, authored_by, section, kind, title, body_ko, speakers, level, topic_id, status)
values (${q(p.key)}, ${src(p.source)}, ${q(p.authored_by)}, ${q(p.section)}, ${q(p.kind)}, ${q(p.title)}, ${q(p.body_ko)}, ${q(JSON.stringify(p.speakers))}::jsonb, ${n(p.level)}, ${topic(p.topic)}, 'draft')
on conflict (key) do update set section = excluded.section, kind = excluded.kind, title = excluded.title, body_ko = excluded.body_ko,
  speakers = excluded.speakers, level = excluded.level, topic_id = excluded.topic_id;`);
    if (p.translation) tr(`${p.key}-UZ`, p.source, p.authored_by, "passages", idOf("passages", p.key), "body", p.translation.text);
  }
  for (const x of data.questions) {
    questionCount += 1;
    out.push(`insert into public.questions (key, source_id, authored_by, section, question_type_id, number_slot, level, passage_id, stem_ko, prompt_ko, points, status)
values (${q(x.key)}, ${src(x.source)}, ${q(x.authored_by)}, ${q(x.section)},
  (select id from public.question_types where code = ${q(x.type_code)} and exam_format_version = 'topik2-pbt-2014'),
  ${n(x.number_slot)}, ${n(x.level)}, ${x.passage ? idOf("passages", x.passage) : "null"}, ${q(x.stem_ko)}, ${q(x.prompt_ko)}, ${x.points}, 'draft')
on conflict (key) do update set section = excluded.section, question_type_id = excluded.question_type_id, number_slot = excluded.number_slot,
  level = excluded.level, passage_id = excluded.passage_id, stem_ko = excluded.stem_ko, prompt_ko = excluded.prompt_ko, points = excluded.points;`);
    for (const o of x.options) {
      const ok = `${x.key}-O${o.label}`;
      out.push(`insert into public.question_options (key, source_id, authored_by, question_id, label, text_ko, is_correct, status)
values (${q(ok)}, ${src(x.source)}, ${q(x.authored_by)}, ${idOf("questions", x.key)}, ${o.label}, ${q(o.ko)}, ${b(o.correct)}, 'draft')
on conflict (key) do update set label = excluded.label, text_ko = excluded.text_ko, is_correct = excluded.is_correct;`);
      if (o.explanation) {
        out.push(`insert into public.explanations (key, source_id, authored_by, question_id, option_id, locale, body_md, status)
values (${q(`${ok}-EXP`)}, ${src(x.source)}, ${q(x.authored_by)}, ${idOf("questions", x.key)}, ${idOf("question_options", ok)}, 'uz', ${q(o.explanation.text)}, 'draft')
on conflict (key) do update set body_md = excluded.body_md;`);
      }
    }
    out.push(`insert into public.explanations (key, source_id, authored_by, question_id, option_id, locale, body_md, status)
values (${q(`${x.key}-EXP`)}, ${src(x.source)}, ${q(x.authored_by)}, ${idOf("questions", x.key)}, null, 'uz', ${q(x.explanation.text)}, 'draft')
on conflict (key) do update set body_md = excluded.body_md;`);
  }
}

// Yozish: rubrikalar va topshiriqlar
let writingCount = 0;
for (const { data } of c.writing) {
  for (const r of data.rubrics) {
    out.push(`insert into public.rubrics (key, source_id, authored_by, task_no, name, max_points, status)
values (${q(r.key)}, ${src(r.source)}, ${q(r.authored_by)}, ${r.task_no}, ${q(r.name)}, ${r.max_points}, 'draft')
on conflict (key) do update set task_no = excluded.task_no, name = excluded.name, max_points = excluded.max_points;`);
    r.criteria.forEach((cr, i) => {
      const k = `${r.key}-${cr.code.toUpperCase()}`;
      out.push(`insert into public.rubric_criteria (key, source_id, authored_by, rubric_id, code, name_ko, max_points, bands, sort, status)
values (${q(k)}, ${src(r.source)}, ${q(r.authored_by)}, ${idOf("rubrics", r.key)}, ${q(cr.code)}, ${q(cr.name_ko)}, ${cr.max_points}, ${q(JSON.stringify(cr.bands))}::jsonb, ${i + 1}, 'draft')
on conflict (key) do update set code = excluded.code, name_ko = excluded.name_ko, max_points = excluded.max_points, bands = excluded.bands, sort = excluded.sort;`);
      tr(`${k}-NAME-UZ`, r.source, r.authored_by, "rubric_criteria", idOf("rubric_criteria", k), "name", cr.name_uz);
    });
  }
  for (const t of data.tasks) {
    writingCount += 1;
    out.push(`insert into public.writing_tasks (key, source_id, authored_by, task_no, question_type_id, level, prompt_ko, material, min_chars, max_chars, points, rubric_id, status)
values (${q(t.key)}, ${src(t.source)}, ${q(t.authored_by)}, ${t.task_no},
  (select id from public.question_types where code = ${q(t.task_no <= 52 ? "W-51-52" : `W-${t.task_no}`)} and exam_format_version = 'topik2-pbt-2014'),
  ${n(t.level)}, ${q(t.prompt_ko)}, ${q(JSON.stringify(t.material))}::jsonb, ${n(t.min_chars)}, ${n(t.max_chars)}, ${t.points},
  ${t.rubric ? idOf("rubrics", t.rubric) : "null"}, 'draft')
on conflict (key) do update set task_no = excluded.task_no, question_type_id = excluded.question_type_id, level = excluded.level,
  prompt_ko = excluded.prompt_ko, material = excluded.material, min_chars = excluded.min_chars, max_chars = excluded.max_chars,
  points = excluded.points, rubric_id = excluded.rubric_id;`);
    tr(`${t.key}-INSTR-UZ`, t.source, t.authored_by, "writing_tasks", idOf("writing_tasks", t.key), "instruction", t.instruction_uz);
    if (t.model_answer) {
      const mk = `${t.key}-MODEL`;
      out.push(`insert into public.model_answers (key, source_id, authored_by, writing_task_id, body_ko, status)
values (${q(mk)}, ${src(t.source)}, ${q(t.authored_by)}, ${idOf("writing_tasks", t.key)}, ${q(t.model_answer.ko)}, 'draft')
on conflict (key) do update set body_ko = excluded.body_ko;`);
      tr(`${mk}-COMMENT-UZ`, t.source, t.authored_by, "model_answers", idOf("model_answers", mk), "commentary", t.model_answer.commentary_uz);
    }
  }
}

out.push("commit;");
const dir = join(ROOT, "supabase", "seed");
mkdirSync(dir, { recursive: true });
writeFileSync(join(dir, "content.sql"), out.join("\n") + "\n");
console.log(
  `supabase/seed/content.sql: ${c.sources.length} manba, ${c.topics.length} mavzu, ${vocabCount} lug‘at yozuvi, ${c.plans.length} reja shabloni, ` +
    `${c.questionTypes.length} savol turi, ${grammarCount} grammatika, ${questionCount} savol, ${writingCount} yozish topshirig‘i`,
);
