import { SECTION_META } from "@/components/dashboard/section-meta";
import { WeeklyStats } from "@/components/dashboard/weekly-stats";
import { AccessNotice } from "@/components/layout/access-notice";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { Card, CardHeader } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { BarChartIcon, CalendarIcon, ClockIcon, FlameIcon, TrophyIcon } from "@/components/ui/icons";
import { ProgressBar } from "@/components/ui/progress";
import { StatTile } from "@/components/ui/stat-tile";
import { siteConfig } from "@/config/site";
import { UZ_WEEKDAYS, weekdayMondayFirst } from "@/lib/dashboard/dates.ts";
import { activeDates, computeDashboard, formatMinutes } from "@/lib/dashboard/metrics.ts";
import type { SectionKey } from "@/lib/dashboard/types.ts";
import { buildDashboardInput } from "@/lib/learning/mapping.ts";
import { getActivePlan, getActivity, getLearningContext, getTemplateTasks } from "@/lib/learning/queries";
import { activityGrid, levelForScore, sectionAccuracy } from "@/lib/learning/stats.ts";
import { cn } from "@/lib/cn";

export const metadata = routeMetadata("/stats");
export const dynamic = "force-dynamic";

export default async function StatsPage() {
  const ctx = await getLearningContext();
  const title = "Statistika";
  const description = "Faqat haqiqiy o‘qish ma’lumotlaringizdan hisoblanadi.";

  if (ctx.state !== "signed-in") {
    return (
      <PageContainer title={title} description={description}>
        <AccessNotice state={ctx.state} icon={<BarChartIcon />} next="/stats" what="Statistika" />
      </PageContainer>
    );
  }

  const plan = await getActivePlan(ctx.supabase, ctx.userId);
  const [tasks, activity] = await Promise.all([
    plan?.template ? getTemplateTasks(ctx.supabase, plan.template.id) : Promise.resolve([]),
    getActivity(ctx.supabase, ctx.userId, ctx.today),
  ]);
  const input = buildDashboardInput({ today: ctx.today, profileTargetLevel: ctx.profile?.target_level ?? null, plan, tasks, ...activity });
  const view = computeDashboard(input);
  const grid = activityGrid(activeDates(input), ctx.today, 35);
  const accuracy = sectionAccuracy(activity.attempts);
  const hasAnything = view.studyDays !== null || activity.attempts.length > 0;

  return (
    <PageContainer title={title} description={description}>
      {!hasAnything ? (
        <Card>
          <EmptyState
            icon={<BarChartIcon />}
            title="Hali statistika yo‘q"
            description="Reja topshiriqlarini bajaring yoki mashq qiling — natijalar shu yerda hisoblanadi."
          />
        </Card>
      ) : (
        <div className="flex flex-col gap-5">
          <div className="grid grid-cols-2 gap-3 lg:grid-cols-4">
            <StatTile icon={<CalendarIcon />} value={view.studyDays === null ? null : `${view.studyDays} kun`} label="Faol kunlar" />
            <StatTile icon={<FlameIcon />} tone="streak" value={view.streak === null ? null : `${view.streak} kun`} label="Ketma-ketlik" />
            <StatTile icon={<ClockIcon />} value={view.totalMinutes === null ? null : formatMinutes(view.totalMinutes)} label="O‘lchangan o‘qish vaqti" />
            <StatTile icon={<TrophyIcon />} tone="success" value={activity.attempts.length ? `${activity.attempts.length} ta` : null} label="Mashq va testlar" />
          </div>

          <div className="grid gap-5 xl:grid-cols-2">
            <WeeklyStats view={view} />
            <Card>
              <CardHeader title="Oxirgi 5 hafta" icon={<CalendarIcon />} description="Faol kun: topshiriq bajarilgan yoki mashq qilingan kun" />
              <ol className="grid grid-cols-7 gap-1.5" aria-label="Oxirgi 35 kunlik faollik">
                {grid.map((d) => (
                  <li
                    key={d.date}
                    title={`${UZ_WEEKDAYS[weekdayMondayFirst(d.date)]}, ${d.date}: ${d.active ? "faol" : "faollik yo‘q"}`}
                    aria-label={`${d.date}: ${d.active ? "faol" : "faollik yo‘q"}`}
                    className={cn(
                      "aspect-square rounded-[4px]",
                      d.active ? "bg-primary" : "bg-surface-sunken",
                      d.date === ctx.today && "ring-2 ring-primary ring-offset-2 ring-offset-surface",
                    )}
                  />
                ))}
              </ol>
            </Card>
          </div>

          <Card>
            <CardHeader title="Bo‘limlar bo‘yicha natija" icon={<TrophyIcon />} />
            {accuracy.length === 0 ? (
              <p className="text-caption text-muted">Hali mashq natijasi yo‘q.</p>
            ) : (
              <ul className="flex flex-col gap-4">
                {accuracy.map((a) => {
                  const meta = SECTION_META[a.section as SectionKey];
                  return (
                    <li key={a.section}>
                      <div className="mb-1.5 flex justify-between text-caption">
                        <span className="font-semibold text-foreground">{meta?.label ?? a.section}</span>
                        <span className="text-muted tabular-nums">
                          {a.scorePct}% · {a.attempts} ta urinish
                        </span>
                      </div>
                      <ProgressBar value={a.scorePct} label={`${meta?.label ?? a.section}: o‘rtacha natija`} />
                    </li>
                  );
                })}
              </ul>
            )}
          </Card>

          {activity.attempts.length > 0 && (
            <Card>
              <CardHeader title="So‘nggi urinishlar" />
              <ul className="divide-y divide-border">
                {activity.attempts.slice(0, 20).map((a) => {
                  const lvl = Number(a.max_score) === 300 ? levelForScore(Number(a.score), siteConfig.exam.levelThresholds) : null;
                  return (
                    <li key={a.id} className="flex items-center justify-between gap-3 py-2.5 text-caption">
                      <span className="min-w-0">
                        <span className="block truncate font-semibold text-foreground">{a.title}</span>
                        <span className="text-muted tabular-nums">{a.taken_on}</span>
                      </span>
                      <span className="shrink-0 font-semibold tabular-nums text-foreground">
                        {Number(a.score)} / {Number(a.max_score)}
                        {lvl !== null && <span className="ko ml-2 text-success">{lvl}급</span>}
                      </span>
                    </li>
                  );
                })}
              </ul>
            </Card>
          )}
        </div>
      )}
    </PageContainer>
  );
}
