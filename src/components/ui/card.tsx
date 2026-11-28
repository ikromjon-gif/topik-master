import type { HTMLAttributes, ReactNode } from "react";
import { cn } from "@/lib/cn";

type DivProps = HTMLAttributes<HTMLDivElement>;

export function Card({
  className,
  padded = true,
  interactive = false,
  ...props
}: DivProps & { padded?: boolean; interactive?: boolean }) {
  return (
    <div
      className={cn(
        "rounded-card border border-border bg-surface shadow-card",
        padded && "p-5 sm:p-6",
        interactive && "transition-colors duration-150 hover:border-border-strong hover:bg-surface-muted/40",
        className,
      )}
      {...props}
    />
  );
}

export function CardHeader({
  title,
  icon,
  action,
  description,
  className,
}: {
  title: ReactNode;
  icon?: ReactNode;
  action?: ReactNode;
  description?: ReactNode;
  className?: string;
}) {
  return (
    <div className={cn("mb-4 flex items-start justify-between gap-3", className)}>
      <div className="flex min-w-0 items-center gap-2.5">
        {icon && <span className="shrink-0 text-primary [&_svg]:size-5">{icon}</span>}
        <div className="min-w-0">
          <h2 className="truncate text-heading font-semibold text-foreground">{title}</h2>
          {description && <p className="mt-0.5 text-caption text-muted">{description}</p>}
        </div>
      </div>
      {action && <div className="shrink-0 text-caption">{action}</div>}
    </div>
  );
}

export function CardContent({ className, ...props }: DivProps) {
  return <div className={cn("text-body", className)} {...props} />;
}
