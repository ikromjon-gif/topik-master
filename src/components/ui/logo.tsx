import { siteConfig } from "@/config/site";
import { cn } from "@/lib/cn";

/**
 * Vaqtinchalik logotip: "S" belgisi va nom. Yakuniy logotip
 * dizayn tayyor bo‘lganda shu komponentda almashtiriladi.
 */
export function Logo({
  compact = false,
  showTagline = true,
  className,
}: {
  compact?: boolean;
  /** Nom ostidagi qisqa tavsif (tor ekranlarda o‘chiriladi). */
  showTagline?: boolean;
  className?: string;
}) {
  return (
    <span className={cn("inline-flex items-center gap-2.5", className)}>
      <span
        aria-hidden="true"
        className="grid size-9 place-items-center rounded-control bg-primary text-[1.05rem] font-extrabold text-primary-foreground"
      >
        S
      </span>
      {!compact && (
        <span className="flex flex-col leading-none">
          <span className="text-[1.15rem] font-extrabold tracking-tight text-foreground">
            {siteConfig.name}
          </span>
          {showTagline && (
            <span className="mt-1 text-[0.6875rem] font-medium whitespace-nowrap text-muted">{siteConfig.tagline}</span>
          )}
        </span>
      )}
      {compact && <span className="sr-only">{siteConfig.name}</span>}
    </span>
  );
}
