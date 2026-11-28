/**
 * FAQAT dizayn ko‘rgazmasi uchun namuna kirish ma'lumotlari
 * (/design-system/dashboard). Haqiqiy Dashboard bu fayldan hech qachon
 * foydalanmaydi. Namuna ham `computeDashboard` orqali hisoblanadi, shuning
 * uchun ko‘rinish va raqamlar bir-biriga mos keladi.
 */
import { addDays, type IsoDate } from "./dates.ts";
import type { DashboardInput, PlanTaskInput, SectionKey } from "./types.ts";

export function sampleDashboardInput(today: IsoDate): DashboardInput {
  const currentDay = 12;
  const startDate = addDays(today, -(currentDay - 1));
  const tasks: PlanTaskInput[] = [];
  const pattern: [SectionKey, string, string | undefined, number][] = [
    ["vocabulary", "Yangi so‘zlar (20 ta)", undefined, 15],
    ["grammar", "-(으)면서", "-(으)면서", 20],
    ["listening", "1–10-savollar", undefined, 25],
    ["reading", "1–10-savollar", undefined, 25],
  ];

  for (let day = 1; day <= 45; day += 1) {
    const date = addDays(startDate, day - 1);
    pattern.forEach(([section, title, titleKo, minutes], i) => {
      let completedOn: IsoDate | null = null;
      if (day < currentDay) {
        // 4- va 8-kunlar qisman bajarilgan
        completedOn = (day === 4 || day === 8) && i >= 2 ? null : date;
      } else if (day === currentDay && i < 2) {
        completedOn = date;
      }
      tasks.push({ id: `d${day}-${i}`, day, section, title, titleKo, estimatedMinutes: minutes, completedOn });
    });
  }

  const sessions = [42, 0, 65, 38, 80, 55, 35].map((minutes, i) => ({ date: addDays(today, i - 6), minutes }));
  for (let d = 7; d < currentDay; d += 1) sessions.push({ date: addDays(today, -d), minutes: 45 });

  return {
    today,
    plan: { startDate, totalDays: 45, targetLevel: 4 },
    tasks,
    sessions,
    results: [
      { id: "r1", section: "listening", title: "Tinglab tushunish #1", score: 76, maxScore: 100, date: addDays(today, -1) },
      { id: "r2", section: "reading", title: "O‘qib tushunish #1", score: 82, maxScore: 100, date: addDays(today, -2) },
      { id: "r3", section: "writing", title: "Yozish 53 #1", score: 17, maxScore: 30, date: addDays(today, -4) },
    ],
  };
}
