/**
 * Platforma nomi va asosiy ma'lumotlar.
 * Brendni almashtirish uchun faqat shu faylni o'zgartirish kifoya.
 */
export const siteConfig = {
  name: "Sabaq",
  tagline: "TOPIK II tayyorgarlik",
  description:
    "O'zbek tilida TOPIK II (3급–6급) imtihoniga tayyorgarlik platformasi: tinglash, o'qish, yozish va grammatika.",
  locale: "uz",
  timeZone: "Asia/Seoul",
  exam: {
    name: "TOPIK II",
    formatVersion: "topik2-pbt-2014",
    defaultTargetLevel: 4,
    /** TOPIK II PBT daraja chegaralari (300 ballik shkala). */
    levelThresholds: { 3: 120, 4: 150, 5: 190, 6: 230 },
  },
  officialLinks: {
    topik: "https://www.topik.go.kr/",
    niied: "https://www.niied.go.kr/",
  },
} as const;

export type SiteConfig = typeof siteConfig;
