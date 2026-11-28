/**
 * Kontentni tekshirish:  npm run content:validate
 * Xato bo‘lsa 1 kod bilan chiqadi (CI uchun).
 */
import { loadContent } from "./load.ts";

const c = loadContent();
const entries = c.vocab.flatMap((v) => v.data.entries);
const byStatus = (list: { review: { status: string } }[]) =>
  list.reduce<Record<string, number>>((acc, x) => ((acc[x.review.status] = (acc[x.review.status] ?? 0) + 1), acc), {});

console.log("Kontent hisoboti");
console.log(`  manbalar: ${c.sources.length}, mavzular: ${c.topics.length}, tekshiruvchilar: ${c.reviewers.length}`);
console.log(`  lug‘at: ${entries.length} yozuv (${c.vocab.length} fayl) — ${JSON.stringify(byStatus(entries))}`);
console.log(`    tarjimasiz: ${entries.filter((e) => !e.meaning).length}, misollar: ${entries.reduce((n, e) => n + e.examples.length, 0)}, tekshiruv izohlari: ${entries.filter((e) => e.review.notes.length).length}`);
console.log(`  reja shablonlari: ${c.plans.length} — ${c.plans.map((p) => `${p.data.key} (${p.data.tasks.length} topshiriq, ${p.data.review.status})`).join(", ")}`);

const gEntries = c.grammar.flatMap((g) => g.data.entries);
const qs = c.questions.flatMap((f) => f.data.questions);
const tasks = c.writing.flatMap((w) => w.data.tasks);
console.log(`  savol turlari: ${c.questionTypes.length}`);
console.log(`  grammatika: ${gEntries.length} — ${JSON.stringify(byStatus(gEntries))}`);
console.log(`  savollar: ${qs.length} (o‘qish ${qs.filter((x) => x.section === "reading").length}, tinglash ${qs.filter((x) => x.section === "listening").length}) — ${JSON.stringify(byStatus(qs))}`);
console.log(`  yozish topshiriqlari: ${tasks.length}, rubrikalar: ${c.writing.reduce((n, w) => n + w.data.rubrics.length, 0)}`);
for (const w of c.warnings.slice(0, 10)) console.log(`  ogohlantirish: ${w}`);
if (c.warnings.length > 10) console.log(`  … yana ${c.warnings.length - 10} ta ogohlantirish`);

if (c.errors.length) {
  console.error(`\n${c.errors.length} ta xato:`);
  for (const e of c.errors.slice(0, 50)) console.error(`  ✗ ${e}`);
  process.exit(1);
}
console.log("\n✓ Kontent sxemaga mos.");
