import { StatTile } from "@/components/ui/stat-tile";
import { BarChartIcon, CalendarIcon, FlameIcon, TargetIcon } from "@/components/ui/icons";
import type { DashboardView } from "@/lib/dashboard/types.ts";

/** Desktop: 4 ta asosiy ko‘rsatkich. Ma'lumot yo‘q bo‘lsa "—" va tushuntiruvchi yorliq. */
export function StatsRow({ view }: { view: DashboardView }) {
  const plan = view.plan;
  return (
    <div className="grid grid-cols-2 gap-3 lg:grid-cols-4">
      <StatTile
        icon={<CalendarIcon />}
        value={plan?.currentDay ? `${plan.currentDay}-kun` : null}
        suffix={plan ? `/ ${plan.totalDays} kun` : undefined}
        label={plan?.started ? "O‘quv rejasi" : "Reja boshlanmagan"}
      />
      <StatTile
        icon={<TargetIcon />}
        tone="reading"
        value={view.overallProgressPct === null ? null : `${view.overallProgressPct}%`}
        label="Umumiy progress"
      />
      <StatTile
        icon={<BarChartIcon />}
        value={<span className="ko">{view.targetLevel}급</span>}
        label="Maqsad daraja"
      />
      <StatTile
        icon={<FlameIcon />}
        tone="streak"
        value={view.streak === null ? null : `${view.streak} kun`}
        label="Ketma-ket o‘qish"
      />
    </div>
  );
}
