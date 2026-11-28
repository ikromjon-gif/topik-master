import { BarChartIcon, ClockIcon, FlameIcon } from "@/components/ui/icons";
import type { DashboardView } from "@/lib/dashboard/types.ts";
import { cn } from "@/lib/cn";

/** Mobile: ketma-ketlik, o‘qish kunlari va jami vaqt. Ma'lumot yo‘q bo‘lsa "—". */
export function MobileStats({ view, className }: { view: DashboardView; className?: string }) {
  const hours = view.totalMinutes === null ? null : Math.round(view.totalMinutes / 60);
  const items = [
    { icon: <FlameIcon />, tone: "text-streak", value: view.streak === null ? null : `${view.streak} kun`, label: "Ketma-ketlik" },
    { icon: <BarChartIcon />, tone: "text-primary", value: view.studyDays === null ? null : `${view.studyDays} kun`, label: "O‘qish kunlari" },
    { icon: <ClockIcon />, tone: "text-primary", value: hours === null ? null : `${hours} soat`, label: "Jami o‘qish vaqti" },
  ];
  return (
    <dl className={cn("grid grid-cols-3 gap-3", className)}>
      {items.map((it) => (
        <div
          key={it.label}
          className="flex flex-col items-center gap-1 rounded-card border border-border bg-surface px-2 py-4 text-center shadow-card"
        >
          {/* dt "contents": ikonka va nom dt ichida (to‘g‘ri dl tuzilmasi), vizual tartib order bilan */}
          <dt className="contents">
            <span className={cn("order-1 [&_svg]:size-7", it.tone)}>{it.icon}</span>
            <span className="order-3 text-xs text-muted">{it.label}</span>
          </dt>
          <dd className="order-2 text-heading font-bold text-foreground tabular-nums">
            {it.value ?? <span className="text-subtle">—</span>}
          </dd>
        </div>
      ))}
    </dl>
  );
}
