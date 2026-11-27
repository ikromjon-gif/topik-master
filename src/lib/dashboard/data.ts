import { buildDashboardInput } from "@/lib/learning/mapping.ts";
import { getActivePlan, getActivity, getLearningContext, getTemplateTasks } from "@/lib/learning/queries";
import { computeDashboard } from "./metrics.ts";
import type { DashboardView } from "./types.ts";

export type DashboardData = {
  view: DashboardView;
  state: "not-configured" | "signed-out" | "signed-in";
  /** Topshiriqlarni belgilash mumkinmi (login + faol reja). */
  interactive: boolean;
};

/**
 * Dashboard ma'lumotlari. Supabase sozlanmagan yoki foydalanuvchi kirmagan
 * bo‘lsa — bo‘sh kirish (UI bo‘sh holatlarni ko‘rsatadi). Hech qachon namuna
 * yoki soxta raqam qaytarilmaydi.
 */
export async function getDashboardData(now: Date = new Date()): Promise<DashboardData> {
  const ctx = await getLearningContext(now);
  if (ctx.state !== "signed-in") {
    return {
      state: ctx.state,
      interactive: false,
      view: computeDashboard({ today: ctx.today, plan: null, tasks: [], sessions: [], results: [] }),
    };
  }

  const plan = await getActivePlan(ctx.supabase, ctx.userId);
  const [tasks, activity] = await Promise.all([
    plan?.template ? getTemplateTasks(ctx.supabase, plan.template.id) : Promise.resolve([]),
    getActivity(ctx.supabase, ctx.userId, ctx.today),
  ]);

  const input = buildDashboardInput({
    today: ctx.today,
    profileTargetLevel: ctx.profile?.target_level ?? null,
    plan,
    tasks,
    ...activity,
  });
  return { state: "signed-in", interactive: Boolean(plan), view: computeDashboard(input) };
}
