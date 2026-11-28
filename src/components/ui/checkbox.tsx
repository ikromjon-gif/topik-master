import { forwardRef, useId, type InputHTMLAttributes, type ReactNode } from "react";
import { cn } from "@/lib/cn";
import { CheckIcon } from "./icons";

export type CheckboxProps = Omit<InputHTMLAttributes<HTMLInputElement>, "type"> & {
  label?: ReactNode;
  description?: ReactNode;
};

/** Native checkbox asosida: klaviatura va ekran o‘quvchilar bilan to‘liq ishlaydi. */
export const Checkbox = forwardRef<HTMLInputElement, CheckboxProps>(function Checkbox(
  { label, description, id, className, disabled, ...props },
  ref,
) {
  const autoId = useId();
  const inputId = id ?? autoId;

  return (
    <label
      htmlFor={inputId}
      className={cn(
        "group inline-flex items-start gap-3",
        disabled ? "cursor-not-allowed opacity-60" : "cursor-pointer",
        className,
      )}
    >
      <span className="relative mt-0.5 inline-flex size-5 shrink-0">
        <input
          ref={ref}
          id={inputId}
          type="checkbox"
          disabled={disabled}
          className={cn(
            "peer size-5 appearance-none rounded-md border-2 border-border-strong bg-surface",
            "transition-colors duration-150 checked:border-success checked:bg-success",
            "focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-ring",
          )}
          {...props}
        />
        <CheckIcon
          className="pointer-events-none absolute inset-0 m-auto size-3.5 text-white opacity-0 peer-checked:opacity-100 dark:text-background"
          strokeWidth={3}
        />
      </span>
      {(label || description) && (
        <span className="min-w-0">
          {label && <span className="block text-body text-foreground">{label}</span>}
          {description && <span className="block text-caption text-muted">{description}</span>}
        </span>
      )}
    </label>
  );
});
