import { forwardRef, type ButtonHTMLAttributes } from "react";
import { cn } from "@/lib/cn";

export type IconButtonProps = Omit<ButtonHTMLAttributes<HTMLButtonElement>, "aria-label"> & {
  /** Ekran o'quvchilar uchun majburiy nom. */
  label: string;
  variant?: "soft" | "ghost" | "primary" | "outline";
  size?: "sm" | "md" | "lg";
  /** O'qilmagan bildirishnoma kabi kichik nuqta. */
  dot?: boolean;
};

const variants = {
  soft: "bg-surface-muted text-foreground hover:bg-surface-sunken",
  ghost: "text-muted hover:bg-surface-muted hover:text-foreground",
  primary: "bg-primary text-primary-foreground hover:bg-primary-hover",
  outline: "border border-border bg-surface text-foreground hover:bg-surface-muted",
} as const;

const sizes = {
  sm: "size-9 [&_svg]:size-4",
  md: "size-11 [&_svg]:size-5",
  lg: "size-12 [&_svg]:size-6",
} as const;

export const IconButton = forwardRef<HTMLButtonElement, IconButtonProps>(function IconButton(
  { label, variant = "ghost", size = "md", dot = false, className, children, type = "button", ...props },
  ref,
) {
  return (
    <button
      ref={ref}
      type={type}
      aria-label={label}
      title={label}
      className={cn(
        "relative inline-flex shrink-0 items-center justify-center rounded-full transition-colors duration-150",
        "disabled:pointer-events-none disabled:opacity-50",
        variants[variant],
        sizes[size],
        className,
      )}
      {...props}
    >
      {children}
      {dot && (
        <span
          aria-hidden="true"
          className="absolute top-2 right-2 size-2 rounded-full bg-danger ring-2 ring-surface"
        />
      )}
    </button>
  );
});
