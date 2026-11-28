"use client";

import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
  type ReactNode,
} from "react";
import { THEME_STORAGE_KEY } from "./theme-script";

export type ThemePreference = "light" | "dark" | "system";
export type ResolvedTheme = "light" | "dark";

type ThemeContextValue = {
  preference: ThemePreference;
  resolvedTheme: ResolvedTheme;
  setPreference: (preference: ThemePreference) => void;
  toggle: () => void;
};

const ThemeContext = createContext<ThemeContextValue | null>(null);

function readStoredPreference(): ThemePreference {
  try {
    const value = window.localStorage.getItem(THEME_STORAGE_KEY);
    if (value === "light" || value === "dark" || value === "system") return value;
  } catch {
    // localStorage mavjud emas — tizim sozlamasi ishlatiladi
  }
  return "system";
}

function systemPrefersDark(): boolean {
  return window.matchMedia("(prefers-color-scheme: dark)").matches;
}

function applyTheme(theme: ResolvedTheme) {
  const root = document.documentElement;
  root.classList.toggle("dark", theme === "dark");
  root.style.colorScheme = theme;
}

export function ThemeProvider({ children }: { children: ReactNode }) {
  const [preference, setPreferenceState] = useState<ThemePreference>("system");
  const [resolvedTheme, setResolvedTheme] = useState<ResolvedTheme>("light");

  // Birinchi render’dan keyin saqlangan sozlamani o‘qish
  useEffect(() => {
    const stored = readStoredPreference();
    setPreferenceState(stored);
    setResolvedTheme(
      stored === "system" ? (systemPrefersDark() ? "dark" : "light") : stored,
    );
  }, []);

  // "system" tanlangan bo‘lsa, OS o‘zgarishini kuzatish
  useEffect(() => {
    if (preference !== "system") return;
    const media = window.matchMedia("(prefers-color-scheme: dark)");
    const onChange = () => {
      const next = media.matches ? "dark" : "light";
      setResolvedTheme(next);
      applyTheme(next);
    };
    media.addEventListener("change", onChange);
    return () => media.removeEventListener("change", onChange);
  }, [preference]);

  const setPreference = useCallback((next: ThemePreference) => {
    setPreferenceState(next);
    try {
      window.localStorage.setItem(THEME_STORAGE_KEY, next);
    } catch {
      // saqlab bo‘lmadi — joriy sessiyada baribir ishlaydi
    }
    const resolved = next === "system" ? (systemPrefersDark() ? "dark" : "light") : next;
    setResolvedTheme(resolved);
    applyTheme(resolved);
  }, []);

  const toggle = useCallback(() => {
    setPreference(resolvedTheme === "dark" ? "light" : "dark");
  }, [resolvedTheme, setPreference]);

  const value = useMemo(
    () => ({ preference, resolvedTheme, setPreference, toggle }),
    [preference, resolvedTheme, setPreference, toggle],
  );

  return <ThemeContext.Provider value={value}>{children}</ThemeContext.Provider>;
}

export function useTheme(): ThemeContextValue {
  const context = useContext(ThemeContext);
  if (!context) throw new Error("useTheme faqat ThemeProvider ichida ishlatiladi");
  return context;
}
