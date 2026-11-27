import type { SupabaseClient } from "@supabase/supabase-js";
import { siteConfig } from "@/config/site";
import { toIsoDate, type IsoDate } from "@/lib/dashboard/dates.ts";
import { getCurrentUser } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/env";
import {
  activityWindowStart,
  type AttemptRow,
  type CompletionRow,
  type PlanRow,
  type SessionRow,
  type TemplateTaskRow,
} from "./mapping.ts";

export type Profile = {
  id: string;
  display_name: string | null;
  role: "learner" | "editor" | "korean_expert" | "admin";
  target_level: number;
  time_zone: string;
};

export type LearningContext =
  | { state: "not-configured"; today: IsoDate }
  | { state: "signed-out"; today: IsoDate }
  | { state: "signed-in"; today: IsoDate; supabase: SupabaseClient; userId: string; email: string | null; profile: Profile | null };

/** Joriy foydalanuvchi holati va uning vaqt zonasidagi "bugun". */
export async function getLearningContext(now: Date = new Date()): Promise<LearningContext> {
  const fallbackToday = toIsoDate(now, siteConfig.timeZone);
  if (!isSupabaseConfigured()) return { state: "not-configured", today: fallbackToday };
  const session = await getCurrentUser();
  if (!session) return { state: "signed-out", today: fallbackToday };

  const { data: profile } = await session.supabase
    .from("profiles")
    .select("id, display_name, role, target_level, time_zone")
    .eq("id", session.user.id)
    .maybeSingle<Profile>();

  const tz = profile?.time_zone || siteConfig.timeZone;
  return {
    state: "signed-in",
    today: toIsoDate(now, tz),
    supabase: session.supabase,
    userId: session.user.id,
    email: session.user.email ?? null,
    profile: profile ?? null,
  };
}

export type ActivePlan = PlanRow & { template: { id: string; total_days: number; title: string } | null };

export async function getActivePlan(supabase: SupabaseClient, userId: string): Promise<ActivePlan | null> {
  const { data } = await supabase
    .from("user_plans")
    .select("id, start_date, target_level, template:plan_templates(id, total_days, title)")
    .eq("user_id", userId)
    .eq("status", "active")
    .maybeSingle();
  if (!data) return null;
  const template = Array.isArray(data.template) ? data.template[0] : data.template;
  return { ...(data as Omit<ActivePlan, "template">), template: template ?? null } as ActivePlan;
}

export async function getTemplateTasks(supabase: SupabaseClient, templateId: string): Promise<TemplateTaskRow[]> {
  const { data } = await supabase
    .from("plan_template_tasks")
    .select("id, day, position, section, title, title_ko, estimated_minutes, href")
    .eq("template_id", templateId)
    .order("day")
    .order("position");
  return (data ?? []) as TemplateTaskRow[];
}

/** O‘quvchiga ko‘rinadigan (nashr qilingan) reja shablonlari. */
export async function getPublishedTemplates(supabase: SupabaseClient) {
  const { data } = await supabase
    .from("plan_templates")
    .select("id, key, title, total_days, target_level, status")
    .order("created_at");
  return (data ?? []) as { id: string; key: string; title: string; total_days: number; target_level: number; status: string }[];
}

export async function getActivity(supabase: SupabaseClient, userId: string, today: IsoDate) {
  const since = activityWindowStart(today);
  const [completions, sessions, attempts] = await Promise.all([
    supabase
      .from("user_task_completions")
      .select("template_task_id, completed_on, user_plan_id")
      .eq("user_id", userId)
      .gte("completed_on", since),
    supabase
      .from("study_sessions")
      .select("studied_on, minutes")
      .eq("user_id", userId)
      .gte("studied_on", since),
    supabase
      .from("test_attempts")
      .select("id, section, title, score, max_score, taken_on")
      .eq("user_id", userId)
      .order("taken_on", { ascending: false })
      .limit(50),
  ]);
  return {
    completions: (completions.data ?? []) as CompletionRow[],
    sessions: (sessions.data ?? []) as SessionRow[],
    attempts: (attempts.data ?? []) as AttemptRow[],
  };
}
