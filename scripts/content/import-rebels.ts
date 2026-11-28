/**
 * Rebels TOPIK II lug‘ati (PDF) → content/vocab/rebels/lesson-NN.json
 *
 * Ishlatish:  node scripts/content/import-rebels.ts <rebels.pdf>
 * Talab:      poppler-utils (`pdftotext`)
 *
 * Natija: barcha yozuvlar `draft` holatida (tekshiruvdan o‘tmagan).
 * Tarjimalar muallif matnidan o‘zgartirilmasdan olinadi; faqat tipografiya
 * (‘ ’) normallashtiriladi. Shubhali tarjimalar `review.notes` ga yoziladi.
 */
import { execFileSync } from "node:child_process";
import { mkdirSync, writeFileSync } from "node:fs";
import { join } from "node:path";

type Entry = {
  key: string;
  source: "SRC-REBELS";
  authored_by: "human";
  term: string;
  kind: "word" | "expression";
  pos: null;
  sense_no: number;
  level: null;
  topic: string | null;
  category: { ko: string; uz: string | null } | null;
  meaning: { text: string; status: "draft" } | null;
  examples: { ko: string; uz: { text: string; status: "draft" } | null; authored_by: "human" }[];
  review: { status: "draft"; reviewed_by: null; notes: string[] };
};

const LESSON_TOPICS: Record<number, string> = {
  1: "TOP-POLITICS-WELFARE",
  2: "TOP-HISTORY-CULTURE",
  3: "TOP-SCIENCE-TECH",
  4: "TOP-ECONOMY",
  5: "TOP-ENVIRONMENT",
  6: "TOP-PSYCHOLOGY",
  7: "TOP-EDUCATION",
  8: "TOP-HEALTH",
};

/** Import paytida aniqlangan, mutaxassis ko‘rib chiqishi kerak bo‘lgan tarjimalar. */
const SUSPECT: Record<string, string> = {
  떠넘기다: "Tekshirish: ma’nosi ‘mas’uliyatni boshqaga ag‘darmoq/yuklamoq’; ‘ayblamoq’ noaniq.",
  취약: "Tekshirish: ‘zaif, himoyasiz’ — salbiy ma’no, lekin ‘Ijobiy holatlar’ bo‘limida turibdi.",
  "견제(하다)": "Tekshirish: ‘tiyib turmoq, muvozanatlamoq’; ‘nazorat qilmoq’ noaniq.",
};

const HANGUL = /[가-힣ㄱ-ㆎ]/;
const LATIN = /[A-Za-z]/;

function normUz(s: string): string {
  return s
    .replace(/\*\*/g, "")
    .replace(/(?<=[oOgG])['ʻ’`]/g, "‘") // o‘ g‘ (so‘z ichida ham, oxirida ham)
    .replace(/(?<=[A-Za-z])['ʻ`](?=[a-z])/g, "’") // tutuq: ma’lumot
    .replace(/\s+/g, " ")
    .trim();
}

function stripParens(s: string): string {
  const t = s.trim();
  return t.startsWith("(") && t.endsWith(")") ? t.slice(1, -1).trim() : t;
}

function splitPair(text: string): [string, string] | null {
  // "한국어 (o‘zbekcha)"
  const p = text.match(/^(.*[\uAC00-\uD7A3\u3131-\u318E][^()]*(?:\([^()]*\))?)\s+\(([^()]*[A-Za-z][^()]*)\)\s*$/);
  if (p && !/[\uAC00-\uD7A3]/.test(p[2])) return [p[1].trim(), p[2].trim()];
  // "한국어: o‘zbekcha" | "한국어 – o‘zbekcha" | "한국어 - o‘zbekcha"
  const m = text.match(/^(.*?[가-힣ㄱ-ㆎ)\]])\s*(?::|\s[–—-]\s)\s*(.+)$/);
  if (!m) return null;
  const [, left, right] = m;
  if (!HANGUL.test(left) || !LATIN.test(right)) return null;
  return [left.trim(), right.trim()];
}

function main() {
  const pdf = process.argv[2];
  if (!pdf) throw new Error("PDF yo‘li berilmagan: node scripts/content/import-rebels.ts <file.pdf>");
  const raw = execFileSync("pdftotext", [pdf, "-"], { encoding: "utf8", maxBuffer: 50 * 1024 * 1024 });
  const lines = raw.split(/\r?\n/).map((l) => l.replace(/\f/g, "").trim()).filter(Boolean);

  type Lesson = { no: number; title_ko: string; title_uz: string | null; entries: Entry[] };
  const lessons = new Map<number, Lesson>();
  const seenTerms = new Map<string, string>(); // term -> key (butun lug‘at bo‘yicha)
  const unparsed: string[] = [];
  let lesson: Lesson | null = null;
  let category: Entry["category"] = null;
  let currentExpr: Entry | null = null;
  let counter = 0;
  type UzRef = { text: string; status: "draft" };
  // closure ichida o‘zgaradi — TS toraytirishi (narrowing) uni "never" deb hisoblamasligi uchun funksiya orqali o‘qiladi
  let lastUz = null as UzRef | null;
  const getLastUz = (): UzRef | null => lastUz;

  const isBullet = (l: string) => l.startsWith("•");
  const bulletText = (l: string) => l.replace(/^•\s*/, "");

  for (let i = 0; i < lines.length; i += 1) {
    const line = lines[i];

    const lh = line.match(/^(\d+)\s*차시\s*-?\s*(.+)$/);
    if (lh) {
      const no = Number(lh[1]);
      if (!lessons.has(no)) lessons.set(no, { no, title_ko: lh[2].trim(), title_uz: null, entries: [] });
      lesson = lessons.get(no)!;
      category = null;
      currentExpr = null;
      continue;
    }
    const lu = line.match(/^(\d+)-dars\s*:?\s*(.+)$/i);
    if (lu && lesson && Number(lu[1]) === lesson.no) {
      lesson.title_uz ??= normUz(lu[2]);
      continue;
    }
    if (!lesson || /^\d+-Hafta$/i.test(line) || line === "Rebels" || /^어휘\s/.test(line) || /^유용한\s*표현/.test(line)) continue;

    const num = line.match(/^\d+\.\s*(.+)$/);
    if (num) {
      const body = num[1];
      // keyingi bullet qatoriga qarab: so‘zlar ro‘yxati (kategoriya) yoki misol gaplar (ibora)
      const next = lines.slice(i + 1).find((l) => isBullet(l) || /^\d+\.\s/.test(l) || /차시/.test(l));
      const nextIsSentence = next !== undefined && isBullet(next) && !splitPair(bulletText(next));
      const pair = splitPair(body);
      if (nextIsSentence || (pair && !(next && isBullet(next)))) {
        const term = pair ? pair[0] : body.replace(/\s*\(.*?[A-Za-z].*?\)\s*$/, "").trim();
        if (!HANGUL.test(term)) {
          unparsed.push(line);
          continue;
        }
        currentExpr = addEntry(term, pair ? pair[1] : null, "expression");
      } else {
        // Kategoriya: "제도 / 정책 관련 (Tizim/Siyosat bilan bog‘liq)" yoki "힘 관련 Kuchga oid"
        const paren = body.match(/^(.*?)\s*\((.+)\)\s*$/);
        const trail = body.match(/^([^A-Za-z]+?)\s+([A-Za-z‘’'].+)$/);
        const cleanKo = (s: string) => s.replace(/[\s–—-]+$/, "").trim();
        category = paren
          ? { ko: cleanKo(paren[1]), uz: normUz(paren[2]) }
          : trail
            ? { ko: cleanKo(trail[1]), uz: normUz(trail[2]) }
            : { ko: cleanKo(body), uz: null };
        currentExpr = null;
      }
      continue;
    }

    const latinOnly = !HANGUL.test(line) && LATIN.test(line);

    if (isBullet(line)) {
      const text = bulletText(line);
      const pair = splitPair(text);
      if (pair) {
        addEntry(pair[0], pair[1], "word");
        lastUz = null;
      } else if (currentExpr && HANGUL.test(text)) {
        if (!currentExpr.examples.some((e) => e.ko === text)) currentExpr.examples.push({ ko: text, uz: null, authored_by: "human" });
        lastUz = null;
      } else if (currentExpr && !HANGUL.test(text) && LATIN.test(text)) {
        attachUz(currentExpr, text);
      } else {
        unparsed.push(line);
      }
      continue;
    }

    if (latinOnly && /^유용한|foydali ifodalar/i.test(line)) continue;
    if (latinOnly && currentExpr) {
      attachUz(currentExpr, line);
      continue;
    }
    if (latinOnly && category && category.uz === null && !currentExpr) {
      category.uz = normUz(line);
      continue;
    }
    // davomi: oldingi o‘zbekcha qatorning ikkinchi qismi
    const prevUz = getLastUz();
    if (latinOnly && prevUz && /^[a-z(…~]/.test(line)) {
      prevUz.text = normUz(`${prevUz.text} ${line}`);
      continue;
    }
    unparsed.push(line);
  }

  /** Ibora yoki uning oxirgi misoli uchun o‘zbekcha tarjima. */
  function attachUz(expr: Entry, rawText: string) {
    const text = normUz(stripParens(rawText));
    const lastEx = expr.examples[expr.examples.length - 1];
    if (expr.examples.length === 0 && !expr.meaning) {
      expr.meaning = { text, status: "draft" };
      expr.review.notes = expr.review.notes.filter((n) => !n.startsWith("Tarjima yo‘q"));
      lastUz = expr.meaning;
    } else if (lastEx && !lastEx.uz) {
      lastEx.uz = { text, status: "draft" };
      lastUz = lastEx.uz;
    } else if (lastUz && /^[a-z(…~]/.test(rawText.trim())) {
      lastUz.text = normUz(`${lastUz.text} ${rawText}`);
    } else {
      unparsed.push(rawText);
    }
  }

  function addEntry(term: string, meaning: string | null, kind: Entry["kind"]): Entry {
    const l = lesson!;
    const existingKey = seenTerms.get(term);
    if (existingKey) {
      const existing = [...lessons.values()].flatMap((x) => x.entries).find((e) => e.key === existingKey)!;
      return existing; // takror (sahifa qaytarilgan yoki boshqa darsda) — birinchisi saqlanadi
    }
    counter += 1;
    const entry: Entry = {
      key: `VOC-RB-${String(counter).padStart(4, "0")}`,
      source: "SRC-REBELS",
      authored_by: "human",
      term,
      kind,
      pos: null,
      sense_no: 1,
      level: null,
      topic: LESSON_TOPICS[l.no] ?? null,
      category,
      meaning: meaning ? { text: normUz(meaning), status: "draft" } : null,
      examples: [],
      review: { status: "draft", reviewed_by: null, notes: SUSPECT[term] ? [SUSPECT[term]] : [] },
    };
    if (!meaning) entry.review.notes.push("Tarjima yo‘q — o‘zbekcha tarjima qo‘shilishi kerak.");
    l.entries.push(entry);
    seenTerms.set(term, entry.key);
    return entry;
  }

  const outDir = join(process.cwd(), "content", "vocab", "rebels");
  mkdirSync(outDir, { recursive: true });
  let total = 0;
  for (const l of [...lessons.values()].sort((a, b) => a.no - b.no)) {
    const file = join(outDir, `lesson-${String(l.no).padStart(2, "0")}.json`);
    writeFileSync(
      file,
      JSON.stringify({ source: "SRC-REBELS", lesson: { no: l.no, title_ko: l.title_ko, title_uz: l.title_uz }, entries: l.entries }, null, 2) + "\n",
    );
    total += l.entries.length;
    console.log(`${l.no}-dars (${l.title_ko}): ${l.entries.length} ta yozuv`);
  }
  writeFileSync(join(outDir, "_unparsed.txt"), unparsed.join("\n") + "\n");
  console.log(`Jami: ${total} ta yozuv; ajratib bo‘lmagan qatorlar: ${unparsed.length} (_unparsed.txt)`);
}

main();
