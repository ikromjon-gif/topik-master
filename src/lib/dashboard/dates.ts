/**
 * Sana yordamchilari. Barcha "kun" hisoblari foydalanuvchi vaqt zonasida
 * (standart: Asia/Seoul) `YYYY-MM-DD` satrlari bilan bajariladi —
 * soat mintaqasi tufayli kun siljib ketmasligi uchun.
 * Bu fayl tashqi importlarsiz: `node --test` bilan to‘g‘ridan-to‘g‘ri ishlaydi.
 */

export type IsoDate = string; // YYYY-MM-DD

/** Berilgan vaqtni vaqt zonasidagi kalendar sanasiga aylantiradi. */
export function toIsoDate(date: Date, timeZone: string): IsoDate {
  const parts = new Intl.DateTimeFormat("en-CA", {
    timeZone,
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).formatToParts(date);
  const get = (type: string) => parts.find((p) => p.type === type)?.value ?? "";
  return `${get("year")}-${get("month")}-${get("day")}`;
}

function toUtcMs(iso: IsoDate): number {
  const [y, m, d] = iso.split("-").map(Number);
  return Date.UTC(y, m - 1, d);
}

/** b − a (kunlarda). */
export function diffDays(a: IsoDate, b: IsoDate): number {
  return Math.round((toUtcMs(b) - toUtcMs(a)) / 86_400_000);
}

export function addDays(iso: IsoDate, days: number): IsoDate {
  const d = new Date(toUtcMs(iso) + days * 86_400_000);
  return d.toISOString().slice(0, 10);
}

/** Haftaning kuni, dushanba = 0 … yakshanba = 6. */
export function weekdayMondayFirst(iso: IsoDate): number {
  return (new Date(toUtcMs(iso)).getUTCDay() + 6) % 7;
}

export function daysInMonth(year: number, month1: number): number {
  return new Date(Date.UTC(year, month1, 0)).getUTCDate();
}

export const UZ_MONTHS = [
  "Yanvar", "Fevral", "Mart", "Aprel", "May", "Iyun",
  "Iyul", "Avgust", "Sentabr", "Oktabr", "Noyabr", "Dekabr",
] as const;

export const UZ_WEEKDAYS_SHORT = ["Du", "Se", "Ch", "Pa", "Ju", "Sh", "Ya"] as const;

export const UZ_WEEKDAYS = [
  "Dushanba", "Seshanba", "Chorshanba", "Payshanba", "Juma", "Shanba", "Yakshanba",
] as const;
