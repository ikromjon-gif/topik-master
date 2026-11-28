import { test } from "node:test";
import assert from "node:assert/strict";
import { planTemplateSchema, questionSchema, sourceSchema, uzText, vocabEntrySchema } from "./index.ts";

const baseVocab = {
  key: "VOC-T-0001",
  source: "SRC-SABAQ-ORIGINAL",
  authored_by: "ai",
  term: "실시하다",
  meaning: { text: "amalga oshirmoq" },
};

test("sxema: verified statusi fayldan qabul qilinmaydi", () => {
  const r = vocabEntrySchema.safeParse({ ...baseVocab, review: { status: "verified", reviewed_by: "x" } });
  assert.equal(r.success, false);
});

test("sxema: reviewed uchun reviewed_by majburiy", () => {
  assert.equal(vocabEntrySchema.safeParse({ ...baseVocab, review: { status: "reviewed" } }).success, false);
  assert.equal(vocabEntrySchema.safeParse(baseVocab).success, true); // standart: draft
});

test("sxema: o‘zbek tipografiyasi (ASCII ' va U+02BB rad etiladi)", () => {
  assert.equal(uzText.safeParse("o‘qish va ma’lumot").success, true);
  assert.equal(uzText.safeParse("o'qish").success, false);
  assert.equal(uzText.safeParse("oʻqish").success, false);
});

test("sxema: lug‘at so‘zi Hangul bo‘lishi kerak", () => {
  assert.equal(vocabEntrySchema.safeParse({ ...baseVocab, term: "DNA" }).success, false);
});

test("sxema: savolda aynan 4 variant va 1 to‘g‘ri javob", () => {
  const opt = (label: number, correct: boolean) => ({ label, ko: `선택 ${label}`, correct, explanation: null });
  const q = {
    key: "QST-T-0001", source: "SRC-SABAQ-ORIGINAL", authored_by: "ai", section: "listening", type_code: "L-04-08",
    level: 4, passage: null, stem_ko: "다음을 듣고 고르십시오.", explanation: { text: "Izoh" },
  };
  assert.equal(questionSchema.safeParse({ ...q, options: [opt(1, true), opt(2, false), opt(3, false), opt(4, false)] }).success, true);
  assert.equal(questionSchema.safeParse({ ...q, options: [opt(1, true), opt(2, true), opt(3, false), opt(4, false)] }).success, false);
  assert.equal(questionSchema.safeParse({ ...q, options: [opt(1, true), opt(2, false), opt(3, false)] }).success, false);
});

test("sxema: reja shablonida har kunda topshiriq bo‘lishi kerak", () => {
  const p = {
    key: "PLN-T", source: "SRC-SABAQ-ORIGINAL", authored_by: "ai", title: "Test", total_days: 2, target_level: 4,
    tasks: [{ day: 1, position: 1, section: "vocabulary", title: "Lug‘at", estimated_minutes: 10 }],
  };
  assert.equal(planTemplateSchema.safeParse(p).success, false);
  assert.equal(planTemplateSchema.safeParse({ ...p, tasks: [...p.tasks, { ...p.tasks[0], day: 2 }] }).success, true);
});

test("sxema: havola manbasiga tijoriy huquq berilmaydi", () => {
  const s = { key: "SRC-X", kind: "official_reference", name: "X", commercial_use: true, redistribution_allowed: false, attribution_required: false, license_status: "granted" };
  assert.equal(sourceSchema.safeParse(s).success, false);
});
