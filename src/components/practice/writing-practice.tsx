"use client";

import { useState } from "react";
import { cn } from "@/lib/cn";

/**
 * Yozish mashqi: belgilar hisoblagichi va namunaviy javobni ko‘rish.
 * Matn saqlanmaydi va baholanmaydi (avtomatik baholash yo‘q) — bu ochiq aytiladi.
 */
export function WritingPractice({
  taskId,
  minChars,
  maxChars,
  modelAnswer,
  commentary = null,
}: {
  taskId: string;
  minChars: number | null;
  maxChars: number | null;
  modelAnswer: string | null;
  commentary?: string | null;
}) {
  const [text, setText] = useState("");
  const [showModel, setShowModel] = useState(false);
  // TOPIK yozishida bo‘sh joylar ham belgi hisoblanadi (원고지)
  const count = [...text].length;
  const inRange = (minChars === null || count >= minChars) && (maxChars === null || count <= maxChars);
  const id = `writing-${taskId}`;

  return (
    <div className="mt-3 flex flex-col gap-2">
      <label htmlFor={id} className="text-caption font-medium text-foreground">
        Javobingiz (saqlanmaydi)
      </label>
      <textarea
        id={id}
        lang="ko"
        rows={6}
        value={text}
        onChange={(e) => setText(e.target.value)}
        className="w-full rounded-control border border-border bg-surface p-3 text-body text-foreground focus:border-primary focus:ring-3 focus:ring-primary/20 focus:outline-none"
      />
      <p aria-live="polite" className={cn("text-caption tabular-nums", count === 0 ? "text-muted" : inRange ? "text-success" : "text-warning")}>
        {count} belgi
        {minChars !== null && maxChars !== null && ` (talab: ${minChars}–${maxChars})`}
      </p>
      {modelAnswer && (
        <div>
          <button type="button" onClick={() => setShowModel((v) => !v)} aria-expanded={showModel} className="text-caption font-semibold text-primary hover:underline">
            {showModel ? "Namunaviy javobni yashirish" : "Namunaviy javobni ko‘rish"}
          </button>
          {showModel && (
            <div className="mt-2 flex flex-col gap-2">
              <p lang="ko" className="rounded-control bg-surface-muted p-3 text-body whitespace-pre-line text-foreground">
                {modelAnswer}
              </p>
              <p className="text-caption text-muted tabular-nums">Namunaviy javob: {[...modelAnswer].length} belgi</p>
              {commentary && <p className="text-caption text-foreground">{commentary}</p>}
            </div>
          )}
        </div>
      )}
    </div>
  );
}
