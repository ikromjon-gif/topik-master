"use client";

import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { startPlan, type ActionResult } from "@/lib/learning/actions";

export function StartPlanForm({
  templates,
  today,
  defaultLevel,
}: {
  templates: { id: string; title: string; total_days: number }[];
  today: string;
  defaultLevel: number;
}) {
  const [state, action, pending] = useActionState<ActionResult | null, FormData>(startPlan, null);

  return (
    <form action={action} className="grid gap-4 sm:grid-cols-3 sm:items-end">
      {templates.length > 1 ? (
        <label className="flex flex-col gap-1.5 text-caption font-medium">
          Reja
          <select
            name="templateId"
            className="h-11 rounded-control border border-border bg-surface px-3 text-body text-foreground"
          >
            {templates.map((t) => (
              <option key={t.id} value={t.id}>
                {t.title} ({t.total_days} kun)
              </option>
            ))}
          </select>
        </label>
      ) : (
        <input type="hidden" name="templateId" value={templates[0]?.id} />
      )}
      <Input label="Boshlanish sanasi" type="date" name="startDate" defaultValue={today} required />
      <label className="flex flex-col gap-1.5 text-caption font-medium text-foreground">
        Maqsad daraja
        <select
          name="targetLevel"
          defaultValue={defaultLevel}
          className="h-11 rounded-control border border-border bg-surface px-3 text-body text-foreground"
        >
          {[3, 4, 5, 6].map((l) => (
            <option key={l} value={l}>
              {l}급
            </option>
          ))}
        </select>
      </label>
      <Button type="submit" loading={pending} className="sm:col-span-3 sm:justify-self-start">
        Rejani boshlash
      </Button>
      {state && !state.ok && (
        <p role="alert" className="text-caption text-danger sm:col-span-3">
          {state.error}
        </p>
      )}
    </form>
  );
}
