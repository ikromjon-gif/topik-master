import { createServerClient } from "@supabase/ssr";
import type { SupabaseClient, User } from "@supabase/supabase-js";
import { cookies } from "next/headers";
import { getSupabaseEnv } from "./env";

/**
 * Server komponentlari, server action'lar va route handler'lar uchun client.
 * Supabase sozlanmagan bo‘lsa null qaytaradi.
 */
export async function createSupabaseServerClient(): Promise<SupabaseClient | null> {
  const env = getSupabaseEnv();
  if (!env) return null;
  const cookieStore = await cookies();

  return createServerClient(env.url, env.anonKey, {
    cookies: {
      getAll() {
        return cookieStore.getAll();
      },
      setAll(cookiesToSet) {
        try {
          for (const { name, value, options } of cookiesToSet) cookieStore.set(name, value, options);
        } catch {
          // Server komponentida cookie yozib bo‘lmaydi — sessiyani middleware yangilaydi.
        }
      },
    },
  });
}

/** Joriy foydalanuvchi (server tomonda tekshirilgan). */
export async function getCurrentUser(): Promise<{ supabase: SupabaseClient; user: User } | null> {
  const supabase = await createSupabaseServerClient();
  if (!supabase) return null;
  const { data, error } = await supabase.auth.getUser();
  if (error || !data.user) return null;
  return { supabase, user: data.user };
}
