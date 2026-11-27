import { AccessNotice } from "@/components/layout/access-notice";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { ExamFormat } from "@/components/practice/exam-format";
import { WritingPractice } from "@/components/practice/writing-practice";
import { Badge, VerificationBadge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { PenIcon } from "@/components/ui/icons";
import { getWritingTasks } from "@/lib/content/queries";
import { getLearningContext } from "@/lib/learning/queries";

export const metadata = routeMetadata("/writing");
export const dynamic = "force-dynamic";

export default async function WritingPage() {
  const ctx = await getLearningContext();
  const title = "Yozish";
  const description = "Yozish 51–54: original topshiriqlar, belgilar hisoblagichi va namunaviy javoblar.";

  if (ctx.state !== "signed-in") {
    return (
      <PageContainer title={title} description={description}>
        <div className="flex flex-col gap-5">
          <AccessNotice state={ctx.state} icon={<PenIcon />} next="/writing" what="Yozish" />
          <ExamFormat section="writing" />
        </div>
      </PageContainer>
    );
  }

  const tasks = await getWritingTasks(ctx.supabase);
  return (
    <PageContainer title={title} description={description}>
      <div className="grid gap-5 xl:grid-cols-3">
        <div className="flex flex-col gap-4 xl:col-span-2">
          {tasks.length === 0 ? (
            <Card>
              <EmptyState
                icon={<PenIcon />}
                title="Yozish topshiriqlari tayyorlanmoqda"
                description="51–54 turidagi original topshiriqlar baholash mezonlari va namunaviy javoblar bilan tekshirilgach qo‘shiladi."
              />
            </Card>
          ) : (
            tasks.map((t) => (
              <Card key={t.id}>
                <div className="mb-2 flex items-center justify-between gap-2">
                  <Badge tone="primary">{t.task_no}-topshiriq</Badge>
                  <VerificationBadge status={t.status} />
                </div>
                <p lang="ko" className="text-body whitespace-pre-line text-foreground">{t.prompt_ko}</p>
                <WritingPractice taskId={t.id} minChars={t.min_chars} maxChars={t.max_chars} modelAnswer={t.model_answer} />
              </Card>
            ))
          )}
        </div>
        <ExamFormat section="writing" />
      </div>
    </PageContainer>
  );
}
