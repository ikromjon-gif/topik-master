"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { activeMobileTab, mobileNav, type NavItem } from "@/config/navigation";
import { cn } from "@/lib/cn";

/** Mobile (<768px) pastki navigatsiya. iOS safe-area hisobga olingan. */
export function BottomNav({ items = mobileNav }: { items?: NavItem[] }) {
  const pathname = usePathname();
  const active = activeMobileTab(pathname);

  return (
    <nav
      aria-label="Pastki navigatsiya"
      className="fixed inset-x-0 bottom-0 z-40 border-t border-border bg-surface/95 pb-[env(safe-area-inset-bottom)] backdrop-blur-md md:hidden"
    >
      <ul className="mx-auto grid h-16 max-w-lg grid-cols-5">
        {items.map((item) => {
          const isActive = item.href === active;
          return (
            <li key={item.href}>
              <Link
                href={item.href}
                aria-current={isActive ? "page" : undefined}
                className={cn(
                  "flex h-full flex-col items-center justify-center gap-1 text-[0.6875rem] font-medium transition-colors duration-150",
                  isActive ? "text-primary" : "text-muted hover:text-foreground",
                )}
              >
                <span className="[&_svg]:size-6">{item.icon}</span>
                <span className="truncate">{item.label}</span>
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
