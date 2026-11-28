import type { Metadata } from "next";
import { DashboardView } from "@/components/dashboard/dashboard-view";
import { AppShell } from "@/components/layout/app-shell";
import { PageContainer } from "@/components/layout/page-container";
import { InfoIcon } from "@/components/ui/icons";
import { siteConfig } from "@/config/site";
import { toIsoDate } from "@/lib/dashboard/dates.ts";
import { computeDashboard } from "@/lib/dashboard/metrics.ts";
import { sampleDashboardInput } from "@/lib/dashboard/sample.ts";

export const metadata: Metadata = {
  title: "Dashboard namunasi",
  robots: { index: false, follow: false },
};

export const dynamic = "force-dynamic";

/**
 * Ishlab chiquvchilar uchun: Dashboard bloklari ma'lumot bilan qanday
 * ko‘rinishini tekshirish. Raqamlar namuna ekani sahifada ochiq yozilgan.
 */
export default function DashboardSamplePage() {
  const view = computeDashboard(sampleDashboardInput(toIsoDate(new Date(), siteConfig.timeZone)));
  return (
    <AppShell>
      <PageContainer title="Dashboard namunasi" hideMobileTitle>
        <div
          role="note"
          className="mb-5 flex items-start gap-3 rounded-card border border-warning/30 bg-warning-soft p-4 text-warning"
        >
          <InfoIcon className="mt-0.5 size-5 shrink-0" />
          <p className="text-caption font-medium">
            Namuna ma’lumot — haqiqiy foydalanuvchi statistikasi emas. Bu sahifa faqat dizaynni tekshirish uchun.
          </p>
        </div>
        <DashboardView view={view} />
      </PageContainer>
    </AppShell>
  );
}
