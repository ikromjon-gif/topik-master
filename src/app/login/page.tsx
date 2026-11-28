import type { Metadata } from "next";
import { Card } from "@/components/ui/card";
import { InfoIcon } from "@/components/ui/icons";
import { Logo } from "@/components/ui/logo";
import { ThemeToggle } from "@/components/theme/theme-toggle";
import { isSupabaseConfigured } from "@/lib/supabase/env";
import { LoginForm } from "./login-form";

export const metadata: Metadata = { title: "Kirish" };

export default async function LoginPage({
  searchParams,
}: {
  searchParams: Promise<{ next?: string; error?: string }>;
}) {
  const { next, error } = await searchParams;
  const configured = isSupabaseConfigured();

  return (
    <main id="main-content" className="flex min-h-dvh flex-col items-center justify-center gap-6 px-4 py-10">
      <div className="flex w-full max-w-sm items-center justify-between">
        <Logo />
        <ThemeToggle />
      </div>
      <Card className="w-full max-w-sm">
        <h1 className="text-title font-bold text-foreground">Xush kelibsiz</h1>
        <p className="mt-1 mb-5 text-caption text-muted">
          O‘quv rejangiz va natijalaringiz saqlanishi uchun tizimga kiring.
        </p>
        {!configured && (
          <p className="mb-4 flex gap-2 rounded-control bg-warning-soft px-3 py-2 text-caption text-warning">
            <InfoIcon className="mt-0.5 size-4 shrink-0" />
            Login hali sozlanmagan: Supabase kalitlari (.env.local) kiritilmagan.
          </p>
        )}
        {error === "callback" && (
          <p role="alert" className="mb-4 rounded-control bg-danger-soft px-3 py-2 text-caption text-danger">
            Tasdiqlash havolasi eskirgan yoki noto‘g‘ri. Qaytadan kiring.
          </p>
        )}
        <LoginForm next={next} disabled={!configured} />
      </Card>
    </main>
  );
}
