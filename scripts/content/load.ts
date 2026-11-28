/** content/ papkasini o‘qish va sxema bo‘yicha tekshirish (validate va seed uchun umumiy). */
import { readdirSync, readFileSync, statSync } from "node:fs";
import { join, relative } from "node:path";
import {
  grammarFileSchema,
  questionFileSchema,
  questionTypeSchema,
  writingFileSchema,
  type GrammarFile,
  type QuestionFile,
  type QuestionType,
  type WritingFile,
  planTemplateSchema,
  reviewerSchema,
  sourceSchema,
  topicSchema,
  vocabFileSchema,
  type PlanTemplate,
  type Reviewer,
  type Source,
  type Topic,
  type VocabFile,
} from "../../src/content/schema/index.ts";

export const ROOT = process.cwd();
const CONTENT = join(ROOT, "content");

export type Loaded = {
  sources: Source[];
  reviewers: Reviewer[];
  topics: Topic[];
  vocab: { file: string; data: VocabFile }[];
  plans: { file: string; data: PlanTemplate }[];
  questionTypes: QuestionType[];
  grammar: { file: string; data: GrammarFile }[];
  questions: { file: string; data: QuestionFile }[];
  writing: { file: string; data: WritingFile }[];
  errors: string[];
  warnings: string[];
};

function jsonFiles(dir: string): string[] {
  let out: string[] = [];
  let names: string[] = [];
  try {
    names = readdirSync(dir);
  } catch {
    return out;
  }
  for (const n of names) {
    const p = join(dir, n);
    if (statSync(p).isDirectory()) out = out.concat(jsonFiles(p));
    else if (n.endsWith(".json") && !n.startsWith("_")) out.push(p);
  }
  return out.sort();
}

function readJson(path: string): unknown {
  return JSON.parse(readFileSync(path, "utf8"));
}

export function loadContent(): Loaded {
  const errors: string[] = [];
  const warnings: string[] = [];
  const rel = (p: string) => relative(ROOT, p);

  function parse<T>(schema: { safeParse: (v: unknown) => { success: true; data: T } | { success: false; error: { issues: { path: PropertyKey[]; message: string }[] } } }, path: string, value: unknown): T | null {
    const r = schema.safeParse(value);
    if (r.success) return r.data;
    for (const issue of r.error.issues.slice(0, 20)) {
      errors.push(`${rel(path)}: ${issue.path.join(".") || "(root)"} — ${issue.message}`);
    }
    return null;
  }

  const srcPath = join(CONTENT, "sources", "sources.json");
  const sources = ((readJson(srcPath) as unknown[]) ?? []).map((s) => parse(sourceSchema, srcPath, s)).filter(Boolean) as Source[];
  const revPath = join(CONTENT, "meta", "reviewers.json");
  const reviewers = ((readJson(revPath) as unknown[]) ?? []).map((s) => parse(reviewerSchema, revPath, s)).filter(Boolean) as Reviewer[];
  const topPath = join(CONTENT, "meta", "topics.json");
  const topics = ((readJson(topPath) as unknown[]) ?? []).map((s) => parse(topicSchema, topPath, s)).filter(Boolean) as Topic[];

  const vocab = jsonFiles(join(CONTENT, "vocab"))
    .map((file) => ({ file: rel(file), data: parse(vocabFileSchema, file, readJson(file)) }))
    .filter((x): x is { file: string; data: VocabFile } => x.data !== null);
  const plans = jsonFiles(join(CONTENT, "plan"))
    .map((file) => ({ file: rel(file), data: parse(planTemplateSchema, file, readJson(file)) }))
    .filter((x): x is { file: string; data: PlanTemplate } => x.data !== null);

  const qtPath = join(CONTENT, "meta", "question-types.json");
  let questionTypes: QuestionType[] = [];
  try {
    questionTypes = ((readJson(qtPath) as unknown[]) ?? []).map((s) => parse(questionTypeSchema, qtPath, s)).filter(Boolean) as QuestionType[];
  } catch {
    questionTypes = [];
  }
  const loadDir = <T,>(dir: string, schema: Parameters<typeof parse<T>>[0]) =>
    jsonFiles(join(CONTENT, dir))
      .map((file) => ({ file: rel(file), data: parse<T>(schema, file, readJson(file)) }))
      .filter((x): x is { file: string; data: T } => x.data !== null);
  const grammar = loadDir<GrammarFile>("grammar", grammarFileSchema as never);
  const questions = [...loadDir<QuestionFile>("reading", questionFileSchema as never), ...loadDir<QuestionFile>("listening", questionFileSchema as never)];
  const writing = loadDir<WritingFile>("writing", writingFileSchema as never);

  // --- O‘zaro bog‘lanishlar
  const sourceByKey = new Map(sources.map((s) => [s.key, s]));
  const topicKeys = new Set(topics.map((t) => t.key));
  const reviewerById = new Map(reviewers.map((r) => [r.id, r]));
  const keys = new Map<string, string>();
  const claim = (key: string, where: string) => {
    if (keys.has(key)) errors.push(`${where}: takroriy key ${key} (${keys.get(key)} da ham bor)`);
    else keys.set(key, where);
  };
  const checkSource = (key: string, where: string) => {
    const s = sourceByKey.get(key);
    if (!s) return errors.push(`${where}: manba topilmadi: ${key}`);
    if (s.kind === "official_reference" || s.kind === "third_party_link") {
      errors.push(`${where}: ${key} faqat havola manbasi — undan kontent ko‘chirilmaydi`);
    } else if (s.license_status !== "granted") {
      warnings.push(`${where}: manba ${key} litsenziyasi "${s.license_status}" — kontent o‘quvchilarga ko‘rinmaydi`);
    }
  };
  const checkReview = (r: { status: string; reviewed_by: string | null }, where: string) => {
    if (r.status === "reviewed") {
      const rv = r.reviewed_by ? reviewerById.get(r.reviewed_by) : undefined;
      if (!rv) errors.push(`${where}: reviewed_by meta/reviewers.json da yo‘q`);
    }
  };

  const terms = new Map<string, string>();
  for (const { file, data } of vocab) {
    for (const e of data.entries) {
      const where = `${file} ${e.key}`;
      claim(e.key, file);
      checkSource(e.source, where);
      checkReview(e.review, where);
      if (e.topic && !topicKeys.has(e.topic)) errors.push(`${where}: mavzu topilmadi: ${e.topic}`);
      const tkey = `${e.term}|${e.pos}|${e.sense_no}`;
      if (terms.has(tkey)) errors.push(`${where}: "${e.term}" takroriy (${terms.get(tkey)})`);
      else terms.set(tkey, e.key);
    }
  }
  for (const { file, data } of plans) {
    claim(data.key, file);
    checkSource(data.source, file);
    checkReview(data.review, file);
    for (const t of data.tasks) if (t.topic && !topicKeys.has(t.topic)) errors.push(`${file}: ${t.day}-kun: mavzu topilmadi: ${t.topic}`);
  }

  const typeByCode = new Map(questionTypes.map((t) => [t.code, t]));
  const patterns = new Map<string, string>();
  for (const { file, data } of grammar) {
    for (const g of data.entries) {
      claim(g.key, file);
      checkSource(g.source, `${file} ${g.key}`);
      checkReview(g.review, `${file} ${g.key}`);
      if (patterns.has(g.pattern)) errors.push(`${file} ${g.key}: "${g.pattern}" takroriy (${patterns.get(g.pattern)})`);
      else patterns.set(g.pattern, g.key);
    }
  }
  for (const { file, data } of questions) {
    for (const p of data.passages) {
      claim(p.key, file);
      checkSource(p.source, `${file} ${p.key}`);
      if (p.topic && !topicKeys.has(p.topic)) errors.push(`${file} ${p.key}: mavzu topilmadi: ${p.topic}`);
    }
    for (const q of data.questions) {
      const where = `${file} ${q.key}`;
      claim(q.key, file);
      checkSource(q.source, where);
      checkReview(q.review, where);
      const t = typeByCode.get(q.type_code);
      if (!t) errors.push(`${where}: savol turi topilmadi: ${q.type_code} (meta/question-types.json)`);
      else {
        if (t.section !== q.section) errors.push(`${where}: savol turi bo‘limi mos emas`);
        if (q.number_slot !== null && (q.number_slot < t.number_from || q.number_slot > t.number_to)) {
          errors.push(`${where}: ${q.number_slot}-raqam ${t.code} oralig‘ida emas (${t.number_from}–${t.number_to})`);
        }
      }
    }
  }
  for (const { file, data } of writing) {
    const rubricKeys = new Set(data.rubrics.map((r) => r.key));
    for (const r of data.rubrics) {
      claim(r.key, file);
      checkSource(r.source, `${file} ${r.key}`);
    }
    for (const t of data.tasks) {
      const where = `${file} ${t.key}`;
      claim(t.key, file);
      checkSource(t.source, where);
      checkReview(t.review, where);
      if (t.rubric && !rubricKeys.has(t.rubric)) errors.push(`${where}: rubrika topilmadi: ${t.rubric}`);
      const r = data.rubrics.find((x) => x.key === t.rubric);
      // 51 va 52 bitta rubrika guruhida baholanadi (RUB-W51-52)
      const group = (n: number) => (n === 52 ? 51 : n);
      if (r && group(r.task_no) !== group(t.task_no)) errors.push(`${where}: rubrika boshqa topshiriq uchun (${r.task_no})`);
      if (r && r.max_points !== t.points) errors.push(`${where}: ball (${t.points}) rubrika maksimumiga (${r.max_points}) teng emas`);
    }
  }

  return { sources, reviewers, topics, vocab, plans, questionTypes, grammar, questions, writing, errors, warnings };
}
