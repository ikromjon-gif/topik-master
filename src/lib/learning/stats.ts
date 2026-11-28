/**
 * Statistika sahifasi uchun sof funksiyalar (unit testlar bilan).
 */
import { addDays, type IsoDate } from "../dashboard/dates.ts";
import type { AttemptRow } from "./mapping.ts";

export type SectionAccuracy = { section: string; attempts: number; scorePct: number };

/** Bo‘limlar bo‘yicha o‘rtacha natija (ball / maksimal ball). */
export function sectionAccuracy(attempts: AttemptRow[]): SectionAccuracy[] {
  const by = new Map<string, { n: number; score: number; max: number }>();
  for (const a of attempts) {
    const cur = by.get(a.section) ?? { n: 0, score: 0, max: 0 };
    cur.n += 1;
    cur.score += Number(a.score);
    cur.max += Number(a.max_score);
    by.set(a.section, cur);
  }
  return [...by.entries()]
    .map(([section, v]) => ({ section, attempts: v.n, scorePct: v.max > 0 ? Math.round((v.score / v.max) * 100) : 0 }))
    .sort((a, b) => a.section.localeCompare(b.section));
}

/** Oxirgi N kun uchun faol kunlar xaritasi (eskidan yangiga). */
export function activityGrid(active: Set<IsoDate>, today: IsoDate, days = 35): { date: IsoDate; active: boolean }[] {
  return Array.from({ length: days }, (_, i) => {
    const date = addDays(today, i - (days - 1));
    return { date, active: active.has(date) };
  });
}

/**
 * TOPIK II ball oralig‘idan daraja (taxminiy emas — faqat berilgan ball uchun).
 * 300 ballik to‘liq sinov natijasi bo‘lmasa ishlatilmaydi.
 */
export function levelForScore(score: number, thresholds: Record<number, number>): number | null {
  const levels = Object.entries(thresholds)
    .map(([l, min]) => [Number(l), min] as const)
    .sort((a, b) => b[1] - a[1]);
  for (const [l, min] of levels) if (score >= min) return l;
  return null;
}
