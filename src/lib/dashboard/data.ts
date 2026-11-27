import { siteConfig } from "@/config/site";
import { toIsoDate } from "./dates.ts";
import { computeDashboard } from "./metrics.ts";
import type { DashboardInput, DashboardView } from "./types.ts";

/**
 * Dashboard ma'lumotlarini yig‘adi.
 *
 * Hozir (Phase 3) ma'lumot manbai ulanmagan: auth va Supabase Phase 4 da.
 * Shuning uchun bu funksiya ataylab bo‘sh kirish qaytaradi va UI barcha
 * bloklarda "ma'lumot yo‘q" holatini ko‘rsatadi. Bu yerda hech qachon
 * namuna yoki soxta raqam qaytarilmaydi.
 *
 * Phase 4: shu funksiya ichida foydalanuvchining plan_tasks,
 * task_completions, study_sessions va test_attempts yozuvlari o‘qiladi.
 */
export async function getDashboardData(now: Date = new Date()): Promise<DashboardView> {
  const input: DashboardInput = {
    today: toIsoDate(now, siteConfig.timeZone),
    plan: null,
    tasks: [],
    sessions: [],
    results: [],
  };
  return computeDashboard(input);
}
