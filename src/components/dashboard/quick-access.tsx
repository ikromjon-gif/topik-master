import Link from "next/link";
import { Card, CardHeader } from "@/components/ui/card";
import { ZapIcon } from "@/components/ui/icons";
import type { SectionKey } from "@/lib/dashboard/types.ts";
import { cn } from "@/lib/cn";
import { SECTION_META } from "./section-meta";

const DESKTOP: SectionKey[] = ["vocabulary", "grammar", "listening", "reading", "writing", "mock"];
const MOBILE: SectionKey[] = ["listening", "reading", "writing", "grammar"];

/** Desktop: 6 ta bo‘limga tezkor kirish (karta ichida). */
export function QuickAccess({ className }: { className?: string }) {
  return (
    <Card className={className}>
      <CardHeader title="Tez kirish" icon={<ZapIcon />} />
      <ul className="grid grid-cols-3 gap-3 sm:grid-cols-6">
        {DESKTOP.map((key) => {
          const s = SECTION_META[key];
          return (
            <li key={key} className="min-w-0">
              <Link
                href={s.href}
                className="flex h-full flex-col items-center gap-2 rounded-card border border-border bg-surface px-2 py-4 text-center transition-colors duration-150 hover:border-border-strong hover:bg-surface-muted"
              >
                <span className={cn("grid size-11 place-items-center rounded-control [&_svg]:size-6", s.tone)}>
                  {s.icon}
                </span>
                <span className="w-full truncate text-caption font-semibold text-foreground">{s.short}</span>
                <span className="ko -mt-1.5 text-xs text-muted">({s.ko})</span>
              </Link>
            </li>
          );
        })}
      </ul>
    </Card>
  );
}

/** Mobile: 2×2 rangli bo‘lim kartalari. */
export function SectionCards({ className }: { className?: string }) {
  return (
    <nav aria-label="Bo‘limlar" className={className}>
      <ul className="grid grid-cols-2 gap-3">
        {MOBILE.map((key) => {
          const s = SECTION_META[key];
          return (
            <li key={key} className="min-w-0">
              <Link
                href={s.href}
                className={cn(
                  "flex h-full items-center gap-3 rounded-card border border-border p-4 transition-opacity duration-150 hover:opacity-90",
                  s.card,
                )}
              >
                <span className={cn("shrink-0 [&_svg]:size-8", s.tone.split(" ").find((c) => c.startsWith("text-")))}>
                  {s.icon}
                </span>
                <span className="min-w-0">
                  <span className="block truncate font-bold text-foreground">{s.short}</span>
                  <span className="ko block text-caption text-muted">({s.ko})</span>
                </span>
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
