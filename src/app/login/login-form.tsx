"use client";

import { useActionState, useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { cn } from "@/lib/cn";
import { signIn, signUp, type AuthState } from "./actions";

export function LoginForm({ next, disabled }: { next?: string; disabled: boolean }) {
  const [mode, setMode] = useState<"in" | "up">("in");
  const [inState, inAction, inPending] = useActionState<AuthState, FormData>(signIn, null);
  const [upState, upAction, upPending] = useActionState<AuthState, FormData>(signUp, null);
  const state = mode === "in" ? inState : upState;
  const pending = inPending || upPending;

  return (
    <div>
      <div role="tablist" aria-label="Kirish yoki ro‘yxatdan o‘tish" className="mb-5 grid grid-cols-2 gap-1 rounded-control bg-surface-muted p-1">
        {(
          [
            ["in", "Kirish"],
            ["up", "Ro‘yxatdan o‘tish"],
          ] as const
        ).map(([key, label]) => (
          <button
            key={key}
            type="button"
            role="tab"
            aria-selected={mode === key}
            onClick={() => setMode(key)}
            className={cn(
              "h-10 rounded-[0.6rem] text-caption font-semibold transition-colors",
              mode === key ? "bg-surface text-foreground shadow-card" : "text-muted hover:text-foreground",
            )}
          >
            {label}
          </button>
        ))}
      </div>

      <form action={mode === "in" ? inAction : upAction} className="flex flex-col gap-4">
        <input type="hidden" name="next" value={next ?? ""} />
        <Input label="Email" name="email" type="email" autoComplete="email" required disabled={disabled} />
        <Input
          label="Parol"
          name="password"
          type="password"
          autoComplete={mode === "in" ? "current-password" : "new-password"}
          minLength={8}
          required
          hint={mode === "up" ? "Kamida 8 belgi." : undefined}
          disabled={disabled}
        />
        {state?.error && (
          <p role="alert" className="rounded-control bg-danger-soft px-3 py-2 text-caption text-danger">
            {state.error}
          </p>
        )}
        {state?.message && (
          <p role="status" className="rounded-control bg-success-soft px-3 py-2 text-caption text-success">
            {state.message}
          </p>
        )}
        <Button type="submit" fullWidth loading={pending} disabled={disabled}>
          {mode === "in" ? "Kirish" : "Ro‘yxatdan o‘tish"}
        </Button>
      </form>
    </div>
  );
}
