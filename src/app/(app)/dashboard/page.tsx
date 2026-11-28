import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { HomeIcon } from "@/components/ui/icons";

export const metadata = routeMetadata("/dashboard");

/**
 * Dashboard karkasi (Phase 2). Bloklar (hero, statistika, bugungi reja,
 * taqvim, tezkor kirish, natijalar) Phase 3 da shu sahifaga quriladi.
 */
export default function DashboardPage() {
  return (
    <PageContainer title="Bosh sahifa" hideMobileTitle>
      <Card>
        <EmptyState
          icon={<HomeIcon />}
          title="Dashboard tayyorlanmoqda"
          description="Bugungi reja, progress va tezkor kirish bloklari keyingi bosqichda shu yerga qo‘shiladi."
        />
      </Card>
    </PageContainer>
  );
}
