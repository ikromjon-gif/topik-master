/** content/ papkasini o‘qish va sxema bo‘yicha tekshirish (validate va seed uchun umumiy). */
import { readdirSync, readFileSync, statSync } from "node:fs";
import { join, relative } from "node:path";
import {
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

  return { sources, reviewers, topics, vocab, plans, errors, warnings };
}
