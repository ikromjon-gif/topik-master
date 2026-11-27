import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";

/**
 * content/ fayllaridagi tekshiruvni kutayotgan (draft) yozuvlar soni.
 * Bu haqiqiy son (fayllardan sanaladi) — o‘quvchiga "kontent tayyorlanmoqda"
 * holatini aniq ko‘rsatish uchun. Kontentning o‘zi bu yerdan ko‘rsatilmaydi.
 */
export function pendingVocabCount(): number {
  try {
    const dir = join(process.cwd(), "content", "vocab", "rebels");
    return readdirSync(dir)
      .filter((f) => f.endsWith(".json") && !f.startsWith("_"))
      .reduce((sum, f) => {
        const data = JSON.parse(readFileSync(join(dir, f), "utf8")) as { entries: { review?: { status?: string } }[] };
        return sum + data.entries.filter((e) => (e.review?.status ?? "draft") === "draft").length;
      }, 0);
  } catch {
    return 0;
  }
}
