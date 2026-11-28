"use client";

import { IconButton } from "@/components/ui/icon-button";
import { MoonIcon, SunIcon } from "@/components/ui/icons";
import { useTheme } from "./theme-provider";

export function ThemeToggle({ className }: { className?: string }) {
  const { resolvedTheme, toggle } = useTheme();
  const isDark = resolvedTheme === "dark";

  return (
    <IconButton
      label={isDark ? "Yorug‘ rejimga o‘tish" : "Qorong‘i rejimga o‘tish"}
      onClick={toggle}
      variant="soft"
      className={className}
    >
      {isDark ? <SunIcon /> : <MoonIcon />}
    </IconButton>
  );
}
