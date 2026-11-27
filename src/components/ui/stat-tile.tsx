import type { ReactNode } from "react";
import { cn } from "@/lib/cn";

/**
 * Bitta ko'rsatkich kartasi (masalan "12-kun / 45 kun").
 * `value` null bo'lsa "—" ko'rsatiladi: ma'lumot yo'qligi ochiq aytiladi.
 */
export function StatTile({
  icon,
  value,
  suffix,
  label,
  tone = "primary",
  className,
}: {
  icon: ReactNode;
  value: ReactNode | null;
  suffix?: ReactNode;
  label: string;
  tone?: "primary" | "reading" | "streak" | "success";
  className?: string;
}) {
  const toneClass = {
    primary: "bg-primary-soft text-primary",
    reading: "bg-reading-soft text-reading",
    streak: "bg-warning-soft text-streak",
    success: "bg-success-soft text-success",
  }[tone];

  return (
    <div
      className={cn(
        "flex items-center gap-3.5 rounded-card border border-border bg-surface p-4 shadow-card",
        className,
      )}
    >
      <span className={cn("grid size-11 shrink-0 place-items-center rounded-control [&_svg]:size-6", toneClass)}>
        {icon}
      </span>
      <div className="min-w-0">
        <p className="flex items-baseline gap-1 text-title font-bold tabular-nums text-foreground">
          {value ?? <span className="text-subtle">—</span>}
          {value !== null && suffix && <span className="text-caption font-medium text-muted">{suffix}</span>}
        </p>
        <p className="truncate text-caption text-muted">{label}</p>
      </div>
    </div>
  );
}
