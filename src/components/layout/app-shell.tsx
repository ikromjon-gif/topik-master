import type { ReactNode } from "react";
import { BackendNotice } from "./backend-notice";
import { BottomNav } from "./bottom-nav";
import { DesktopHeader } from "./desktop-header";
import { MobileHeader } from "./mobile-header";
import { Sidebar } from "./sidebar";

/**
 * Ilovaning umumiy karkasi.
 *
 *   ≥1280px  [Sidebar 256px][Header + kontent]
 *   768–1279 [Rail 80px   ][Header + kontent]
 *   <768px   [MobileHeader][kontent][BottomNav]
 */
export function AppShell({ children }: { children: ReactNode }) {
  return (
    <div className="flex min-h-dvh bg-background">
      <a
        href="#main-content"
        className="sr-only z-50 rounded-control bg-primary px-4 py-2 font-semibold text-primary-foreground focus:not-sr-only focus:fixed focus:top-3 focus:left-3"
      >
        Asosiy kontentga o‘tish
      </a>

      <Sidebar />

      <div className="flex min-w-0 flex-1 flex-col">
        <MobileHeader />
        <DesktopHeader />
        <main
          id="main-content"
          tabIndex={-1}
          className="flex-1 pb-[calc(5rem+env(safe-area-inset-bottom))] outline-none md:pb-0"
        >
          <BackendNotice />
          {children}
        </main>
      </div>

      <BottomNav />
    </div>
  );
}
