import Link from "next/link";
import type { ReactNode } from "react";
import { buttonClasses } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";

/** Ma'lumotlar bazasi ulanmagan yoki foydalanuvchi kirmagan holat uchun umumiy karta. */
export function AccessNotice({
  state,
  icon,
  next,
  what = "Bu bo‘lim",
}: {
  state: "not-configured" | "signed-out";
  icon: ReactNode;
  next: string;
  what?: string;
}) {
  return (
    <Card>
      <EmptyState
        icon={icon}
        title={state === "not-configured" ? `${what} uchun ma’lumotlar bazasi kerak` : "Davom etish uchun tizimga kiring"}
        description={
          state === "not-configured"
            ? "Supabase ulanganidan keyin kontent va natijalar shu yerda ko‘rinadi."
            : "Kontent va natijalaringiz hisobingizga bog‘langan."
        }
        action={
          state === "signed-out" ? (
            <Link href={`/login?next=${encodeURIComponent(next)}`} className={buttonClasses({ size: "sm" })}>
              Kirish
            </Link>
          ) : undefined
        }
      />
    </Card>
  );
}
