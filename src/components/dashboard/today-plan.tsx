import Link from "next/link";
import { Card, CardHeader } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { buttonClasses } from "@/components/ui/button";
import { CalendarIcon, CheckIcon, ChevronRightIcon, ClockIcon } from "@/components/ui/icons";
import { UZ_WEEKDAYS, weekdayMondayFirst } from "@/lib/dashboard/dates.ts";
import type { DashboardView } from "@/lib/dashboard/types.ts";
import { cn } from "@/lib/cn";
import { SECTION_META } from "./section-meta";

/**
 * Bugungi topshiriqlar. Belgilash (bajarildi) Phase 4 da ma'lumotlar bazasiga
 * yoziladi; hozircha holat faqat ko‘rsatiladi — saqlanmaydigan checkbox
 * ko‘rsatilmaydi.
 */
export function TodayPlan({
  view,
  compact = false,
  className,
}: {
  view: DashboardView;
  /** Mobile: ixcham sarlavha ("Bugungi vazifalar", "2 / 4 bajarilgan"). */
  compact?: boolean;
  className?: string;
}) {
  const { today_tasks: t, today } = view;
  const weekday = UZ_WEEKDAYS[weekdayMondayFirst(today)];
  const meta =
    t.total > 0
      ? compact
        ? `${t.done} / ${t.total} bajarilgan`
        : `${t.day}-kun · ${today} (${weekday})`
      : compact
        ? undefined
        : `${today} (${weekday})`;

  return (
    <Card className={className}>
      <CardHeader
        title={compact ? "Bugungi vazifalar" : "Bugungi reja"}
        icon={<CalendarIcon />}
        action={meta && <span className={cn(compact ? "font-semibold text-foreground" : "text-muted")}>{meta}</span>}
      />
      {t.total === 0 ? (
        <EmptyState
          compact
          icon={<CalendarIcon />}
          title={view.plan?.finished ? "45 kunlik reja yakunlandi" : "Bugun uchun topshiriq yo‘q"}
          description={
            view.plan
              ? view.plan.finished
                ? "Natijalaringizni statistika bo‘limida ko‘ring."
                : "Bu kun uchun reja hali tuzilmagan."
              : "45 kunlik rejani boshlaganingizdan keyin kunlik topshiriqlar shu yerda chiqadi."
          }
          action={
            !view.plan ? (
              <Link href="/plan" className={buttonClasses({ size: "sm", variant: "secondary" })}>
                Rejani ko‘rish
              </Link>
            ) : undefined
          }
        />
      ) : (
        <ul className="flex flex-col gap-2">
          {t.items.map((task) => {
            const done = Boolean(task.completedOn);
            const section = SECTION_META[task.section];
            return (
              <li key={task.id}>
                <Link
                  href={task.href ?? section.href}
                  className={cn(
                    "flex min-h-12 items-center gap-3 rounded-control px-3 py-2.5 transition-colors duration-150",
                    done ? "bg-success-soft" : "bg-surface-muted hover:bg-surface-sunken",
                  )}
                >
                  <span
                    className={cn(
                      "grid size-6 shrink-0 place-items-center rounded-full border-2",
                      done ? "border-success bg-success text-white dark:text-background" : "border-border-strong",
                    )}
                  >
                    {done && <CheckIcon className="size-3.5" strokeWidth={3} />}
                    <span className="sr-only">{done ? "Bajarilgan" : "Bajarilmagan"}</span>
                  </span>
                  <span className={cn("hidden size-8 shrink-0 place-items-center rounded-control sm:grid [&_svg]:size-4", section.tone)}>
                    {section.icon}
                  </span>
                  <span className="min-w-0 flex-1 truncate text-body text-foreground">
                    {section.label}: <span className={task.titleKo ? "ko" : undefined}>{task.titleKo ?? task.title}</span>
                  </span>
                  {task.estimatedMinutes !== null && (
                    <span className="hidden shrink-0 items-center gap-1 text-caption text-muted sm:flex">
                      <ClockIcon className="size-4" /> ~{task.estimatedMinutes} daqiqa
                    </span>
                  )}
                  {done ? (
                    <CheckIcon className="size-5 shrink-0 text-success sm:hidden" />
                  ) : (
                    <ChevronRightIcon className="size-5 shrink-0 text-subtle" />
                  )}
                </Link>
              </li>
            );
          })}
        </ul>
      )}
    </Card>
  );
}
