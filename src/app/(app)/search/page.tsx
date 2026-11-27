import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { SearchField } from "@/components/layout/search-field";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { SearchIcon } from "@/components/ui/icons";

export const metadata = routeMetadata("/search");

export default async function SearchPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string | string[] }>;
}) {
  const { q } = await searchParams;
  const query = (Array.isArray(q) ? q[0] : q)?.trim() ?? "";

  return (
    <PageContainer title="Qidiruv">
      <SearchField id="search-page-q" className="mb-5 md:hidden" defaultValue={query} />
      <Card>
        <EmptyState
          icon={<SearchIcon />}
          title={query ? `“${query}” bo‘yicha qidiruv hali ishlamaydi` : "Qidiruv tayyorlanmoqda"}
          description="So‘z, grammatika va darslar bo‘yicha qidiruv kontent bazasi ulangach ishlaydi."
        />
      </Card>
    </PageContainer>
  );
}
