import { AccessNotice } from "@/components/layout/access-notice";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { ExamFormat } from "@/components/practice/exam-format";
import { VerificationBadge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { TrophyIcon } from "@/components/ui/icons";
import { getMockTests } from "@/lib/content/queries";
import { getLearningContext } from "@/lib/learning/queries";

export const metadata = routeMetadata("/mock-tests");
export const dynamic = "force-dynamic";

export default async function MockTestsPage() {
  const ctx = await getLearningContext();
  const title = "Sinov imtihoni";
  const description = "Vaqt bilan to‘liq TOPIK II formatidagi original sinov imtihonlari.";

  if (ctx.state !== "signed-in") {
    return (
      <PageContainer title={title} description={description}>
        <AccessNotice state={ctx.state} icon={<TrophyIcon />} next="/mock-tests" what="Sinov imtihoni" />
      </PageContainer>
    );
  }

  const tests = await getMockTests(ctx.supabase);
  return (
    <PageContainer title={title} description={description}>
      <div className="grid gap-5 lg:grid-cols-3">
        <div className="flex flex-col gap-3 lg:col-span-2">
          {tests.length === 0 ? (
            <Card>
              <EmptyState
                icon={<TrophyIcon />}
                title="Sinov imtihonlari tayyorlanmoqda"
                description="To‘liq sinov imtihoni yetarli miqdordagi tekshirilgan tinglash, o‘qish va yozish savollari tayyor bo‘lgach qo‘shiladi."
              />
            </Card>
          ) : (
            tests.map((t) => (
              <Card key={t.id} className="flex items-center justify-between gap-3">
                <div>
                  <p className="font-semibold text-foreground">{t.title}</p>
                  <p className="text-caption text-muted">{t.itemCount} ta savol</p>
                </div>
                <VerificationBadge status={t.status} />
              </Card>
            ))
          )}
        </div>
        <div className="flex flex-col gap-5">
          <ExamFormat section="listening" />
          <ExamFormat section="reading" />
        </div>
      </div>
    </PageContainer>
  );
}
