import Link from "next/link";
import { Card, CardHeader } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { ArrowRightIcon, TrophyIcon } from "@/components/ui/icons";
import type { ResultInput } from "@/lib/dashboard/types.ts";
import { cn } from "@/lib/cn";
import { SECTION_META } from "./section-meta";

export function RecentResults({ results, className }: { results: ResultInput[]; className?: string }) {
  return (
    <Card className={className}>
      <CardHeader
        title="So‘nggi natijalar"
        action={
          results.length > 0 ? (
            <Link href="/stats" className="inline-flex items-center gap-1 font-semibold text-primary hover:underline">
              Barchasini ko‘rish <ArrowRightIcon className="size-4" />
            </Link>
          ) : undefined
        }
      />
      {results.length === 0 ? (
        <EmptyState
          compact
          icon={<TrophyIcon />}
          title="Hali natija yo‘q"
          description="Birinchi mashqni bajarganingizdan keyin natijalar shu yerda ko‘rinadi."
        />
      ) : (
        <ul className="flex flex-col gap-2">
          {results.map((r) => {
            const s = SECTION_META[r.section];
            const ratio = r.maxScore > 0 ? r.score / r.maxScore : 0;
            return (
              <li key={r.id} className="flex items-center gap-3 rounded-control bg-surface-muted px-3 py-2.5">
                <span className={cn("grid size-9 shrink-0 place-items-center rounded-control [&_svg]:size-5", s.tone)}>
                  {s.icon}
                </span>
                <span className="min-w-0 flex-1">
                  <span className="block truncate text-body font-semibold text-foreground">{r.title}</span>
                  <span className="block text-caption text-muted tabular-nums">{r.date}</span>
                </span>
                <span
                  className={cn(
                    "shrink-0 rounded-control px-2.5 py-1 text-caption font-bold tabular-nums",
                    ratio >= 0.6 ? "bg-success-soft text-success" : "bg-warning-soft text-warning",
                  )}
                >
                  {r.score} / {r.maxScore}
                </span>
              </li>
            );
          })}
        </ul>
      )}
    </Card>
  );
}
