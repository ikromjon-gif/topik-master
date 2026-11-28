"use client";

import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { CheckIcon, XIcon } from "@/components/ui/icons";
import type { PracticeQuestion } from "@/lib/content/queries";
import { submitPractice, type PracticeResult } from "@/lib/learning/practice";
import { cn } from "@/lib/cn";

const CIRCLED = ["①", "②", "③", "④"];

/**
 * Mashq: savollar ro‘yxati, javob tanlash, serverda baholash.
 * To‘g‘ri javob va izoh faqat yuborilgandan keyin ko‘rinadi.
 */
export function PracticeSession({
  section,
  questions,
  audioUrls,
}: {
  section: "listening" | "reading";
  questions: PracticeQuestion[];
  audioUrls?: Record<string, string>;
}) {
  const [result, action, pending] = useActionState<PracticeResult | null, FormData>(submitPractice, null);
  const graded = result?.ok ? new Map(result.items.map((i) => [i.questionId, i])) : null;

  return (
    <form action={action} className="flex flex-col gap-4">
      <input type="hidden" name="section" value={section} />
      {result?.ok && (
        <Card role="status" className="flex flex-wrap items-center justify-between gap-3 bg-primary-soft">
          <p className="text-heading font-bold text-foreground">
            Natija: {result.correct} / {result.total} to‘g‘ri · {result.score} / {result.maxScore} ball
          </p>
          <p className="text-caption text-muted">Natija statistikada saqlandi.</p>
        </Card>
      )}
      {result && !result.ok && (
        <p role="alert" className="rounded-control bg-danger-soft px-3 py-2 text-caption text-danger">
          {result.error}
        </p>
      )}

      {questions.map((q, idx) => {
        const g = graded?.get(q.id);
        return (
          <Card key={q.id} className={cn(g && (g.isCorrect ? "border-success" : "border-danger"))}>
            <input type="hidden" name="questionId" value={q.id} />
            <fieldset disabled={Boolean(graded)}>
              <legend className="mb-3 text-body font-semibold text-foreground">
                <span className="mr-2 text-muted tabular-nums">{q.number_slot ?? idx + 1}.</span>
                <span lang="ko">{q.stem_ko}</span>
                <span className="ml-2 text-caption font-normal text-muted">({q.points} ball)</span>
              </legend>
              {section === "listening" && audioUrls?.[q.id] && (
                <audio controls preload="none" src={audioUrls[q.id]} className="mb-3 w-full">
                  Brauzeringiz audio pleerni qo‘llab-quvvatlamaydi.
                </audio>
              )}
              {section === "reading" && q.passage && (
                <p lang="ko" className="mb-3 rounded-control bg-surface-muted p-3 text-body whitespace-pre-line text-foreground">
                  {q.passage.body_ko}
                </p>
              )}
              {q.prompt_ko && (
                <p lang="ko" className="mb-3 text-body text-foreground">
                  {q.prompt_ko}
                </p>
              )}
              <div className="grid gap-2 sm:grid-cols-2">
                {q.options.map((o) => {
                  const isRight = g && o.label === g.correctLabel;
                  const isWrongPick = g && !g.isCorrect && o.label === g.chosen;
                  return (
                    <label
                      key={o.id}
                      className={cn(
                        "flex min-h-11 cursor-pointer items-center gap-3 rounded-control border px-3 py-2 text-body has-[:checked]:border-primary has-[:checked]:bg-primary-soft",
                        isRight && "border-success bg-success-soft",
                        isWrongPick && "border-danger bg-danger-soft",
                        !g && "border-border hover:bg-surface-muted",
                      )}
                    >
                      <input type="radio" name={`answer-${q.id}`} value={o.label} className="sr-only" />
                      <span aria-hidden="true" className="text-muted">
                        {CIRCLED[o.label - 1]}
                      </span>
                      <span lang="ko" className="flex-1">
                        {o.text_ko}
                      </span>
                      {isRight && <CheckIcon className="size-5 text-success" aria-label="To‘g‘ri javob" />}
                      {isWrongPick && <XIcon className="size-5 text-danger" aria-label="Sizning javobingiz (noto‘g‘ri)" />}
                    </label>
                  );
                })}
              </div>
            </fieldset>
            {g && (
              <div className="mt-3 rounded-control bg-surface-muted p-3 text-caption text-foreground">
                <p className="font-semibold">
                  {g.isCorrect ? "To‘g‘ri!" : g.chosen ? "Noto‘g‘ri." : "Javob berilmagan."} To‘g‘ri javob: {CIRCLED[g.correctLabel - 1]}
                </p>
                {g.explanation && <p className="mt-1 whitespace-pre-line text-muted">{g.explanation}</p>}
              </div>
            )}
          </Card>
        );
      })}

      {!graded && (
        <Button type="submit" loading={pending} className="self-start">
          Javoblarni tekshirish
        </Button>
      )}
    </form>
  );
}
