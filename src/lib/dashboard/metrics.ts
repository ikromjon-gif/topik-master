/**
 * Dashboard metrikalari — sof funksiyalar (kirish → natija, tashqi holatsiz).
 *
 * Ta'riflar (docs/dashboard-metrics.md da ham):
 *  - Joriy kun: bugun − boshlanish sanasi + 1 (1..45). Boshlanmagan: null.
 *  - Bajarilgan kun: shu kunning barcha topshiriqlari bajarilgan.
 *  - 45 kunlik progress: bajarilgan kunlar / 45.
 *  - Umumiy progress: bajarilgan topshiriqlar / rejadagi barcha topshiriqlar.
 *  - Faol kun: kamida bitta topshiriq bajarilgan yoki o‘qish sessiyasi bo‘lgan kun.
 *  - Ketma-ketlik: bugundan (bugun faollik bo‘lmasa — kechadan) orqaga uzluksiz
 *    faol kunlar soni.
 */
import { addDays, diffDays, type IsoDate } from "./dates.ts";
import type { DashboardInput, DashboardView, PlanTaskInput } from "./types.ts";

export const DEFAULT_TARGET_LEVEL = 4 as const;

function pct(part: number, whole: number): number {
  if (whole <= 0) return 0;
  return Math.round((part / whole) * 100);
}

export function activeDates(
  input: Pick<DashboardInput, "tasks" | "sessions" | "extraActiveDates">,
): Set<IsoDate> {
  const set = new Set<IsoDate>(input.extraActiveDates ?? []);
  for (const t of input.tasks) if (t.completedOn) set.add(t.completedOn);
  for (const s of input.sessions) if (s.minutes > 0) set.add(s.date);
  return set;
}

export function computeStreak(active: Set<IsoDate>, today: IsoDate): { streak: number | null; atRisk: boolean } {
  if (active.size === 0) return { streak: null, atRisk: false };
  let cursor = active.has(today) ? today : addDays(today, -1);
  const atRisk = !active.has(today) && active.has(cursor);
  let streak = 0;
  while (active.has(cursor)) {
    streak += 1;
    cursor = addDays(cursor, -1);
  }
  return { streak, atRisk };
}

export function currentPlanDay(startDate: IsoDate, totalDays: number, today: IsoDate): number | null {
  const offset = diffDays(startDate, today);
  if (offset < 0) return null;
  return Math.min(offset + 1, totalDays);
}

function tasksByDay(tasks: PlanTaskInput[]): Map<number, PlanTaskInput[]> {
  const map = new Map<number, PlanTaskInput[]>();
  for (const t of tasks) {
    const list = map.get(t.day) ?? [];
    list.push(t);
    map.set(t.day, list);
  }
  return map;
}

export function computeDashboard(input: DashboardInput): DashboardView {
  const { today, plan, tasks, sessions, results } = input;
  const byDay = tasksByDay(tasks);
  const active = activeDates(input);
  const { streak, atRisk } = computeStreak(active, today);

  // Reja
  let planView: DashboardView["plan"] = null;
  const calendar: DashboardView["calendar"] = {};
  let todayDay: number | null = null;

  if (plan) {
    const day = currentPlanDay(plan.startDate, plan.totalDays, today);
    const offset = diffDays(plan.startDate, today);
    const finished = offset >= plan.totalDays;
    todayDay = day !== null && !finished ? day : null;

    let completedDays = 0;
    for (let d = 1; d <= plan.totalDays; d += 1) {
      const date = addDays(plan.startDate, d - 1);
      const list = byDay.get(d) ?? [];
      const done = list.filter((t) => t.completedOn).length;
      const complete = list.length > 0 && done === list.length;
      if (complete) completedDays += 1;

      const rel = diffDays(today, date); // >0 kelajak
      calendar[date] = complete
        ? "completed"
        : rel === 0
          ? "today"
          : rel > 0
            ? "upcoming"
            : done > 0
              ? "partial"
              : "missed";
    }

    planView = {
      started: day !== null,
      startDate: plan.startDate,
      totalDays: plan.totalDays,
      currentDay: day,
      completedDays,
      dayProgressPct: pct(completedDays, plan.totalDays),
      finished,
    };
  }

  const todayItems = todayDay !== null ? (byDay.get(todayDay) ?? []) : [];

  // Haftalik
  const minutesByDate = new Map<IsoDate, number>();
  for (const s of sessions) minutesByDate.set(s.date, (minutesByDate.get(s.date) ?? 0) + Math.max(0, s.minutes));
  const week = Array.from({ length: 7 }, (_, i) => {
    const date = addDays(today, i - 6);
    return { date, minutes: minutesByDate.get(date) ?? 0 };
  });
  const weekTotalMinutes = week.reduce((sum, d) => sum + d.minutes, 0);
  const totalMinutes = sessions.length ? sessions.reduce((sum, s) => sum + Math.max(0, s.minutes), 0) : null;

  return {
    today,
    plan: planView,
    targetLevel: plan?.targetLevel ?? input.targetLevel ?? DEFAULT_TARGET_LEVEL,
    overallProgressPct: tasks.length ? pct(tasks.filter((t) => t.completedOn).length, tasks.length) : null,
    today_tasks: {
      day: todayDay,
      items: todayItems,
      done: todayItems.filter((t) => t.completedOn).length,
      total: todayItems.length,
    },
    streak,
    streakAtRisk: atRisk,
    studyDays: active.size ? active.size : null,
    totalMinutes,
    week,
    weekTotalMinutes,
    hasWeekData: weekTotalMinutes > 0,
    calendar,
    recentResults: [...results].sort((a, b) => (a.date < b.date ? 1 : -1)).slice(0, 3),
  };
}

/** Daqiqani "1 soat 25 daqiqa" / "45 daqiqa" ko‘rinishiga keltiradi. */
export function formatMinutes(minutes: number): string {
  const h = Math.floor(minutes / 60);
  const m = minutes % 60;
  if (h === 0) return `${m} daqiqa`;
  if (m === 0) return `${h} soat`;
  return `${h} soat ${m} daqiqa`;
}
