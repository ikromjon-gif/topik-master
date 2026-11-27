import { DashboardView } from "@/components/dashboard/dashboard-view";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { getDashboardData } from "@/lib/dashboard/data";
import { toggleTask } from "@/lib/learning/actions";

export const metadata = routeMetadata("/dashboard");

// "Bugun" va foydalanuvchi ma'lumotlari har so‘rovda o‘qiladi.
export const dynamic = "force-dynamic";

export default async function DashboardPage() {
  const { view, interactive } = await getDashboardData();
  return (
    <PageContainer title="Bosh sahifa" hideMobileTitle>
      <DashboardView view={view} onToggleTask={interactive ? toggleTask : undefined} />
    </PageContainer>
  );
}
