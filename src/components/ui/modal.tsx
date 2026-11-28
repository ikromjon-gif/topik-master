"use client";

import { useEffect, useId, useRef, type ReactNode } from "react";
import { cn } from "@/lib/cn";
import { IconButton } from "./icon-button";
import { XIcon } from "./icons";

/**
 * Native <dialog> asosidagi modal: fokusni ushlab turish, ESC bilan yopish
 * va fonni bloklash brauzer tomonidan ta’minlanadi.
 * Mobile’da pastdan chiqadigan sheet, desktop’da markazda.
 */
export function Modal({
  open,
  onClose,
  title,
  description,
  children,
  footer,
  className,
}: {
  open: boolean;
  onClose: () => void;
  title: string;
  description?: string;
  children?: ReactNode;
  footer?: ReactNode;
  className?: string;
}) {
  const ref = useRef<HTMLDialogElement>(null);
  const titleId = useId();
  const descId = useId();

  useEffect(() => {
    const dialog = ref.current;
    if (!dialog) return;
    if (open && !dialog.open) dialog.showModal();
    if (!open && dialog.open) dialog.close();
  }, [open]);

  return (
    <dialog
      ref={ref}
      aria-labelledby={titleId}
      aria-describedby={description ? descId : undefined}
      onClose={onClose}
      onCancel={(event) => {
        event.preventDefault();
        onClose();
      }}
      onClick={(event) => {
        // Fon (backdrop) bosilganda yopish
        if (event.target === event.currentTarget) onClose();
      }}
      className={cn(
        "m-0 mt-auto w-full max-w-none rounded-t-panel border border-border bg-surface p-0 text-foreground shadow-raised",
        "sm:m-auto sm:max-w-lg sm:rounded-panel",
        className,
      )}
    >
      <div className="flex max-h-[85dvh] flex-col">
        <div className="flex items-start justify-between gap-4 px-5 pt-5 sm:px-6 sm:pt-6">
          <div>
            <h2 id={titleId} className="text-heading font-semibold">
              {title}
            </h2>
            {description && (
              <p id={descId} className="mt-1 text-caption text-muted">
                {description}
              </p>
            )}
          </div>
          <IconButton label="Yopish" size="sm" onClick={onClose} className="-mt-1 -mr-1">
            <XIcon />
          </IconButton>
        </div>
        {children && <div className="overflow-y-auto px-5 py-4 sm:px-6">{children}</div>}
        {footer && (
          <div className="flex flex-col-reverse gap-2 border-t border-border px-5 py-4 sm:flex-row sm:justify-end sm:px-6">
            {footer}
          </div>
        )}
      </div>
    </dialog>
  );
}
