"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { getLearningContext } from "./queries";

export type PracticeResult =
  | {
      ok: true;
      score: number;
      maxScore: number;
      correct: number;
      total: number;
      items: { questionId: string; chosen: number | null; correctLabel: number; isCorrect: boolean; explanation: string | null }[];
    }
  | { ok: false; error: string };

const schema = z.object({
  section: z.enum(["listening", "reading"]),
  questionIds: z.array(z.string().uuid()).min(1).max(50),
});

/**
 * Mashq javoblarini serverda baholaydi va natijani saqlaydi (test_attempts +
 * attempt_answers). To‘g‘ri javoblar brauzerga oldindan yuborilmaydi.
 */
export async function submitPractice(_prev: PracticeResult | null, formData: FormData): Promise<PracticeResult> {
  const parsed = schema.safeParse({
    section: formData.get("section"),
    questionIds: formData.getAll("questionId"),
  });
  if (!parsed.success) return { ok: false, error: "Javoblar noto‘g‘ri yuborildi." };
  const ctx = await getLearningContext();
  if (ctx.state !== "signed-in") return { ok: false, error: "Natijani saqlash uchun tizimga kiring." };

  const { section, questionIds } = parsed.data;
  const [{ data: questions }, { data: options }, { data: explanations }] = await Promise.all([
    ctx.supabase.from("questions").select("id, points").in("id", questionIds),
    ctx.supabase.from("question_options").select("question_id, label, is_correct").in("question_id", questionIds),
    ctx.supabase.from("explanations").select("question_id, body_md").is("option_id", null).eq("locale", "uz").in("question_id", questionIds),
  ]);
  const qs = (questions ?? []) as { id: string; points: number }[];
  if (qs.length !== questionIds.length) return { ok: false, error: "Ba’zi savollar topilmadi." };

  const correctLabel = new Map<string, number>();
  for (const o of (options ?? []) as { question_id: string; label: number; is_correct: boolean }[]) if (o.is_correct) correctLabel.set(o.question_id, o.label);
  const explMap = new Map(((explanations ?? []) as { question_id: string; body_md: string }[]).map((e) => [e.question_id, e.body_md]));

  const items = questionIds.map((id) => {
    const raw = formData.get(`answer-${id}`);
    const chosen = raw ? Number(raw) : null;
    const right = correctLabel.get(id) ?? -1;
    return { questionId: id, chosen: chosen && chosen >= 1 && chosen <= 4 ? chosen : null, correctLabel: right, isCorrect: chosen === right, explanation: explMap.get(id) ?? null };
  });
  const pointsBy = new Map(qs.map((q) => [q.id, q.points]));
  const maxScore = items.reduce((s, i) => s + (pointsBy.get(i.questionId) ?? 0), 0);
  const score = items.reduce((s, i) => s + (i.isCorrect ? (pointsBy.get(i.questionId) ?? 0) : 0), 0);

  const { data: attempt, error } = await ctx.supabase
    .from("test_attempts")
    .insert({
      user_id: ctx.userId,
      section,
      title: section === "listening" ? "Tinglash mashqi" : "O‘qish mashqi",
      score,
      max_score: maxScore,
      taken_on: ctx.today,
    })
    .select("id")
    .single();
  if (error || !attempt) return { ok: false, error: "Natijani saqlab bo‘lmadi." };

  await ctx.supabase.from("attempt_answers").insert(
    items.map((i) => ({ attempt_id: attempt.id, user_id: ctx.userId, question_id: i.questionId, chosen_label: i.chosen, is_correct: i.isCorrect })),
  );
  revalidatePath("/dashboard");
  revalidatePath("/stats");
  revalidatePath("/mistakes");

  return { ok: true, score, maxScore, correct: items.filter((i) => i.isCorrect).length, total: items.length, items };
}
