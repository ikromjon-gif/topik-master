import { forwardRef, useId, type InputHTMLAttributes, type ReactNode } from "react";
import { cn } from "@/lib/cn";

export type InputProps = InputHTMLAttributes<HTMLInputElement> & {
  label?: string;
  /** Label ko‘rinmasin, lekin ekran o‘quvchilar uchun qolsin. */
  hideLabel?: boolean;
  hint?: string;
  error?: string;
  leadingIcon?: ReactNode;
  containerClassName?: string;
};

export const Input = forwardRef<HTMLInputElement, InputProps>(function Input(
  { label, hideLabel = false, hint, error, leadingIcon, id, className, containerClassName, ...props },
  ref,
) {
  const autoId = useId();
  const inputId = id ?? autoId;
  const hintId = hint ? `${inputId}-hint` : undefined;
  const errorId = error ? `${inputId}-error` : undefined;

  return (
    <div className={cn("flex flex-col gap-1.5", containerClassName)}>
      {label && (
        <label
          htmlFor={inputId}
          className={cn("text-caption font-medium text-foreground", hideLabel && "sr-only")}
        >
          {label}
        </label>
      )}
      <div className="relative">
        {leadingIcon && (
          <span className="pointer-events-none absolute inset-y-0 left-3.5 flex items-center text-subtle [&_svg]:size-5">
            {leadingIcon}
          </span>
        )}
        <input
          ref={ref}
          id={inputId}
          aria-invalid={error ? true : undefined}
          aria-describedby={cn(errorId, hintId) || undefined}
          className={cn(
            "h-11 w-full rounded-control border bg-surface px-3.5 text-body text-foreground",
            "placeholder:text-subtle transition-colors duration-150",
            "focus:border-primary focus:outline-none focus:ring-3 focus:ring-primary/20",
            "disabled:cursor-not-allowed disabled:bg-surface-muted disabled:opacity-70",
            error ? "border-danger focus:border-danger focus:ring-danger/20" : "border-border",
            leadingIcon ? "pl-11" : null,
            className,
          )}
          {...props}
        />
      </div>
      {error ? (
        <p id={errorId} className="text-caption text-danger">
          {error}
        </p>
      ) : (
        hint && (
          <p id={hintId} className="text-caption text-muted">
            {hint}
          </p>
        )
      )}
    </div>
  );
});
