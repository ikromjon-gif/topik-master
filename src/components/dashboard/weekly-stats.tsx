import { Card, CardHeader } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { BarChartIcon } from "@/components/ui/icons";
import { UZ_WEEKDAYS, UZ_WEEKDAYS_SHORT, weekdayMondayFirst } from "@/lib/dashboard/dates.ts";
import { formatMinutes } from "@/lib/dashboard/metrics.ts";
import type { DashboardView } from "@/lib/dashboard/types.ts";
import { cn } from "@/lib/cn";

/**
 * Oxirgi 7 kunlik o‘qish vaqti (daqiqa) — bitta seriyali ustunli grafik.
 *  - bitta rang (primary), legend yo‘q — sarlavha seriyani nomlaydi
 *  - ustunlar pastki chiziqqa tayangan, yuqori uchlari 4px yumaloq
 *  - har bir kunda hover tooltip (hover maydoni — ustunning to‘liq balandligi,
 *    shuning uchun 0 daqiqali kunlarda ham ishlaydi)
 *  - grafik vizual (aria-hidden); klaviatura va ekran o‘quvchilar uchun
 *    xuddi shu ma’lumot yashirin jadvalda
 */
export function WeeklyStats({ view, className }: { view: DashboardView; className?: string }) {
  const max = Math.max(...view.week.map((d) => d.minutes), 0);
  // Y o‘qi uchun "toza" yuqori chegara (15 daqiqaga yaxlitlangan)
  const top = Math.max(15, Math.ceil(max / 15) * 15);
  const activeDays = view.week.filter((d) => d.minutes > 0).length;

  return (
    <Card className={className}>
      <CardHeader
        title="Haftalik statistika"
        icon={<BarChartIcon />}
        description="Oxirgi 7 kunlik o‘qish vaqti (daqiqa)"
      />

      {!view.hasWeekData ? (
        <EmptyState
          compact
          icon={<BarChartIcon />}
          title="Bu hafta hali o‘qish qayd etilmagan"
          description="Darslar bajarilganda kunlik o‘qish vaqti shu yerda ko‘rinadi."
        />
      ) : (
        <>
          <dl className="mb-4 grid grid-cols-2 gap-3">
            <div className="rounded-control bg-surface-muted px-3 py-2.5">
              <dt className="text-caption text-muted">Jami vaqt</dt>
              <dd className="text-heading font-bold text-foreground tabular-nums">{formatMinutes(view.weekTotalMinutes)}</dd>
            </div>
            <div className="rounded-control bg-surface-muted px-3 py-2.5">
              <dt className="text-caption text-muted">Faol kunlar</dt>
              <dd className="text-heading font-bold text-foreground tabular-nums">{activeDays} / 7</dd>
            </div>
          </dl>

          <div className="relative" aria-hidden="true">
            <div className="pointer-events-none absolute inset-x-0 top-0 flex items-center gap-2">
              <span className="w-8 text-right text-xs text-muted tabular-nums">{top}</span>
              <span className="h-px flex-1 border-t border-dashed border-border" />
            </div>
            <div className="ml-10 flex h-40 items-end gap-2 border-b border-border pt-2">
              {view.week.map((d) => {
                const h = d.minutes > 0 ? Math.max(4, (d.minutes / top) * 100) : 0;
                const isToday = d.date === view.today;
                const tip = `${UZ_WEEKDAYS[weekdayMondayFirst(d.date)]}, ${d.date}: ${d.minutes > 0 ? formatMinutes(d.minutes) : "o‘qilmagan"}`;
                return (
                  <div
                    key={d.date}
                    className="group relative flex h-full flex-1 cursor-default items-end justify-center rounded-t-[4px] hover:bg-surface-muted/60"
                  >
                    <div
                      className={cn(
                        "w-full max-w-9 rounded-t-[4px] transition-colors duration-150",
                        isToday ? "bg-primary" : "bg-primary/70 group-hover:bg-primary",
                      )}
                      style={{ height: `${h}%` }}
                    />
                    <span
                      data-tooltip
                      className="pointer-events-none absolute bottom-full z-10 mb-2 hidden whitespace-nowrap rounded-control border border-border bg-surface px-2.5 py-1.5 text-caption text-foreground shadow-raised group-hover:block"
                    >
                      {tip}
                    </span>
                  </div>
                );
              })}
            </div>
            <div className="mt-2 ml-10 flex gap-2">
              {view.week.map((d) => (
                <span
                  key={d.date}
                  className={cn(
                    "flex-1 text-center text-xs",
                    d.date === view.today ? "font-bold text-foreground" : "text-muted",
                  )}
                >
                  {UZ_WEEKDAYS_SHORT[weekdayMondayFirst(d.date)]}
                </span>
              ))}
            </div>
          </div>

          <table className="sr-only">
            <caption>Oxirgi 7 kunlik o‘qish vaqti</caption>
            <thead>
              <tr>
                <th scope="col">Kun</th>
                <th scope="col">O‘qish vaqti</th>
              </tr>
            </thead>
            <tbody>
              {view.week.map((d) => (
                <tr key={d.date}>
                  <th scope="row">
                    {UZ_WEEKDAYS[weekdayMondayFirst(d.date)]}, {d.date}
                  </th>
                  <td>{d.minutes > 0 ? formatMinutes(d.minutes) : "0 daqiqa"}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </>
      )}
    </Card>
  );
}
