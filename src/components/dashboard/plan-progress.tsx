import Link from "next/link";
import { siteConfig } from "@/config/site";
import { Card, CardHeader } from "@/components/ui/card";
import { ProgressBar, ProgressRing } from "@/components/ui/progress";
import { ArrowRightIcon, CalendarIcon, TargetIcon } from "@/components/ui/icons";
import type { DashboardView } from "@/lib/dashboard/types.ts";
import { cn } from "@/lib/cn";

function levelRange(level: number): string {
  const t = siteConfig.exam.levelThresholds as Record<number, number>;
  const from = t[level];
  const next = t[level + 1];
  return next ? `${from}–${next - 1} ball` : `${from}+ ball`;
}

/** Desktop: 45 kunlik progress halqasi (bajarilgan kunlar). */
export function PlanProgressRing({ view, className }: { view: DashboardView; className?: string }) {
  const plan = view.plan;
  return (
    <Card className={cn("flex flex-col items-center text-center", className)}>
      <h2 className="text-heading font-semibold text-foreground">{plan?.totalDays ?? 45} kunlik progress</h2>
      <ProgressRing
        value={plan ? plan.dayProgressPct : null}
        label="45 kunlik progress"
        size={136}
        className="my-4"
      />
      <p className="text-body font-semibold text-foreground tabular-nums">
        {plan ? `${plan.completedDays} / ${plan.totalDays} kun` : "Reja boshlanmagan"}
      </p>
    </Card>
  );
}

/** Mobile: "Mening progressim" — umumiy progress va maqsad daraja. */
export function ProgressSummary({ view, className }: { view: DashboardView; className?: string }) {
  return (
    <Card className={cn("flex items-center gap-4", className)}>
      <ProgressRing value={view.overallProgressPct} label="Umumiy progress" size={96} strokeWidth={10} />
      <div className="min-w-0 flex-1">
        <h2 className="text-heading font-semibold text-foreground">Mening progressim</h2>
        <p className="text-caption text-muted">
          Jami maqsad: {siteConfig.exam.name} <span className="ko">{view.targetLevel}급</span>
        </p>
        <p className="mt-2 inline-flex items-center gap-1.5 rounded-control bg-success-soft px-2.5 py-1 text-caption font-semibold text-success">
          <TargetIcon className="size-4" />
          <span className="ko">{view.targetLevel}급</span>
          <span className="font-medium">({levelRange(view.targetLevel)})</span>
        </p>
      </div>
    </Card>
  );
}

/** Mobile: 45 kunlik reja chizig‘i. */
export function PlanProgressBar({ view, className }: { view: DashboardView; className?: string }) {
  const plan = view.plan;
  return (
    <Card className={className}>
      <CardHeader
        title={`${plan?.totalDays ?? 45} kunlik o‘quv rejasi`}
        icon={<CalendarIcon />}
        action={
          <Link href="/plan" className="inline-flex items-center gap-1 font-semibold text-primary hover:underline">
            Batafsil <ArrowRightIcon className="size-4" />
          </Link>
        }
      />
      <div className="mb-2 flex justify-between text-body font-semibold tabular-nums">
        <span>{plan?.currentDay ? `${plan.currentDay} / ${plan.totalDays} kun` : "Reja boshlanmagan"}</span>
        <span>{plan ? `${plan.dayProgressPct}%` : "—"}</span>
      </div>
      <ProgressBar value={plan ? plan.dayProgressPct : null} label="45 kunlik o‘quv rejasi" />
    </Card>
  );
}
