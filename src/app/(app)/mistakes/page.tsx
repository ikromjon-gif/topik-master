import Link from "next/link";
import { SECTION_META } from "@/components/dashboard/section-meta";
import { AccessNotice } from "@/components/layout/access-notice";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { buttonClasses } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { AlertTriangleIcon } from "@/components/ui/icons";
import type { SectionKey } from "@/lib/dashboard/types.ts";
import { getLearningContext } from "@/lib/learning/queries";
import { cn } from "@/lib/cn";

export const metadata = routeMetadata("/mistakes");
export const dynamic = "force-dynamic";

const CIRCLED = ["①", "②", "③", "④"];

type Row = {
  question_id: string;
  chosen_label: number | null;
  created_at: string;
  question: {
    id: string;
    section: string;
    stem_ko: string;
    options: { label: number; text_ko: string; is_correct: boolean }[] | null;
  } | null;
};

export default async function MistakesPage() {
  const ctx = await getLearningContext();
  const title = "Xatolarim";
  const description = "Mashqlarda noto‘g‘ri javob bergan savollaringiz — izohlari bilan.";

  if (ctx.state !== "signed-in") {
    return (
      <PageContainer title={title} description={description}>
        <AccessNotice state={ctx.state} icon={<AlertTriangleIcon />} next="/mistakes" what="Xatolar ro‘yxati" />
      </PageContainer>
    );
  }

  const { data } = await ctx.supabase
    .from("attempt_answers")
    .select("question_id, chosen_label, created_at, question:questions(id, section, stem_ko, options:question_options(label, text_ko, is_correct))")
    .eq("user_id", ctx.userId)
    .eq("is_correct", false)
    .order("created_at", { ascending: false })
    .limit(200);

  // Bir savol bir necha marta xato qilingan bo‘lsa — eng oxirgisi
  const seen = new Set<string>();
  const rows = ((data ?? []) as unknown as Row[]).filter((r) => {
    const q = Array.isArray(r.question) ? r.question[0] : r.question;
    if (!q || seen.has(r.question_id)) return false;
    seen.add(r.question_id);
    r.question = q;
    return true;
  });

  const ids = rows.map((r) => r.question_id);
  const { data: expl } = ids.length
    ? await ctx.supabase.from("explanations").select("question_id, body_md").is("option_id", null).eq("locale", "uz").in("question_id", ids)
    : { data: [] };
  const explMap = new Map(((expl ?? []) as { question_id: string; body_md: string }[]).map((e) => [e.question_id, e.body_md]));

  return (
    <PageContainer title={title} description={description}>
      {rows.length === 0 ? (
        <Card>
          <EmptyState
            icon={<AlertTriangleIcon />}
            title="Hozircha xato yo‘q"
            description="Mashqlarda noto‘g‘ri javob bergan savollaringiz shu yerda yig‘iladi."
            action={
              <Link href="/reading" className={buttonClasses({ size: "sm", variant: "secondary" })}>
                Mashq qilish
              </Link>
            }
          />
        </Card>
      ) : (
        <ul className="flex flex-col gap-4">
          {rows.map((r) => {
            const q = r.question!;
            const options = [...(q.options ?? [])].sort((a, b) => a.label - b.label);
            const right = options.find((o) => o.is_correct);
            return (
              <li key={r.question_id}>
                <Card>
                  <p className="mb-1 text-xs text-muted">
                    {SECTION_META[q.section as SectionKey]?.label ?? q.section} · {r.created_at.slice(0, 10)}
                  </p>
                  <p lang="ko" className="mb-3 font-semibold text-foreground">{q.stem_ko}</p>
                  <ul className="grid gap-2 sm:grid-cols-2">
                    {options.map((o) => (
                      <li
                        key={o.label}
                        className={cn(
                          "rounded-control border px-3 py-2 text-caption",
                          o.is_correct ? "border-success bg-success-soft" : o.label === r.chosen_label ? "border-danger bg-danger-soft" : "border-border",
                        )}
                      >
                        <span className="mr-2 text-muted">{CIRCLED[o.label - 1]}</span>
                        <span lang="ko">{o.text_ko}</span>
                        {o.is_correct && <span className="sr-only"> (to‘g‘ri javob)</span>}
                        {!o.is_correct && o.label === r.chosen_label && <span className="sr-only"> (sizning javobingiz)</span>}
                      </li>
                    ))}
                  </ul>
                  <p className="mt-3 text-caption text-foreground">
                    Sizning javobingiz: {r.chosen_label ? CIRCLED[r.chosen_label - 1] : "berilmagan"} · To‘g‘ri javob:{" "}
                    {right ? CIRCLED[right.label - 1] : "—"}
                  </p>
                  {explMap.get(r.question_id) && (
                    <p className="mt-2 rounded-control bg-surface-muted p-3 text-caption whitespace-pre-line text-muted">
                      {explMap.get(r.question_id)}
                    </p>
                  )}
                </Card>
              </li>
            );
          })}
        </ul>
      )}
    </PageContainer>
  );
}
