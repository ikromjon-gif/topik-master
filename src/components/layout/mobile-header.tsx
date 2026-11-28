import Link from "next/link";
import { siteConfig } from "@/config/site";
import { ThemeToggle } from "@/components/theme/theme-toggle";
import { IconLink } from "@/components/ui/icon-button";
import { BellIcon, SearchIcon } from "@/components/ui/icons";
import { Logo } from "@/components/ui/logo";
import { UserAvatarLink } from "./user-avatar-link";

/** Mobile (<768px) header: logotip va tezkor amallar. */
export function MobileHeader() {
  return (
    <header className="sticky top-0 z-30 flex h-16 shrink-0 items-center justify-between gap-2 border-b border-border bg-background/85 px-4 pt-[env(safe-area-inset-top)] backdrop-blur-md md:hidden">
      <Link href="/dashboard" className="rounded-control" aria-label={`${siteConfig.name} — bosh sahifa`}>
        <Logo showTagline={false} />
      </Link>
      <div className="flex items-center gap-1">
        <IconLink href="/search" label="Qidirish" variant="ghost" size="md">
          <SearchIcon />
        </IconLink>
        <IconLink href="/notifications" label="Bildirishnomalar" variant="ghost" size="md">
          <BellIcon />
        </IconLink>
        <ThemeToggle />
        <UserAvatarLink className="ml-1" />
      </div>
    </header>
  );
}
