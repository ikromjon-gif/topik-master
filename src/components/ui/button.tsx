import { forwardRef, type ButtonHTMLAttributes } from "react";
import { cn } from "@/lib/cn";

export type ButtonVariant = "primary" | "secondary" | "outline" | "ghost" | "danger";
export type ButtonSize = "sm" | "md" | "lg";

const base =
  "inline-flex shrink-0 items-center justify-center gap-2 whitespace-nowrap rounded-control font-semibold " +
  "transition-colors duration-150 select-none " +
  "disabled:pointer-events-none disabled:opacity-50 " +
  "focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-ring";

const variants: Record<ButtonVariant, string> = {
  primary: "bg-primary text-primary-foreground hover:bg-primary-hover active:bg-primary-active",
  secondary:
    "bg-primary-soft text-primary-soft-foreground hover:bg-primary-soft/70 active:bg-primary-soft/60",
  outline:
    "border border-border bg-surface text-foreground hover:bg-surface-muted active:bg-surface-sunken",
  ghost: "text-foreground hover:bg-surface-muted active:bg-surface-sunken",
  danger: "bg-danger text-white hover:bg-danger/90 active:bg-danger/80 dark:text-background",
};

const sizes: Record<ButtonSize, string> = {
  sm: "h-9 px-3 text-caption [&_svg]:size-4",
  md: "h-11 px-4 text-body [&_svg]:size-5",
  lg: "h-12 px-5 text-body [&_svg]:size-5",
};

/** Havola (`<Link>`) uchun ham bir xil ko‘rinish beradi. */
export function buttonClasses({
  variant = "primary",
  size = "md",
  fullWidth = false,
  className,
}: {
  variant?: ButtonVariant;
  size?: ButtonSize;
  fullWidth?: boolean;
  className?: string;
} = {}): string {
  return cn(base, variants[variant], sizes[size], fullWidth && "w-full", className);
}

export type ButtonProps = ButtonHTMLAttributes<HTMLButtonElement> & {
  variant?: ButtonVariant;
  size?: ButtonSize;
  fullWidth?: boolean;
  loading?: boolean;
};

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(function Button(
  { variant, size, fullWidth, loading = false, className, children, disabled, type = "button", ...props },
  ref,
) {
  return (
    <button
      ref={ref}
      type={type}
      disabled={disabled || loading}
      aria-busy={loading || undefined}
      className={buttonClasses({ variant, size, fullWidth, className })}
      {...props}
    >
      {loading && (
        <span
          aria-hidden="true"
          className="size-4 animate-spin rounded-full border-2 border-current border-r-transparent"
        />
      )}
      {children}
    </button>
  );
});
