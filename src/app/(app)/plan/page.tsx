import Link from "next/link";
import { SECTION_META } from "@/components/dashboard/section-meta";
import { TodayPlan } from "@/components/dashboard/today-plan";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { StartPlanForm } from "@/components/plan/start-plan-form";
import { Badge } from "@/components/ui/badge";
import { buttonClasses } from "@/components/ui/button";
import { Card, CardHeader } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { CalendarIcon, CheckIcon } from "@/components/ui/icons";
import { ProgressBar } from "@/components/ui/progress";
import { addDays } from "@/lib/dashboard/dates.ts";
import { computeDashboard } from "@/lib/dashboard/metrics.ts";
import { abandonPlan, toggleTask } from "@/lib/learning/actions";
import { buildDashboardInput } from "@/lib/learning/mapping.ts";
import {
  getActivePlan,
  getActivity,
  getLearningContext,
  getPublishedTemplates,
  getTemplateTasks,
} from "@/lib/learning/queries";
import { cn } from "@/lib/cn";

export const metadata = routeMetadata("/plan");
export const dynamic = "force-dynamic";

const STATE_BADGE = {
  completed: { tone: "success", text: "Bajarilgan" },
  partial: { tone: "warning", text: "Qisman" },
  missed: { tone: "neutral", text: "O‘tkazib yuborilgan" },
  today: { tone: "primary", text: "Bugun" },
  upcoming: { tone: "neutral", text: "Kutilmoqda" },
} as const;

export default async function PlanPage() {
  const ctx = await getLearningContext();
  const title = "O‘quv rejasi";
  const description = "45 kunlik TOPIK II tayyorgarlik rejasi.";

  if (ctx.state !== "signed-in") {
    return (
      <PageContainer title={title} description={description}>
        <Card>
          <EmptyState
            icon={<CalendarIcon />}
            title={ctx.state === "not-configured" ? "Reja uchun ma’lumotlar bazasi kerak" : "Rejani ko‘rish uchun tizimga kiring"}
            description={
              ctx.state === "not-configured"
                ? "Supabase ulanganidan keyin rejani boshlash va natijalarni saqlash mumkin bo‘ladi."
                : "Reja va bajarilgan topshiriqlar hisobingizga saqlanadi."
            }
            action={
              ctx.state === "signed-out" ? (
                <Link href="/login?next=/plan" className={buttonClasses({ size: "sm" })}>
                  Kirish
                </Link>
              ) : undefined
            }
          />
        </Card>
      </PageContainer>
    );
  }

  const plan = await getActivePlan(ctx.supabase, ctx.userId);

  if (!plan || !plan.template) {
    const templates = await getPublishedTemplates(ctx.supabase);
    const published = templates.filter((t) => t.status === "reviewed" || t.status === "verified");
    return (
      <PageContainer title={title} description={description}>
        <Card>
          <CardHeader title="Rejani boshlash" icon={<CalendarIcon />} />
          {published.length === 0 ? (
            <EmptyState
              compact
              icon={<CalendarIcon />}
              title="Reja shabloni tekshiruvni kutmoqda"
              description="45 kunlik reja jamoa tomonidan ko‘rib chiqilgach (reviewed) shu yerda boshlash mumkin bo‘ladi."
            />
          ) : (
            <StartPlanForm templates={published} today={ctx.today} defaultLevel={ctx.profile?.target_level ?? 4} />
          )}
        </Card>
      </PageContainer>
    );
  }

  const [tasks, activity] = await Promise.all([
    getTemplateTasks(ctx.supabase, plan.template.id),
    getActivity(ctx.supabase, ctx.userId, ctx.today),
  ]);
  const input = buildDashboardInput({
    today: ctx.today,
    profileTargetLevel: ctx.profile?.target_level ?? null,
    plan,
    tasks,
    ...activity,
  });
  const view = computeDashboard(input);
  const p = view.plan!;
  const weeks = Math.ceil(p.totalDays / 7);

  return (
    <PageContainer title={title} description={plan.template.title}>
      <div className="flex flex-col gap-5">
        <Card>
          <div className="mb-3 flex flex-wrap items-end justify-between gap-3">
            <div>
              <p className="text-caption text-muted">
                {p.startDate} — {addDays(p.startDate, p.totalDays - 1)} · Maqsad{" "}
                <span className="ko">{view.targetLevel}급</span>
              </p>
              <p className="text-title font-bold text-foreground tabular-nums">
                {p.finished ? "Reja yakunlandi" : p.currentDay ? `${p.currentDay}-kun / ${p.totalDays}` : "Reja hali boshlanmagan"}
              </p>
            </div>
            <p className="text-body font-semibold tabular-nums">
              {p.completedDays} / {p.totalDays} kun bajarildi · {p.dayProgressPct}%
            </p>
          </div>
          <ProgressBar value={p.dayProgressPct} label="45 kunlik reja" />
        </Card>

        {!p.finished && p.currentDay && <TodayPlan view={view} onToggle={toggleTask} />}

        {Array.from({ length: weeks }, (_, w) => (
          <section key={w} aria-labelledby={`week-${w}`}>
            <h2 id={`week-${w}`} className="mb-3 text-heading font-semibold text-foreground">
              {w + 1}-hafta
            </h2>
            <ol className="grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
              {Array.from({ length: 7 }, (_, i) => w * 7 + i + 1)
                .filter((day) => day <= p.totalDays)
                .map((day) => {
                  const date = addDays(p.startDate, day - 1);
                  const state = view.calendar[date] ?? "upcoming";
                  const dayTasks = input.tasks.filter((t) => t.day === day);
                  const badge = STATE_BADGE[state];
                  return (
                    <li
                      key={day}
                      className={cn(
                        "min-w-0 rounded-card border bg-surface p-4 shadow-card",
                        state === "today" ? "border-primary" : "border-border",
                      )}
                    >
                      <div className="mb-2 flex items-center justify-between gap-2">
                        <p className="font-semibold text-foreground">
                          {day}-kun <span className="text-caption font-normal text-muted tabular-nums">· {date}</span>
                        </p>
                        <Badge tone={badge.tone} size="sm">
                          {badge.text}
                        </Badge>
                      </div>
                      {dayTasks.length === 0 ? (
                        <p className="text-caption text-muted">Topshiriq belgilanmagan.</p>
                      ) : (
                        <ul className="flex flex-col gap-1.5">
                          {dayTasks.map((t) => (
                            <li key={t.id} className="flex min-w-0 items-center gap-2 text-caption">
                              <span
                                className={cn(
                                  "grid size-4 shrink-0 place-items-center rounded-full border",
                                  t.completedOn ? "border-success bg-success text-white dark:text-background" : "border-border-strong",
                                )}
                              >
                                {t.completedOn && <CheckIcon className="size-3" strokeWidth={3} />}
                              </span>
                              <span className="sr-only">{t.completedOn ? "Bajarilgan:" : "Bajarilmagan:"}</span>
                              <span className="min-w-0 truncate text-foreground">
                                {SECTION_META[t.section].short}: {t.title}
                              </span>
                            </li>
                          ))}
                        </ul>
                      )}
                    </li>
                  );
                })}
            </ol>
          </section>
        ))}

        <details className="rounded-card border border-border bg-surface p-4">
          <summary className="cursor-pointer text-caption font-semibold text-muted">Rejani bekor qilish</summary>
          <p className="mt-2 text-caption text-muted">
            Reja to‘xtatiladi. Bajarilgan topshiriqlar tarixda saqlanib qoladi va yangi reja boshlash mumkin bo‘ladi.
          </p>
          <form action={abandonPlan} className="mt-3">
            <button type="submit" className={buttonClasses({ variant: "danger", size: "sm" })}>
              Ha, rejani bekor qilish
            </button>
          </form>
        </details>
      </div>
    </PageContainer>
  );
}
