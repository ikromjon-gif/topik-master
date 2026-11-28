import { DashboardView } from "@/components/dashboard/dashboard-view";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { getDashboardData } from "@/lib/dashboard/data";

export const metadata = routeMetadata("/dashboard");

// "Bugun" har so‘rovda Asia/Seoul bo‘yicha hisoblanadi (build vaqtida qotib qolmasligi uchun).
export const dynamic = "force-dynamic";

export default async function DashboardPage() {
  const view = await getDashboardData();
  return (
    <PageContainer title="Bosh sahifa" hideMobileTitle>
      <DashboardView view={view} />
    </PageContainer>
  );
}
