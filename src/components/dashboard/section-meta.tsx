import type { ReactNode } from "react";
import type { SectionKey } from "@/lib/dashboard/types.ts";
import {
  BookOpenIcon,
  FileTextIcon,
  HeadphonesIcon,
  LayersIcon,
  PenIcon,
  TrophyIcon,
} from "@/components/ui/icons";

export type SectionMeta = {
  key: SectionKey;
  label: string;
  short: string;
  ko: string;
  href: string;
  icon: ReactNode;
  /** Ikonka foni va rangi (bo‘lim aksenti). */
  tone: string;
  /** Mobile katta karta foni. */
  card: string;
};

export const SECTION_META: Record<SectionKey, SectionMeta> = {
  vocabulary: {
    key: "vocabulary", label: "Lug‘at", short: "Lug‘at", ko: "단어장", href: "/vocabulary",
    icon: <BookOpenIcon />, tone: "bg-primary-soft text-primary", card: "bg-primary-soft",
  },
  grammar: {
    key: "grammar", label: "Grammatika", short: "Grammatika", ko: "문법", href: "/grammar",
    icon: <LayersIcon />, tone: "bg-grammar-soft text-grammar", card: "bg-grammar-soft",
  },
  listening: {
    key: "listening", label: "Tinglab tushunish", short: "Tinglash", ko: "듣기", href: "/listening",
    icon: <HeadphonesIcon />, tone: "bg-listening-soft text-listening", card: "bg-listening-soft",
  },
  reading: {
    key: "reading", label: "O‘qib tushunish", short: "O‘qish", ko: "읽기", href: "/reading",
    icon: <FileTextIcon />, tone: "bg-reading-soft text-reading", card: "bg-reading-soft",
  },
  writing: {
    key: "writing", label: "Yozish", short: "Yozish", ko: "쓰기", href: "/writing",
    icon: <PenIcon />, tone: "bg-writing-soft text-writing", card: "bg-writing-soft",
  },
  mock: {
    key: "mock", label: "Sinov imtihoni", short: "Sinov imtihoni", ko: "모의고사", href: "/mock-tests",
    icon: <TrophyIcon />, tone: "bg-primary-soft text-primary", card: "bg-primary-soft",
  },
};
