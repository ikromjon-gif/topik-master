import Link from "next/link";
import { siteConfig } from "@/config/site";
import { Badge } from "@/components/ui/badge";
import { buttonClasses } from "@/components/ui/button";
import { ArrowRightIcon, PlayCircleIcon } from "@/components/ui/icons";
import { cn } from "@/lib/cn";

/**
 * Asosiy banner. Raqamli statistika ko‘rsatmaydi — faqat maqsad va harakat.
 * Tugma matni reja holatiga bog‘liq.
 */
export function HeroBanner({
  targetLevel,
  totalDays,
  planStarted,
  className,
}: {
  targetLevel: number;
  totalDays: number;
  planStarted: boolean;
  className?: string;
}) {
  return (
    <section
      aria-labelledby="hero-title"
      className={cn(
        "relative isolate overflow-hidden rounded-panel border border-border",
        "bg-gradient-to-br from-primary-soft via-surface to-surface",
        className,
      )}
    >
      <HeroIllustration className="pointer-events-none absolute right-0 bottom-0 -z-10 h-full w-[62%] max-w-[460px] opacity-40 sm:w-[55%] sm:opacity-90" />
      <div className="relative max-w-[34rem] p-5 sm:p-7 xl:p-8">
        <Badge tone="primary" className="mb-3">
          {siteConfig.exam.name}
        </Badge>
        <h2 id="hero-title" className="text-title font-extrabold text-foreground sm:text-display">
          {totalDays} kunda <span className="ko text-primary">{targetLevel}급</span> ga tayyorlaning!
        </h2>
        <p className="mt-2 text-caption text-muted sm:text-body">
          Rejali o‘qish · Amaliy testlar · Natija tahlili
        </p>
        <Link href="/plan" className={buttonClasses({ className: "mt-5" })}>
          {planStarted ? (
            <>
              Bugungi darsni boshlash <ArrowRightIcon />
            </>
          ) : (
            <>
              <PlayCircleIcon /> Rejani boshlash
            </>
          )}
        </Link>
      </div>
    </section>
  );
}

/** Original, dekorativ illyustratsiya: tog‘lar, an’anaviy ayvon va minora siluetlari. */
function HeroIllustration({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 460 260" preserveAspectRatio="xMaxYMax meet" aria-hidden="true" className={className}>
      <defs>
        <linearGradient id="hero-sky" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0" stopColor="var(--primary)" stopOpacity="0.10" />
          <stop offset="1" stopColor="var(--primary)" stopOpacity="0.02" />
        </linearGradient>
        <linearGradient id="hero-mtn" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0" stopColor="var(--primary)" stopOpacity="0.28" />
          <stop offset="1" stopColor="var(--primary)" stopOpacity="0.06" />
        </linearGradient>
      </defs>
      <circle cx="380" cy="70" r="34" fill="var(--accent-grammar)" opacity="0.18" />
      {/* uzoq tog‘lar */}
      <path d="M0 220 L70 160 L120 190 L190 120 L260 185 L320 140 L400 195 L460 165 L460 260 L0 260Z" fill="url(#hero-mtn)" />
      {/* minora */}
      <g fill="var(--primary)" opacity="0.55">
        <rect x="372" y="78" width="4" height="40" rx="2" />
        <rect x="362" y="114" width="24" height="10" rx="3" />
        <rect x="366" y="124" width="16" height="6" rx="2" />
        <rect x="370" y="130" width="8" height="60" rx="2" />
      </g>
      {/* ayvon (hanok uslubidagi tom) */}
      <g>
        <path d="M150 168 Q230 140 310 168 Q300 160 296 150 Q230 128 164 150 Q160 160 150 168Z" fill="var(--primary)" opacity="0.85" />
        <path d="M176 150 Q230 118 284 150 Q230 136 176 150Z" fill="var(--primary)" opacity="0.65" />
        <rect x="170" y="168" width="120" height="8" rx="2" fill="var(--danger)" opacity="0.55" />
        <g fill="var(--primary)" opacity="0.7">
          <rect x="178" y="176" width="6" height="40" />
          <rect x="206" y="176" width="6" height="40" />
          <rect x="248" y="176" width="6" height="40" />
          <rect x="276" y="176" width="6" height="40" />
        </g>
        <rect x="160" y="214" width="140" height="8" rx="2" fill="var(--primary)" opacity="0.5" />
        <rect x="150" y="222" width="160" height="8" rx="2" fill="var(--primary)" opacity="0.35" />
      </g>
      {/* gullar (dekor) */}
      <g fill="var(--accent-writing)" opacity="0.35">
        <circle cx="330" cy="200" r="16" />
        <circle cx="350" cy="188" r="12" />
        <circle cx="122" cy="206" r="12" />
        <circle cx="106" cy="196" r="9" />
      </g>
      <rect x="0" y="0" width="460" height="260" fill="url(#hero-sky)" />
    </svg>
  );
}
