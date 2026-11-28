"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { primaryNav, isActivePath, type NavItem } from "@/config/navigation";
import { siteConfig } from "@/config/site";
import { buttonClasses } from "@/components/ui/button";
import { ArrowRightIcon, CrownIcon } from "@/components/ui/icons";
import { Logo } from "@/components/ui/logo";
import { cn } from "@/lib/cn";

/**
 * Desktop navigatsiya.
 *  - ≥1280px (xl): to‘liq sidebar (ikonka + nom)
 *  - 768–1279px (md): ixcham rail (faqat ikonka, nom ekran o‘quvchilar uchun saqlanadi)
 *  - <768px: yashirin (o‘rniga BottomNav)
 */
export function Sidebar({ items = primaryNav }: { items?: NavItem[] }) {
  const pathname = usePathname();

  return (
    <aside
      aria-label="Asosiy navigatsiya"
      className="sticky top-0 hidden h-dvh shrink-0 flex-col border-r border-border bg-surface md:flex md:w-20 xl:w-64"
    >
      <div className="flex h-18 shrink-0 items-center justify-center px-4 xl:justify-start xl:px-6">
        <Link href="/dashboard" className="rounded-control" aria-label={`${siteConfig.name} — bosh sahifa`}>
          {/* Ko‘rinish klassi o‘ramda: Logo ichidagi inline-flex uni bosib ketmasligi uchun */}
          <span className="hidden xl:block">
            <Logo />
          </span>
          <span className="block xl:hidden">
            <Logo compact />
          </span>
        </Link>
      </div>

      <nav className="flex-1 overflow-y-auto px-3 py-3 xl:px-4">
        <ul className="flex flex-col gap-1">
          {items.map((item) => (
            <li key={item.href}>
              <SidebarLink item={item} active={isActivePath(pathname, item.href)} />
            </li>
          ))}
        </ul>
      </nav>

      <div className="hidden p-4 xl:block">
        <SidebarGoalCard />
      </div>
    </aside>
  );
}

function SidebarLink({ item, active }: { item: NavItem; active: boolean }) {
  return (
    <Link
      href={item.href}
      aria-current={active ? "page" : undefined}
      title={item.label}
      className={cn(
        "group flex h-11 items-center gap-3 rounded-control px-3 text-body font-medium transition-colors duration-150",
        "justify-center xl:justify-start",
        active
          ? "bg-primary text-primary-foreground shadow-card"
          : "text-muted hover:bg-surface-muted hover:text-foreground",
      )}
    >
      <span className="shrink-0 [&_svg]:size-5">{item.icon}</span>
      <span className="sr-only truncate xl:not-sr-only">{item.label}</span>
    </Link>
  );
}

/** Sidebar pastidagi maqsad kartasi. Foydalanuvchi ma’lumoti emas — umumiy maqsad. */
function SidebarGoalCard() {
  return (
    <div className="rounded-card border border-border bg-primary-soft/60 p-4">
      <CrownIcon className="size-6 text-grammar" />
      <p className="mt-2 text-heading font-bold text-foreground">{siteConfig.exam.name}</p>
      <p className="text-caption text-muted">
        <span className="ko">{siteConfig.exam.defaultTargetLevel}급</span> ga tayyorlaning
      </p>
      <Link
        href="/plan"
        className={buttonClasses({ size: "sm", fullWidth: true, className: "mt-3 justify-between" })}
      >
        45 kunlik reja <ArrowRightIcon />
      </Link>
    </div>
  );
}
