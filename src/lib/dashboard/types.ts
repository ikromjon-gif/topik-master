import type { IsoDate } from "./dates.ts";

/**
 * Dashboard'ga kiradigan xom ma'lumotlar. Phase 4 da Supabase'dan
 * (plan_tasks, task_completions, study_sessions, test_attempts) to‘ldiriladi.
 * Hozircha ma'lumot manbai yo‘q — barcha ro‘yxatlar bo‘sh, `plan` null.
 */
export type SectionKey = "vocabulary" | "grammar" | "listening" | "reading" | "writing" | "mock";

export type PlanInput = {
  startDate: IsoDate;
  totalDays: number; // 45
  targetLevel: 3 | 4 | 5 | 6;
};

export type PlanTaskInput = {
  id: string;
  day: number; // 1..totalDays
  section: SectionKey;
  title: string;
  titleKo?: string;
  estimatedMinutes: number | null;
  href?: string;
  completedOn: IsoDate | null;
};

export type StudySessionInput = {
  date: IsoDate;
  minutes: number;
};

export type ResultInput = {
  id: string;
  section: SectionKey;
  title: string;
  score: number;
  maxScore: number;
  date: IsoDate;
};

export type DashboardInput = {
  today: IsoDate;
  plan: PlanInput | null;
  tasks: PlanTaskInput[];
  sessions: StudySessionInput[];
  results: ResultInput[];
  /** Profil sozlamasidagi maqsad daraja (reja bo‘lmasa ishlatiladi). */
  targetLevel?: 3 | 4 | 5 | 6;
  /** Joriy rejadan tashqari faol kunlar (masalan, oldingi rejalardagi bajarilganlar). */
  extraActiveDates?: IsoDate[];
};

/** Hisoblangan ko‘rinish modeli. `null` = ma'lumot yo‘q (UI "—" yoki bo‘sh holat). */
export type DashboardView = {
  today: IsoDate;
  plan: {
    started: boolean;
    startDate: IsoDate;
    totalDays: number;
    /** Bugun rejaning nechanchi kuni (1..total); reja tugagan bo‘lsa total. Boshlanmagan bo‘lsa null. */
    currentDay: number | null;
    /** Barcha topshiriqlari bajarilgan kunlar soni. */
    completedDays: number;
    /** completedDays / totalDays, 0–100. */
    dayProgressPct: number;
    finished: boolean;
  } | null;
  targetLevel: 3 | 4 | 5 | 6;
  /** Bajarilgan topshiriqlar / rejadagi barcha topshiriqlar, 0–100. Topshiriq yo‘q bo‘lsa null. */
  overallProgressPct: number | null;
  today_tasks: {
    day: number | null;
    items: PlanTaskInput[];
    done: number;
    total: number;
  };
  /** Ketma-ket faol kunlar. Hech qachon faollik bo‘lmagan bo‘lsa null. */
  streak: number | null;
  /** Bugun hali faollik yo‘q, lekin kecha bor edi — streak "xavf ostida". */
  streakAtRisk: boolean;
  studyDays: number | null;
  totalMinutes: number | null;
  /** Oxirgi 7 kun (bugun bilan), eskidan yangiga. */
  week: { date: IsoDate; minutes: number }[];
  weekTotalMinutes: number;
  hasWeekData: boolean;
  /** Kalendar uchun: rejaning har bir kuni holati. */
  calendar: Record<IsoDate, "completed" | "partial" | "missed" | "today" | "upcoming">;
  recentResults: ResultInput[];
};
