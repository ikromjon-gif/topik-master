import { test } from "node:test";
import assert from "node:assert/strict";
import { buildDashboardInput, type TemplateTaskRow } from "./mapping.ts";
import { computeDashboard } from "../dashboard/metrics.ts";

const task = (id: string, day: number, position: number): TemplateTaskRow => ({
  id, day, position, section: "vocabulary", title: id, title_ko: null, estimated_minutes: 15, href: null,
});

test("mapping: rejasiz foydalanuvchi — bo‘sh, maqsad profildan", () => {
  const input = buildDashboardInput({
    today: "2026-11-28", profileTargetLevel: 5, plan: null, tasks: [], completions: [], sessions: [], attempts: [],
  });
  const v = computeDashboard(input);
  assert.equal(v.plan, null);
  assert.equal(v.targetLevel, 5);
  assert.equal(v.overallProgressPct, null);
  assert.equal(v.totalMinutes, null);
});

test("mapping: reja, bajarilganlar va tartib", () => {
  const input = buildDashboardInput({
    today: "2026-11-28",
    profileTargetLevel: 4,
    plan: { id: "p1", start_date: "2026-11-27", target_level: 4, template: { id: "t1", total_days: 45 } },
    tasks: [task("b", 1, 2), task("a", 1, 1), task("c", 2, 1), task("z", 99, 1)],
    completions: [
      { template_task_id: "a", completed_on: "2026-11-27", user_plan_id: "p1" },
      { template_task_id: "b", completed_on: "2026-11-27", user_plan_id: "p1" },
      { template_task_id: "x", completed_on: "2026-11-20", user_plan_id: "old" },
    ],
    sessions: [],
    attempts: [{ id: "r", section: "reading", title: "R", score: "82.00", max_score: "100.00", taken_on: "2026-11-27" }],
  });
  assert.deepEqual(input.tasks.map((t) => t.id), ["a", "b", "c"]); // 99-kun chiqarib tashlandi, tartiblandi
  assert.deepEqual(input.extraActiveDates, ["2026-11-20"]);
  const v = computeDashboard(input);
  assert.equal(v.plan?.currentDay, 2);
  assert.equal(v.plan?.completedDays, 1);
  assert.equal(v.today_tasks.total, 1);
  assert.equal(v.streak, 1); // bugun faollik yo‘q, kecha bor → 1 (xavf ostida)
  assert.equal(v.streakAtRisk, true);
  assert.equal(v.studyDays, 2); // 27-noyabr + eski rejadagi 20-noyabr
  assert.equal(v.totalMinutes, null); // o‘lchangan vaqt yo‘q — taxmin qilinmaydi
  assert.equal(v.recentResults[0].score, 82);
});
