import type { ReactNode } from "react";
import { cn } from "@/lib/cn";

/**
 * Sahifa kontenti uchun umumiy konteyner: maksimal kenglik va responsive padding.
 *
 * Sarlavha: desktop'da h1 header ichida ko‘rsatiladi, shuning uchun bu yerda
 * h1 faqat mobile'da ko‘rinadi. `hideMobileTitle` — mobile'da ham faqat
 * ekran o‘quvchilar uchun (masalan, Dashboard).
 */
export function PageContainer({
  title,
  description,
  hideMobileTitle = false,
  actions,
  children,
  className,
}: {
  title: string;
  description?: string;
  hideMobileTitle?: boolean;
  actions?: ReactNode;
  children: ReactNode;
  className?: string;
}) {
  return (
    <div className={cn("mx-auto w-full max-w-[1440px] px-4 py-5 sm:px-6 md:py-6 xl:px-8 xl:py-8", className)}>
      <div className={cn("md:hidden", hideMobileTitle ? "sr-only" : "mb-5")}>
        <h1 className="text-title font-bold text-foreground">{title}</h1>
        {description && <p className="mt-1 text-caption text-muted">{description}</p>}
      </div>
      {(actions || description) && (
        <div className="mb-6 hidden items-center justify-between gap-4 md:flex">
          {description && <p className="text-body text-muted">{description}</p>}
          {actions}
        </div>
      )}
      {children}
    </div>
  );
}
