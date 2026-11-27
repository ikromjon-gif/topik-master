import Link, { type LinkProps } from "next/link";
import { forwardRef, type AnchorHTMLAttributes, type ButtonHTMLAttributes, type ReactNode } from "react";
import { cn } from "@/lib/cn";

type IconButtonVariant = "soft" | "ghost" | "primary" | "outline";
type IconButtonSize = "sm" | "md" | "lg";

const variants: Record<IconButtonVariant, string> = {
  soft: "bg-surface-muted text-foreground hover:bg-surface-sunken",
  ghost: "text-muted hover:bg-surface-muted hover:text-foreground",
  primary: "bg-primary text-primary-foreground hover:bg-primary-hover",
  outline: "border border-border bg-surface text-foreground hover:bg-surface-muted",
};

const sizes: Record<IconButtonSize, string> = {
  sm: "size-9 [&_svg]:size-4",
  md: "size-11 [&_svg]:size-5",
  lg: "size-12 [&_svg]:size-6",
};

function iconButtonClasses(variant: IconButtonVariant, size: IconButtonSize, className?: string) {
  return cn(
    "relative inline-flex shrink-0 items-center justify-center rounded-full transition-colors duration-150",
    "disabled:pointer-events-none disabled:opacity-50",
    variants[variant],
    sizes[size],
    className,
  );
}

function Dot() {
  return (
    <span
      aria-hidden="true"
      className="absolute top-2 right-2 size-2 rounded-full bg-danger ring-2 ring-surface"
    />
  );
}

type CommonProps = {
  /** Ekran o‘quvchilar uchun majburiy nom. */
  label: string;
  variant?: IconButtonVariant;
  size?: IconButtonSize;
  /** O‘qilmagan bildirishnoma kabi kichik nuqta. Faqat haqiqiy holat bo‘lsa yoqing. */
  dot?: boolean;
  children: ReactNode;
};

export type IconButtonProps = CommonProps &
  Omit<ButtonHTMLAttributes<HTMLButtonElement>, "aria-label" | "children">;

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
      className={iconButtonClasses(variant, size, className)}
      {...props}
    >
      {children}
      {dot && <Dot />}
    </button>
  );
});

export type IconLinkProps = CommonProps &
  LinkProps &
  Omit<AnchorHTMLAttributes<HTMLAnchorElement>, "aria-label" | "children" | keyof LinkProps>;

/** IconButton ko‘rinishidagi havola (sahifaga o‘tish uchun). */
export function IconLink({
  label,
  variant = "ghost",
  size = "md",
  dot = false,
  className,
  children,
  ...props
}: IconLinkProps) {
  return (
    <Link aria-label={label} title={label} className={iconButtonClasses(variant, size, className)} {...props}>
      {children}
      {dot && <Dot />}
    </Link>
  );
}
