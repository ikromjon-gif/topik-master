import { siteConfig } from "@/config/site";

/**
 * Vaqtinchalik bosh sahifa (Phase 0).
 * Dashboard Phase 3 da shu yerga quriladi. Bu yerda hech qanday statistika
 * ko'rsatilmaydi, chunki hali haqiqiy ma'lumot manbai ulanmagan.
 */
export default function Home() {
  return (
    <main className="mx-auto flex min-h-dvh max-w-2xl flex-col justify-center gap-4 px-6">
      <p className="text-sm font-medium text-blue-600">{siteConfig.exam.name}</p>
      <h1 className="text-4xl font-bold tracking-tight">{siteConfig.name}</h1>
      <p className="text-lg text-neutral-600 dark:text-neutral-400">
        {siteConfig.tagline}
      </p>
      <p className="text-sm text-neutral-500">
        Platforma ishlab chiqilmoqda. Hozircha bu sahifada faqat loyiha skeleti
        bor.
      </p>
    </main>
  );
}
