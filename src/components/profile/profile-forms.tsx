"use client";

import { useActionState } from "react";
import { useTheme, type ThemePreference } from "@/components/theme/theme-provider";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { updateProfile, type ActionResult } from "@/lib/learning/actions";
import { cn } from "@/lib/cn";

export function ProfileForm({ displayName, targetLevel }: { displayName: string | null; targetLevel: number }) {
  const [state, action, pending] = useActionState<ActionResult | null, FormData>(updateProfile, null);
  return (
    <form action={action} className="flex flex-col gap-4">
      <Input label="Ism" name="displayName" defaultValue={displayName ?? ""} maxLength={60} autoComplete="name" />
      <label className="flex flex-col gap-1.5 text-caption font-medium text-foreground">
        Maqsad daraja
        <select
          name="targetLevel"
          defaultValue={targetLevel}
          className="h-11 rounded-control border border-border bg-surface px-3 text-body text-foreground"
        >
          {[3, 4, 5, 6].map((l) => (
            <option key={l} value={l}>
              {l}급
            </option>
          ))}
        </select>
      </label>
      <div className="flex items-center gap-3">
        <Button type="submit" loading={pending}>
          Saqlash
        </Button>
        {state?.ok && (
          <p role="status" className="text-caption text-success">
            Saqlandi.
          </p>
        )}
        {state && !state.ok && (
          <p role="alert" className="text-caption text-danger">
            {state.error}
          </p>
        )}
      </div>
    </form>
  );
}

const THEMES: [ThemePreference, string][] = [
  ["light", "Yorug‘"],
  ["dark", "Qorong‘i"],
  ["system", "Tizim"],
];

export function ThemeSelector() {
  const { preference, setPreference } = useTheme();
  return (
    <div role="radiogroup" aria-label="Mavzu (tema)" className="grid grid-cols-3 gap-2">
      {THEMES.map(([value, label]) => (
        <button
          key={value}
          type="button"
          role="radio"
          aria-checked={preference === value}
          onClick={() => setPreference(value)}
          className={cn(
            "h-11 rounded-control border text-caption font-semibold transition-colors",
            preference === value ? "border-primary bg-primary-soft text-primary-soft-foreground" : "border-border bg-surface text-muted hover:text-foreground",
          )}
        >
          {label}
        </button>
      ))}
    </div>
  );
}
