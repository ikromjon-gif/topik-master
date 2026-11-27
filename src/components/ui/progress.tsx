import type { ReactNode } from "react";
import { cn } from "@/lib/cn";

function clamp(value: number) {
  return Math.min(100, Math.max(0, value));
}

/**
 * Halqa ko'rinishidagi progress.
 * `value` null bo'lsa — ma'lumot yo'q: halqa bo'sh, markazda "—".
 * Hech qachon taxminiy qiymat ko'rsatilmaydi.
 */
export function ProgressRing({
  value,
  size = 128,
  strokeWidth = 12,
  label,
  children,
  className,
}: {
  value: number | null;
  size?: number;
  strokeWidth?: number;
  /** Ekran o'quvchilar uchun nom, masalan "Umumiy progress". */
  label: string;
  /** Markazdagi kontent; berilmasa foiz ko'rsatiladi. */
  children?: ReactNode;
  className?: string;
}) {
  const radius = (size - strokeWidth) / 2;
  const circumference = 2 * Math.PI * radius;
  const pct = value === null ? 0 : clamp(value);
  const offset = circumference * (1 - pct / 100);

  return (
    <div
      role="progressbar"
      aria-label={label}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-valuenow={value === null ? undefined : Math.round(pct)}
      aria-valuetext={value === null ? "Ma'lumot yo'q" : `${Math.round(pct)}%`}
      className={cn("relative inline-grid place-items-center", className)}
      style={{ width: size, height: size }}
    >
      <svg width={size} height={size} viewBox={`0 0 ${size} ${size}`} className="-rotate-90" aria-hidden="true">
        <circle
          cx={size / 2}
          cy={size / 2}
          r={radius}
          fill="none"
          strokeWidth={strokeWidth}
          className="stroke-surface-sunken"
        />
        {value !== null && pct > 0 && (
          <circle
            cx={size / 2}
            cy={size / 2}
            r={radius}
            fill="none"
            strokeWidth={strokeWidth}
            strokeLinecap="round"
            strokeDasharray={circumference}
            strokeDashoffset={offset}
            className="stroke-primary transition-[stroke-dashoffset] duration-500 ease-out"
          />
        )}
      </svg>
      <div className="absolute inset-0 grid place-items-center text-center">
        {children ?? (
          <span className="text-title font-bold tabular-nums text-foreground">
            {value === null ? "—" : `${Math.round(pct)}%`}
          </span>
        )}
      </div>
    </div>
  );
}

export function ProgressBar({
  value,
  label,
  tone = "primary",
  className,
}: {
  value: number | null;
  label: string;
  tone?: "primary" | "success";
  className?: string;
}) {
  const pct = value === null ? 0 : clamp(value);
  return (
    <div
      role="progressbar"
      aria-label={label}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-valuenow={value === null ? undefined : Math.round(pct)}
      aria-valuetext={value === null ? "Ma'lumot yo'q" : `${Math.round(pct)}%`}
      className={cn("h-2.5 w-full overflow-hidden rounded-full bg-surface-sunken", className)}
    >
      <div
        className={cn(
          "h-full rounded-full transition-[width] duration-500 ease-out",
          tone === "primary" ? "bg-primary" : "bg-success",
        )}
        style={{ width: `${pct}%` }}
      />
    </div>
  );
}
