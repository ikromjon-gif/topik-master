import { test } from "node:test";
import assert from "node:assert/strict";
import { addDays, diffDays, toIsoDate, weekdayMondayFirst } from "./dates.ts";
import { computeDashboard, computeStreak, currentPlanDay, formatMinutes } from "./metrics.ts";
import type { DashboardInput, PlanTaskInput } from "./types.ts";

const empty: DashboardInput = { today: "2026-11-28", plan: null, tasks: [], sessions: [], results: [] };

test("sana: Asia/Seoul vaqt zonasida kun to‘g‘ri hisoblanadi", () => {
  // 2026-11-27 15:30 UTC = 2026-11-28 00:30 KST
  assert.equal(toIsoDate(new Date("2026-11-27T15:30:00Z"), "Asia/Seoul"), "2026-11-28");
  assert.equal(toIsoDate(new Date("2026-11-27T14:59:00Z"), "Asia/Seoul"), "2026-11-27");
  assert.equal(diffDays("2026-11-01", "2026-12-01"), 30);
  assert.equal(addDays("2026-12-31", 1), "2027-01-01");
  assert.equal(weekdayMondayFirst("2026-11-30"), 0); // dushanba
  assert.equal(weekdayMondayFirst("2026-11-29"), 6); // yakshanba
});

test("ma'lumot yo‘q: hech qanday raqam o‘ylab topilmaydi", () => {
  const v = computeDashboard(empty);
  assert.equal(v.plan, null);
  assert.equal(v.overallProgressPct, null);
  assert.equal(v.streak, null);
  assert.equal(v.studyDays, null);
  assert.equal(v.totalMinutes, null);
  assert.equal(v.hasWeekData, false);
  assert.equal(v.today_tasks.total, 0);
  assert.equal(v.recentResults.length, 0);
  assert.equal(v.targetLevel, 4);
  assert.equal(v.week.length, 7);
  assert.equal(v.week[6].date, "2026-11-28");
});

test("joriy kun: boshlanmagan, davomida va tugagan reja", () => {
  assert.equal(currentPlanDay("2026-12-01", 45, "2026-11-28"), null);
  assert.equal(currentPlanDay("2026-11-28", 45, "2026-11-28"), 1);
  assert.equal(currentPlanDay("2026-11-17", 45, "2026-11-28"), 12);
  assert.equal(currentPlanDay("2026-01-01", 45, "2026-11-28"), 45);
});

test("ketma-ketlik: bugun, kecha va uzilish", () => {
  const set = (...d: string[]) => new Set(d);
  assert.deepEqual(computeStreak(set(), "2026-11-28"), { streak: null, atRisk: false });
  assert.deepEqual(computeStreak(set("2026-11-26", "2026-11-27", "2026-11-28"), "2026-11-28"), { streak: 3, atRisk: false });
  // bugun hali o‘qilmagan: kechagacha hisoblanadi, "xavf ostida"
  assert.deepEqual(computeStreak(set("2026-11-26", "2026-11-27"), "2026-11-28"), { streak: 2, atRisk: true });
  // ikki kun oldin uzilgan
  assert.deepEqual(computeStreak(set("2026-11-25"), "2026-11-28"), { streak: 0, atRisk: false });
});

test("reja progressi: kunlar va topshiriqlar alohida hisoblanadi", () => {
  const t = (id: string, day: number, completedOn: string | null): PlanTaskInput => ({
    id, day, section: "vocabulary", title: id, estimatedMinutes: 15, completedOn,
  });
  const v = computeDashboard({
    today: "2026-11-28",
    plan: { startDate: "2026-11-26", totalDays: 45, targetLevel: 4 },
    tasks: [
      t("a", 1, "2026-11-26"), t("b", 1, "2026-11-26"), // 1-kun to‘liq
      t("c", 2, "2026-11-27"), t("d", 2, null),         // 2-kun qisman
      t("e", 3, "2026-11-28"), t("f", 3, null),         // 3-kun = bugun
      t("g", 4, null),
    ],
    sessions: [{ date: "2026-11-28", minutes: 30 }, { date: "2026-11-20", minutes: 50 }],
    results: [],
  });
  assert.equal(v.plan?.currentDay, 3);
  assert.equal(v.plan?.completedDays, 1);
  assert.equal(v.plan?.dayProgressPct, 2); // 1/45
  assert.equal(v.overallProgressPct, 57); // 4/7
  assert.equal(v.today_tasks.day, 3);
  assert.equal(v.today_tasks.done, 1);
  assert.equal(v.today_tasks.total, 2);
  assert.equal(v.calendar["2026-11-26"], "completed");
  assert.equal(v.calendar["2026-11-27"], "partial");
  assert.equal(v.calendar["2026-11-28"], "today");
  assert.equal(v.calendar["2026-11-29"], "upcoming");
  assert.equal(v.streak, 3);
  assert.equal(v.studyDays, 4); // 26, 27, 28 + 20-noyabr sessiyasi
  assert.equal(v.totalMinutes, 80);
  assert.equal(v.weekTotalMinutes, 30); // 20-noyabr 7 kunlik oynadan tashqarida
});

test("so‘nggi natijalar: yangidan eskiga, ko‘pi bilan 3 ta", () => {
  const r = (id: string, date: string) => ({ id, section: "reading" as const, title: id, score: 80, maxScore: 100, date });
  const v = computeDashboard({ ...empty, results: [r("a", "2026-11-01"), r("b", "2026-11-20"), r("c", "2026-11-10"), r("d", "2026-11-25")] });
  assert.deepEqual(v.recentResults.map((x) => x.id), ["d", "b", "c"]);
});

test("formatMinutes", () => {
  assert.equal(formatMinutes(45), "45 daqiqa");
  assert.equal(formatMinutes(60), "1 soat");
  assert.equal(formatMinutes(85), "1 soat 25 daqiqa");
});
