"use client";

import Link from "next/link";
import { useMemo, useState } from "react";
import { Card, CardHeader } from "@/components/ui/card";
import { IconButton } from "@/components/ui/icon-button";
import { ArrowRightIcon, CheckIcon, ChevronLeftIcon, ChevronRightIcon } from "@/components/ui/icons";
import {
  UZ_MONTHS,
  UZ_WEEKDAYS,
  UZ_WEEKDAYS_SHORT,
  daysInMonth,
  weekdayMondayFirst,
  type IsoDate,
} from "@/lib/dashboard/dates.ts";
import type { DashboardView } from "@/lib/dashboard/types.ts";
import { cn } from "@/lib/cn";

type DayState = DashboardView["calendar"][string];

const STATE_LABEL: Record<DayState, string> = {
  completed: "bajarilgan",
  partial: "qisman bajarilgan",
  missed: "o‘tkazib yuborilgan",
  today: "bugun",
  upcoming: "rejadagi kun",
};

/**
 * Oylik taqvim. `today` serverdan beriladi (Asia/Seoul), shuning uchun
 * server va brauzer bir xil kunni ko‘rsatadi.
 */
export function PlanCalendar({
  today,
  calendar,
  className,
}: {
  today: IsoDate;
  calendar: DashboardView["calendar"];
  className?: string;
}) {
  const [ty, tm] = today.split("-").map(Number);
  const [cursor, setCursor] = useState({ y: ty, m: tm });

  const cells = useMemo(() => {
    const first = `${cursor.y}-${String(cursor.m).padStart(2, "0")}-01`;
    const lead = weekdayMondayFirst(first);
    const count = daysInMonth(cursor.y, cursor.m);
    const list: (IsoDate | null)[] = Array.from({ length: lead }, () => null);
    for (let d = 1; d <= count; d += 1) {
      list.push(`${cursor.y}-${String(cursor.m).padStart(2, "0")}-${String(d).padStart(2, "0")}`);
    }
    return list;
  }, [cursor]);

  const shift = (delta: number) =>
    setCursor(({ y, m }) => {
      const idx = y * 12 + (m - 1) + delta;
      return { y: Math.floor(idx / 12), m: (idx % 12) + 1 };
    });

  const monthLabel = `${UZ_MONTHS[cursor.m - 1]} ${cursor.y}`;
  const hasPlan = Object.keys(calendar).length > 0;

  return (
    <Card className={className}>
      <CardHeader
        title="45 kunlik taqvim"
        action={
          <Link href="/plan" className="inline-flex items-center gap-1 font-semibold text-primary hover:underline">
            Barcha kunlar <ArrowRightIcon className="size-4" />
          </Link>
        }
      />
      <div className="mb-3 flex items-center justify-between">
        <IconButton label="Oldingi oy" variant="outline" size="sm" onClick={() => shift(-1)}>
          <ChevronLeftIcon />
        </IconButton>
        <p className="text-body font-semibold text-foreground" aria-live="polite">
          {monthLabel}
        </p>
        <IconButton label="Keyingi oy" variant="outline" size="sm" onClick={() => shift(1)}>
          <ChevronRightIcon />
        </IconButton>
      </div>

      <table className="w-full table-fixed border-separate border-spacing-y-1 text-center">
        <caption className="sr-only">{monthLabel} taqvimi</caption>
        <thead>
          <tr>
            {UZ_WEEKDAYS_SHORT.map((d, i) => (
              <th key={d} scope="col" className="pb-1 text-caption font-medium text-muted">
                <abbr title={UZ_WEEKDAYS[i]} className="no-underline">
                  {d}
                </abbr>
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {Array.from({ length: Math.ceil(cells.length / 7) }, (_, row) => (
            <tr key={row}>
              {cells.slice(row * 7, row * 7 + 7).map((date, i) => (
                <td key={date ?? `e${row}-${i}`} className="p-0">
                  {date && <DayCell date={date} state={calendar[date]} isToday={date === today} />}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>

      {!hasPlan && (
        <p className="mt-3 text-center text-caption text-muted">
          Reja boshlangach, o‘quv kunlari taqvimda belgilanadi.
        </p>
      )}
    </Card>
  );
}

function DayCell({ date, state, isToday }: { date: IsoDate; state?: DayState; isToday: boolean }) {
  const day = Number(date.slice(8));
  const effective: DayState | undefined = isToday ? (state === "completed" ? "completed" : "today") : state;
  const label = `${date}${effective ? `, ${STATE_LABEL[effective]}` : ""}`;

  return (
    <span
      aria-label={label}
      aria-current={isToday ? "date" : undefined}
      className={cn(
        "relative mx-auto grid size-9 place-items-center rounded-full text-caption font-semibold tabular-nums",
        !effective && "font-medium text-foreground",
        effective === "completed" && "bg-success-soft text-success",
        effective === "partial" && "bg-warning-soft text-warning",
        effective === "missed" && "text-subtle line-through decoration-1",
        effective === "upcoming" && "bg-surface-muted text-foreground",
        isToday && effective !== "completed" && "bg-primary text-primary-foreground",
        isToday && effective === "completed" && "ring-2 ring-primary ring-offset-2 ring-offset-surface",
      )}
    >
      {day}
      {effective === "completed" && (
        <CheckIcon className="absolute -top-0.5 -right-0.5 size-3.5 rounded-full bg-surface text-success" strokeWidth={3} />
      )}
    </span>
  );
}
