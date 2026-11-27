import type { HTMLAttributes } from "react";
import { cn } from "@/lib/cn";

export type BadgeTone = "neutral" | "primary" | "success" | "warning" | "danger";

const tones: Record<BadgeTone, string> = {
  neutral: "bg-surface-muted text-muted",
  primary: "bg-primary-soft text-primary-soft-foreground",
  success: "bg-success-soft text-success",
  warning: "bg-warning-soft text-warning",
  danger: "bg-danger-soft text-danger",
};

export function Badge({
  tone = "neutral",
  size = "md",
  className,
  ...props
}: HTMLAttributes<HTMLSpanElement> & { tone?: BadgeTone; size?: "sm" | "md" }) {
  return (
    <span
      className={cn(
        "inline-flex items-center gap-1 rounded-full font-semibold whitespace-nowrap [&_svg]:size-3.5",
        size === "sm" ? "px-2 py-0.5 text-xs" : "px-2.5 py-1 text-caption",
        tones[tone],
        className,
      )}
      {...props}
    />
  );
}

/**
 * Kontent tekshiruv holati. Faqat `verified` "Mutaxassis tasdiqlagan" deb
 * ko‘rsatiladi; qolgan barcha holatlar "Tekshirilmoqda".
 */
export function VerificationBadge({
  status,
  className,
}: {
  status: "draft" | "reviewed" | "verified";
  className?: string;
}) {
  return status === "verified" ? (
    <Badge tone="success" size="sm" className={className}>
      Mutaxassis tasdiqlagan
    </Badge>
  ) : (
    <Badge tone="neutral" size="sm" className={className}>
      Tekshirilmoqda
    </Badge>
  );
}
