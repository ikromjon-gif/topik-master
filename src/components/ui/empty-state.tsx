import type { ReactNode } from "react";
import { cn } from "@/lib/cn";

/** Ma’lumot hali yo‘q bo‘lganda: soxta raqamlar o‘rniga shu ko‘rsatiladi. */
export function EmptyState({
  icon,
  title,
  description,
  action,
  compact = false,
  className,
}: {
  icon?: ReactNode;
  title: string;
  description?: string;
  action?: ReactNode;
  compact?: boolean;
  className?: string;
}) {
  return (
    <div
      className={cn(
        "flex flex-col items-center justify-center text-center",
        compact ? "gap-2 py-6" : "gap-3 py-10",
        className,
      )}
    >
      {icon && (
        <span
          className={cn(
            "grid place-items-center rounded-full bg-surface-muted text-subtle",
            compact ? "size-10 [&_svg]:size-5" : "size-12 [&_svg]:size-6",
          )}
        >
          {icon}
        </span>
      )}
      <div className="max-w-xs">
        <p className="text-body font-semibold text-foreground">{title}</p>
        {description && <p className="mt-1 text-caption text-muted">{description}</p>}
      </div>
      {action}
    </div>
  );
}
