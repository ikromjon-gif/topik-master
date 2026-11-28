"use client";

import { usePathname } from "next/navigation";
import { findRoute } from "@/config/navigation";
import { ThemeToggle } from "@/components/theme/theme-toggle";
import { IconLink } from "@/components/ui/icon-button";
import { BellIcon } from "@/components/ui/icons";
import { SearchField } from "./search-field";
import { UserAvatarLink } from "./user-avatar-link";

/**
 * Tablet va desktop (≥768px) header: sahifa sarlavhasi (h1), qidiruv,
 * bildirishnomalar, tema va profil.
 */
export function DesktopHeader() {
  const pathname = usePathname();
  const route = findRoute(pathname);
  const title = route?.title ?? route?.label ?? "";

  return (
    <header className="sticky top-0 z-30 hidden h-18 shrink-0 items-center gap-4 border-b border-border bg-background/85 px-6 backdrop-blur-md md:flex xl:px-8">
      <h1 className="min-w-0 flex-1 truncate text-title font-bold text-foreground">{title}</h1>
      <SearchField className="w-full max-w-xs lg:max-w-sm" />
      <div className="flex items-center gap-2">
        <IconLink href="/notifications" label="Bildirishnomalar" variant="ghost">
          <BellIcon />
        </IconLink>
        <ThemeToggle />
        <UserAvatarLink />
      </div>
    </header>
  );
}
