/**
 * Kontent fayllari uchun yagona Zod sxemalari.
 * Bir xil sxemalar `scripts/content/*` (validate, seed) va keyinchalik
 * Admin Panel API'sida ishlatiladi.
 * Tashqi importlar faqat `zod` — `node --test` va skriptlarda to‘g‘ridan-to‘g‘ri ishlaydi.
 */
import { z } from "zod";

export const KEY = {
  source: /^SRC-[A-Z0-9-]+$/,
  topic: /^TOP-[A-Z0-9-]+$/,
  vocab: /^VOC-[A-Z0-9-]+$/,
  grammar: /^GRM-[A-Z0-9-]+$/,
  passage: /^PSG-[A-Z0-9-]+$/,
  question: /^QST-[A-Z0-9-]+$/,
  writing: /^WRT-[A-Z0-9-]+$/,
  plan: /^PLN-[A-Z0-9-]+$/,
  rubric: /^RUB-[A-Z0-9-]+$/,
} as const;

/** O‘zbek matnida ASCII apostrof va U+02BB ishlatilmaydi (docs/design-system.md). */
export const uzText = z
  .string()
  .trim()
  .min(1)
  .refine((s) => !/[A-Za-z]'[A-Za-z]/.test(s), "O‘zbek matnida ASCII ' o‘rniga ‘ (U+2018) yoki ’ (U+2019) ishlating")
  .refine((s) => !s.includes("ʻ"), "ʻ (U+02BB) o‘rniga ‘ (U+2018) ishlating");

export const koText = z.string().trim().min(1).refine((s) => /[가-힣ㄱ-ㆎ]/.test(s), "Koreyscha (Hangul) matn bo‘lishi kerak");

export const level = z.number().int().min(3).max(6);
export const contentStatus = z.enum(["draft", "reviewed", "verified"]);
export const authoredBy = z.enum(["human", "ai"]);

/** Fayldagi tekshiruv holati. `verified` fayldan qabul qilinmaydi (faqat Admin Panel / maxsus skript). */
export const review = z
  .object({
    status: contentStatus.default("draft"),
    reviewed_by: z.string().nullable().default(null),
    notes: z.array(z.string()).default([]),
  })
  .default({ status: "draft", reviewed_by: null, notes: [] })
  .superRefine((r, ctx) => {
    if (r.status === "verified") {
      ctx.addIssue({ code: "custom", message: "verified statusini fayl orqali berib bo‘lmaydi (faqat korean_expert, Admin Panel orqali)" });
    }
    if (r.status === "reviewed" && !r.reviewed_by) {
      ctx.addIssue({ code: "custom", message: "reviewed uchun reviewed_by majburiy (meta/reviewers.json dagi id)" });
    }
  });

export const translation = z.object({ text: uzText, status: contentStatus.default("draft") });

// -----------------------------------------------------------------------------
export const sourceSchema = z
  .object({
    key: z.string().regex(KEY.source),
    kind: z.enum(["original_content", "original_recording", "licensed_third_party", "official_reference", "third_party_link"]),
    name: z.string().min(1),
    holder: z.string().optional(),
    url: z.string().url().optional(),
    license: z.string().optional(),
    commercial_use: z.boolean(),
    redistribution_allowed: z.boolean(),
    attribution_required: z.boolean(),
    attribution_text: z.string().optional(),
    license_status: z.enum(["not_requested", "pending", "granted", "denied", "revoked"]),
    proof_url: z.string().nullable().optional(),
    per_item_proof_required: z.boolean().optional(),
    notes: z.string().optional(),
  })
  .superRefine((s, ctx) => {
    if (s.attribution_required && !s.attribution_text) ctx.addIssue({ code: "custom", message: "attribution_text majburiy" });
    if ((s.kind === "official_reference" || s.kind === "third_party_link") && (s.commercial_use || s.redistribution_allowed)) {
      ctx.addIssue({ code: "custom", message: "Havola manbasiga tijoriy/tarqatish huquqi berilmaydi" });
    }
  });

export const reviewerSchema = z.object({
  id: z.string().uuid(), // profiles.id
  name: z.string().min(1),
  role: z.enum(["editor", "korean_expert"]),
});

export const topicSchema = z.object({
  key: z.string().regex(KEY.topic),
  name_ko: koText,
  name_uz: uzText,
  sort: z.number().int(),
});

// -----------------------------------------------------------------------------
export const vocabEntrySchema = z.object({
  key: z.string().regex(KEY.vocab),
  source: z.string().regex(KEY.source),
  authored_by: authoredBy,
  term: koText,
  kind: z.enum(["word", "expression"]).default("word"),
  hanja: z.string().optional(),
  pos: z
    .enum(["noun", "dependent_noun", "pronoun", "numeral", "verb", "adjective", "adverb", "determiner", "particle", "interjection", "affix", "expression"])
    .nullable()
    .default(null),
  sense_no: z.number().int().min(1).default(1),
  level: level.nullable().default(null),
  topic: z.string().regex(KEY.topic).nullable().default(null),
  category: z.object({ ko: z.string(), uz: z.string().nullable() }).nullable().default(null),
  meaning: translation.nullable(),
  examples: z.array(z.object({ ko: koText, uz: translation.nullable().default(null), authored_by: authoredBy })).default([]),
  review,
});

export const vocabFileSchema = z.object({
  source: z.string().regex(KEY.source),
  lesson: z.object({ no: z.number().int(), title_ko: z.string(), title_uz: z.string().nullable() }).optional(),
  entries: z.array(vocabEntrySchema),
});

export const grammarPointSchema = z.object({
  key: z.string().regex(KEY.grammar),
  source: z.string().regex(KEY.source),
  authored_by: authoredBy,
  pattern: koText,
  formula: z.string().min(1),
  level: level.nullable(),
  explanation: translation,
  examples: z.array(z.object({ ko: koText, uz: translation.nullable(), authored_by: authoredBy })).min(3, "Kamida 3 ta misol"),
  review,
});

export const questionSchema = z.object({
  key: z.string().regex(KEY.question),
  source: z.string().regex(KEY.source),
  authored_by: authoredBy,
  section: z.enum(["listening", "reading"]),
  type_code: z.string().regex(/^[LR]-\d{2}(-\d{2})?$/),
  level: level.nullable(),
  passage: z.string().regex(KEY.passage).nullable(),
  number_slot: z.number().int().min(1).max(50).nullable().default(null),
  stem_ko: koText,
  prompt_ko: z.string().nullable().default(null),
  points: z.number().int().positive().default(2),
  options: z
    .array(z.object({ label: z.number().int().min(1).max(4), ko: z.string().min(1), correct: z.boolean(), explanation: translation.nullable() }))
    .length(4, "Aynan 4 ta variant")
    .refine((o) => o.filter((x) => x.correct).length === 1, "Aynan 1 ta to‘g‘ri javob"),
  explanation: translation,
  review,
});

// -----------------------------------------------------------------------------
export const planTaskSchema = z.object({
  day: z.number().int().min(1),
  position: z.number().int().min(1),
  section: z.enum(["vocabulary", "grammar", "listening", "reading", "writing", "mock"]),
  title: uzText,
  title_ko: z.string().nullable().default(null),
  estimated_minutes: z.number().int().min(1).max(240).nullable(),
  href: z.string().startsWith("/").nullable().default(null),
  topic: z.string().regex(KEY.topic).nullable().default(null),
});

export const planTemplateSchema = z
  .object({
    key: z.string().regex(KEY.plan),
    source: z.string().regex(KEY.source),
    authored_by: authoredBy,
    title: uzText,
    total_days: z.number().int().min(1).max(120),
    target_level: level,
    tasks: z.array(planTaskSchema).min(1),
    review,
  })
  .superRefine((p, ctx) => {
    const seen = new Set<string>();
    for (const t of p.tasks) {
      if (t.day > p.total_days) ctx.addIssue({ code: "custom", message: `${t.day}-kun total_days (${p.total_days}) dan katta` });
      const k = `${t.day}-${t.position}`;
      if (seen.has(k)) ctx.addIssue({ code: "custom", message: `Takroriy topshiriq: ${k}` });
      seen.add(k);
    }
    for (let d = 1; d <= p.total_days; d += 1) {
      if (!p.tasks.some((t) => t.day === d)) ctx.addIssue({ code: "custom", message: `${d}-kunda topshiriq yo‘q` });
    }
  });

// -----------------------------------------------------------------------------
export const questionTypeSchema = z
  .object({
    code: z.string().regex(/^[LRW]-\d{2}(-\d{2})?$/),
    section: z.enum(["listening", "reading", "writing"]),
    number_from: z.number().int().min(1).max(54),
    number_to: z.number().int().min(1).max(54),
    name_ko: koText,
    name_uz: uzText,
    points_per_item: z.number().int().positive(),
  })
  .refine((t) => t.number_from <= t.number_to, "number_from <= number_to bo‘lishi kerak");

export const passageSchema = z.object({
  key: z.string().regex(KEY.passage),
  source: z.string().regex(KEY.source),
  authored_by: authoredBy,
  section: z.enum(["listening", "reading"]),
  kind: z.enum(["dialogue", "monologue", "lecture", "interview", "discussion", "news", "announcement", "text", "notice", "advertisement", "graph", "letter", "editorial"]),
  title: z.string().nullable().default(null),
  body_ko: koText,
  speakers: z.array(z.object({ role: z.string(), gender: z.enum(["female", "male"]).nullable() })).default([]),
  level: level.nullable().default(null),
  topic: z.string().regex(KEY.topic).nullable().default(null),
  translation: translation.nullable().default(null),
  review,
});

export const grammarFileSchema = z.object({ entries: z.array(grammarPointSchema) });

export const questionFileSchema = z
  .object({ passages: z.array(passageSchema).default([]), questions: z.array(questionSchema) })
  .superRefine((f, ctx) => {
    const keys = new Set(f.passages.map((p) => p.key));
    for (const q of f.questions) {
      if (q.passage && !keys.has(q.passage)) ctx.addIssue({ code: "custom", message: `${q.key}: matn topilmadi: ${q.passage}` });
      const p = f.passages.find((x) => x.key === q.passage);
      if (p && p.section !== q.section) ctx.addIssue({ code: "custom", message: `${q.key}: savol va matn bo‘limi mos emas` });
      if (q.section === "listening" && !q.passage) ctx.addIssue({ code: "custom", message: `${q.key}: tinglash savoliga transcript (passage) majburiy` });
    }
  });

export const rubricSchema = z
  .object({
    key: z.string().regex(KEY.rubric),
    source: z.string().regex(KEY.source),
    authored_by: authoredBy,
    task_no: z.number().int().min(51).max(54),
    name: z.string().min(1),
    max_points: z.number().int().positive(),
    criteria: z
      .array(
        z.object({
          code: z.string().regex(/^[a-z_]+$/),
          name_ko: koText,
          name_uz: uzText,
          max_points: z.number().int().positive(),
          bands: z.array(z.object({ points: z.string(), uz: uzText })).min(2),
        }),
      )
      .min(1),
    review,
  })
  .refine((r) => r.criteria.reduce((s, c) => s + c.max_points, 0) === r.max_points, "Mezonlar ballari yig‘indisi max_points ga teng bo‘lishi kerak");

export const writingTaskSchema = z
  .object({
    key: z.string().regex(KEY.writing),
    source: z.string().regex(KEY.source),
    authored_by: authoredBy,
    task_no: z.number().int().min(51).max(54),
    level: level.nullable().default(null),
    prompt_ko: koText,
    instruction_uz: uzText,
    material: z.record(z.string(), z.unknown()).default({}),
    min_chars: z.number().int().min(0).nullable().default(null),
    max_chars: z.number().int().min(0).nullable().default(null),
    points: z.number().int().positive(),
    rubric: z.string().regex(KEY.rubric).nullable().default(null),
    model_answer: z.object({ ko: koText, commentary_uz: uzText }).nullable().default(null),
    review,
  })
  .superRefine((t, ctx) => {
    if (t.min_chars !== null && t.max_chars !== null && t.min_chars > t.max_chars) ctx.addIssue({ code: "custom", message: "min_chars > max_chars" });
    if (t.model_answer && t.min_chars !== null && t.max_chars !== null) {
      const n = [...t.model_answer.ko].length;
      if (n < t.min_chars || n > t.max_chars) ctx.addIssue({ code: "custom", message: `Namunaviy javob ${n} belgi — talab ${t.min_chars}–${t.max_chars}` });
    }
  });

export const writingFileSchema = z.object({ rubrics: z.array(rubricSchema).default([]), tasks: z.array(writingTaskSchema) });

export type Source = z.infer<typeof sourceSchema>;
export type VocabEntry = z.infer<typeof vocabEntrySchema>;
export type VocabFile = z.infer<typeof vocabFileSchema>;
export type PlanTemplate = z.infer<typeof planTemplateSchema>;
export type Reviewer = z.infer<typeof reviewerSchema>;
export type Topic = z.infer<typeof topicSchema>;
export type GrammarFile = z.infer<typeof grammarFileSchema>;
export type QuestionFile = z.infer<typeof questionFileSchema>;
export type WritingFile = z.infer<typeof writingFileSchema>;
export type QuestionType = z.infer<typeof questionTypeSchema>;
