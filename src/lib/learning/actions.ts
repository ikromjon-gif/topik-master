"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { getActivePlan, getLearningContext } from "./queries";

export type ActionResult = { ok: true } | { ok: false; error: string };

function refresh() {
  revalidatePath("/dashboard");
  revalidatePath("/plan");
  revalidatePath("/stats");
}

const startPlanSchema = z.object({
  templateId: z.string().uuid(),
  startDate: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
  targetLevel: z.coerce.number().int().min(3).max(6),
});

/** 45 kunlik rejani boshlash. */
export async function startPlan(_prev: ActionResult | null, formData: FormData): Promise<ActionResult> {
  const parsed = startPlanSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { ok: false, error: "Ma’lumotlar noto‘g‘ri kiritildi." };
  const ctx = await getLearningContext();
  if (ctx.state !== "signed-in") return { ok: false, error: "Avval tizimga kiring." };

  const { templateId, startDate, targetLevel } = parsed.data;
  // Boshlanish sanasi bugundan 30 kundan ortiq oldin yoki keyin bo‘lmasin
  const diff = (Date.parse(startDate) - Date.parse(ctx.today)) / 86_400_000;
  if (Math.abs(diff) > 30) return { ok: false, error: "Boshlanish sanasi bugundan ±30 kun ichida bo‘lishi kerak." };

  const { error } = await ctx.supabase.from("user_plans").insert({
    user_id: ctx.userId,
    template_id: templateId,
    start_date: startDate,
    target_level: targetLevel,
  });
  if (error) {
    return {
      ok: false,
      error: error.message.includes("one_active")
        ? "Sizda allaqachon faol reja bor."
        : "Rejani boshlab bo‘lmadi. Shablon hali nashr qilinmagan bo‘lishi mumkin.",
    };
  }
  refresh();
  return { ok: true };
}

/** Faol rejani bekor qilish (ma'lumotlar o‘chirilmaydi, status = abandoned). */
export async function abandonPlan(): Promise<void> {
  const ctx = await getLearningContext();
  if (ctx.state !== "signed-in") return;
  await ctx.supabase.from("user_plans").update({ status: "abandoned" }).eq("user_id", ctx.userId).eq("status", "active");
  refresh();
}

const toggleSchema = z.object({
  taskId: z.string().uuid(),
  done: z.enum(["true", "false"]),
});

/** Bugungi topshiriqni bajarilgan / bajarilmagan deb belgilash. */
export async function toggleTask(formData: FormData): Promise<void> {
  const parsed = toggleSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return;
  const ctx = await getLearningContext();
  if (ctx.state !== "signed-in") return;
  const plan = await getActivePlan(ctx.supabase, ctx.userId);
  if (!plan) return;

  if (parsed.data.done === "true") {
    await ctx.supabase.from("user_task_completions").upsert(
      {
        user_id: ctx.userId,
        user_plan_id: plan.id,
        template_task_id: parsed.data.taskId,
        completed_on: ctx.today,
      },
      { onConflict: "user_plan_id,template_task_id", ignoreDuplicates: true },
    );
  } else {
    await ctx.supabase
      .from("user_task_completions")
      .delete()
      .eq("user_plan_id", plan.id)
      .eq("template_task_id", parsed.data.taskId);
  }
  refresh();
}

const profileSchema = z.object({
  displayName: z.string().trim().max(60).optional(),
  targetLevel: z.coerce.number().int().min(3).max(6),
});

export async function updateProfile(_prev: ActionResult | null, formData: FormData): Promise<ActionResult> {
  const parsed = profileSchema.safeParse(Object.fromEntries(formData));
  if (!parsed.success) return { ok: false, error: "Ma’lumotlar noto‘g‘ri kiritildi." };
  const ctx = await getLearningContext();
  if (ctx.state !== "signed-in") return { ok: false, error: "Avval tizimga kiring." };
  const { error } = await ctx.supabase
    .from("profiles")
    .update({ display_name: parsed.data.displayName || null, target_level: parsed.data.targetLevel })
    .eq("id", ctx.userId);
  if (error) return { ok: false, error: "Saqlab bo‘lmadi." };
  revalidatePath("/profile");
  refresh();
  return { ok: true };
}

export async function signOut(): Promise<void> {
  const ctx = await getLearningContext();
  if (ctx.state === "signed-in") await ctx.supabase.auth.signOut();
  redirect("/login");
}
