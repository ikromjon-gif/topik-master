/**
 * Supabase qatorlarini Dashboard kirishiga aylantirish (sof funksiya,
 * unit testlar bilan). Tashqi importlarsiz — `node --test` uchun.
 */
import { addDays, type IsoDate } from "../dashboard/dates.ts";
import type { DashboardInput, PlanTaskInput, SectionKey } from "../dashboard/types.ts";

export type PlanRow = {
  id: string;
  start_date: IsoDate;
  target_level: number;
  template: { id: string; total_days: number } | null;
};
export type TemplateTaskRow = {
  id: string;
  day: number;
  position: number;
  section: SectionKey;
  title: string;
  title_ko: string | null;
  estimated_minutes: number | null;
  href: string | null;
};
export type CompletionRow = { template_task_id: string; completed_on: IsoDate; user_plan_id: string };
export type SessionRow = { studied_on: IsoDate; minutes: number };
export type AttemptRow = {
  id: string;
  section: SectionKey;
  title: string;
  score: number | string;
  max_score: number | string;
  taken_on: IsoDate;
};

export function buildDashboardInput(args: {
  today: IsoDate;
  profileTargetLevel: number | null;
  plan: PlanRow | null;
  tasks: TemplateTaskRow[];
  completions: CompletionRow[];
  sessions: SessionRow[];
  attempts: AttemptRow[];
}): DashboardInput {
  const { today, plan } = args;
  const level = clampLevel(plan?.target_level ?? args.profileTargetLevel ?? 4);
  const planCompletions = plan ? args.completions.filter((c) => c.user_plan_id === plan.id) : [];
  const doneOn = new Map(planCompletions.map((c) => [c.template_task_id, c.completed_on]));

  const tasks: PlanTaskInput[] =
    plan && plan.template
      ? [...args.tasks]
          .filter((t) => t.day >= 1 && t.day <= plan.template!.total_days)
          .sort((a, b) => a.day - b.day || a.position - b.position)
          .map((t) => ({
            id: t.id,
            day: t.day,
            section: t.section,
            title: t.title,
            titleKo: t.title_ko ?? undefined,
            estimatedMinutes: t.estimated_minutes,
            href: t.href ?? undefined,
            completedOn: doneOn.get(t.id) ?? null,
          }))
      : [];

  // Faollik (streak) uchun boshqa (eski) rejalardagi bajarilganlar ham hisobga olinadi.
  const extraActiveDates = args.completions
    .filter((c) => !plan || c.user_plan_id !== plan.id)
    .map((c) => c.completed_on);

  return {
    today,
    targetLevel: level,
    plan:
      plan && plan.template
        ? { startDate: plan.start_date, totalDays: plan.template.total_days, targetLevel: level }
        : null,
    tasks,
    sessions: args.sessions.map((s) => ({ date: s.studied_on, minutes: s.minutes })),
    extraActiveDates,
    results: args.attempts.map((a) => ({
      id: a.id,
      section: a.section,
      title: a.title,
      score: Number(a.score),
      maxScore: Number(a.max_score),
      date: a.taken_on,
    })),
  };
}

function clampLevel(n: number): 3 | 4 | 5 | 6 {
  return (Math.min(6, Math.max(3, Math.round(n))) as 3 | 4 | 5 | 6);
}

/** Streak uchun qancha orqaga sessiya/bajarilganlarni o‘qish kerak. */
export function activityWindowStart(today: IsoDate): IsoDate {
  return addDays(today, -400);
}
