"use server";

import { headers } from "next/headers";
import { redirect } from "next/navigation";
import { z } from "zod";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export type AuthState = { error?: string; message?: string } | null;

const schema = z.object({
  email: z.string().trim().email(),
  password: z.string().min(8),
  next: z.string().optional(),
});

/** Faqat ichki yo‘llarga qaytarish (ochiq redirect'ning oldini olish). */
function safeNext(next?: string) {
  return next && next.startsWith("/") && !next.startsWith("//") ? next : "/dashboard";
}

export async function signIn(_prev: AuthState, formData: FormData): Promise<AuthState> {
  const parsed = schema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: "Email yoki parol noto‘g‘ri formatda (parol kamida 8 belgi)." };
  const supabase = await createSupabaseServerClient();
  if (!supabase) return { error: "Login hali sozlanmagan." };

  const { error } = await supabase.auth.signInWithPassword({
    email: parsed.data.email,
    password: parsed.data.password,
  });
  if (error) return { error: "Email yoki parol noto‘g‘ri." };
  redirect(safeNext(parsed.data.next));
}

export async function signUp(_prev: AuthState, formData: FormData): Promise<AuthState> {
  const parsed = schema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { error: "Email yoki parol noto‘g‘ri formatda (parol kamida 8 belgi)." };
  const supabase = await createSupabaseServerClient();
  if (!supabase) return { error: "Login hali sozlanmagan." };

  const h = await headers();
  const origin = h.get("origin") ?? `https://${h.get("host")}`;
  const { data, error } = await supabase.auth.signUp({
    email: parsed.data.email,
    password: parsed.data.password,
    options: { emailRedirectTo: `${origin}/auth/callback?next=${encodeURIComponent(safeNext(parsed.data.next))}` },
  });
  if (error) return { error: "Ro‘yxatdan o‘tib bo‘lmadi. Boshqa email bilan urinib ko‘ring." };
  if (data.session) redirect(safeNext(parsed.data.next));
  return { message: "Emailingizga tasdiqlash havolasi yuborildi. Havolani bosib, keyin tizimga kiring." };
}
