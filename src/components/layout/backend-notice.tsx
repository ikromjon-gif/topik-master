import { InfoIcon } from "@/components/ui/icons";
import { isSupabaseConfigured } from "@/lib/supabase/env";

/**
 * Supabase kalitlari kiritilmagan muhitda (lokal ishlab chiqish, preview)
 * ko‘rinadigan ogohlantirish. Production'da kalitlar bo‘lgani uchun chiqmaydi.
 */
export function BackendNotice() {
  if (isSupabaseConfigured()) return null;
  return (
    <div className="border-b border-warning/30 bg-warning-soft px-4 py-2 text-caption text-warning sm:px-6 xl:px-8">
      <p className="mx-auto flex max-w-[1440px] items-center gap-2">
        <InfoIcon className="size-4 shrink-0" />
        Ma’lumotlar bazasi ulanmagan: login va natijalarni saqlash o‘chiq. Supabase kalitlarini .env.local faylida
        sozlang.
      </p>
    </div>
  );
}
