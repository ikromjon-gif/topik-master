import { AccessNotice } from "@/components/layout/access-notice";
import { PageContainer } from "@/components/layout/page-container";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { FileTextIcon, HeadphonesIcon } from "@/components/ui/icons";
import { getPracticeQuestions } from "@/lib/content/queries";
import { getLearningContext } from "@/lib/learning/queries";
import { ExamFormat } from "./exam-format";
import { PracticeSession } from "./practice-session";

/** Tinglash va O‘qish sahifalari uchun umumiy server komponent. */
export async function SectionPracticePage({ section }: { section: "listening" | "reading" }) {
  const isListening = section === "listening";
  const title = isListening ? "Tinglab tushunish" : "O‘qib tushunish";
  const description = isListening
    ? "TOPIK II formatidagi original tinglash mashqlari."
    : "TOPIK II formatidagi original o‘qish matnlari va testlar.";
  const icon = isListening ? <HeadphonesIcon /> : <FileTextIcon />;
  const ctx = await getLearningContext();

  if (ctx.state !== "signed-in") {
    return (
      <PageContainer title={title} description={description}>
        <div className="flex flex-col gap-5">
          <AccessNotice state={ctx.state} icon={icon} next={`/${section}`} what={title} />
          <ExamFormat section={section} />
        </div>
      </PageContainer>
    );
  }

  const questions = await getPracticeQuestions(ctx.supabase, section, 10);

  // Tinglash: audio faqat server bergan qisqa muddatli signed URL orqali (bucket yopiq)
  const audioUrls: Record<string, string> = {};
  if (isListening && questions.length) {
    await Promise.all(
      questions.map(async (q) => {
        if (!q.audio) return;
        const path = q.audio.storage_path.replace(/^audio\//, "");
        const { data } = await ctx.supabase.storage.from("audio").createSignedUrl(path, 60 * 60);
        if (data?.signedUrl) audioUrls[q.id] = data.signedUrl;
      }),
    );
  }

  return (
    <PageContainer title={title} description={description}>
      <div className="grid gap-5 xl:grid-cols-3">
        <div className="xl:col-span-2">
          {questions.length === 0 ? (
            <Card>
              <EmptyState
                icon={icon}
                title="Mashqlar tayyorlanmoqda"
                description={
                  isListening
                    ? "Tinglash mashqlari original native audio yozuvlari va ularning huquqlari tasdiqlangach qo‘shiladi."
                    : "O‘qish mashqlari jamoa tomonidan tekshirilgach shu yerda paydo bo‘ladi."
                }
              />
            </Card>
          ) : (
            <PracticeSession section={section} questions={questions} audioUrls={audioUrls} />
          )}
        </div>
        <div className="flex flex-col gap-5">
          <ExamFormat section={section} />
          <p className="text-xs text-muted">
            Barcha mashqlar Sabaq uchun yaratilgan original savollar. Rasmiy TOPIK savollari platformaga ko‘chirilmaydi.
          </p>
        </div>
      </div>
    </PageContainer>
  );
}
