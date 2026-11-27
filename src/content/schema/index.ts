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

export type Source = z.infer<typeof sourceSchema>;
export type VocabEntry = z.infer<typeof vocabEntrySchema>;
export type VocabFile = z.infer<typeof vocabFileSchema>;
export type PlanTemplate = z.infer<typeof planTemplateSchema>;
export type Reviewer = z.infer<typeof reviewerSchema>;
export type Topic = z.infer<typeof topicSchema>;
