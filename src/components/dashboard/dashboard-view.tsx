import type { DashboardView as View } from "@/lib/dashboard/types.ts";
import { HeroBanner } from "./hero-banner";
import { MobileStats } from "./mobile-stats";
import { PlanCalendar } from "./plan-calendar";
import { PlanProgressBar, PlanProgressRing, ProgressSummary } from "./plan-progress";
import { QuickAccess, SectionCards } from "./quick-access";
import { RecentResults } from "./recent-results";
import { StatsRow } from "./stats-row";
import { StreakCard } from "./streak-card";
import { TodayPlan } from "./today-plan";
import { WeeklyStats } from "./weekly-stats";

/**
 * Dashboard kompozitsiyasi. Bloklar bir xil; joylashuv ekran bo‘yicha:
 *  - <768px: mobile maket tartibi
 *  - 768–1279px: bitta asosiy ustun + ikki ustunli ichki gridlar
 *  - ≥1280px: 8 + 4 ustunli grid (desktop maket)
 */
export function DashboardView({ view }: { view: View }) {
  const hero = (
    <HeroBanner
      targetLevel={view.targetLevel}
      totalDays={view.plan?.totalDays ?? 45}
      planStarted={Boolean(view.plan?.started && !view.plan.finished)}
    />
  );

  return (
    <>
      {/* Mobile */}
      <div className="flex flex-col gap-4 md:hidden">
        {hero}
        <ProgressSummary view={view} />
        <TodayPlan view={view} compact />
        <SectionCards />
        <PlanProgressBar view={view} />
        <MobileStats view={view} />
        <WeeklyStats view={view} />
        <RecentResults results={view.recentResults} />
      </div>

      {/* Tablet va desktop */}
      <div className="hidden gap-5 md:grid xl:grid-cols-12">
        <div className="flex min-w-0 flex-col gap-5 xl:col-span-8">
          {hero}
          <StatsRow view={view} />
          <div className="grid gap-5 lg:grid-cols-3">
            <TodayPlan view={view} className="lg:col-span-2" />
            <PlanProgressRing view={view} />
          </div>
          <QuickAccess />
          <WeeklyStats view={view} />
        </div>
        <div className="grid min-w-0 content-start gap-5 lg:grid-cols-2 xl:col-span-4 xl:grid-cols-1">
          <PlanCalendar today={view.today} calendar={view.calendar} className="lg:row-span-2 xl:row-span-1" />
          <StreakCard streak={view.streak} atRisk={view.streakAtRisk} />
          <RecentResults results={view.recentResults} />
        </div>
      </div>
    </>
  );
}
