import { AccessNotice } from "@/components/layout/access-notice";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { Badge, VerificationBadge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { LayersIcon } from "@/components/ui/icons";
import { getGrammar } from "@/lib/content/queries";
import { getLearningContext } from "@/lib/learning/queries";

export const metadata = routeMetadata("/grammar");
export const dynamic = "force-dynamic";

export default async function GrammarPage() {
  const ctx = await getLearningContext();
  const title = "Grammatika";
  const description = "3급–6급 grammatik qoidalari: formula, o‘zbekcha tushuntirish va misollar.";

  if (ctx.state !== "signed-in") {
    return (
      <PageContainer title={title} description={description}>
        <AccessNotice state={ctx.state} icon={<LayersIcon />} next="/grammar" what="Grammatika" />
      </PageContainer>
    );
  }

  const items = await getGrammar(ctx.supabase);
  return (
    <PageContainer title={title} description={description}>
      {items.length === 0 ? (
        <Card>
          <EmptyState
            icon={<LayersIcon />}
            title="Grammatika darslari tayyorlanmoqda"
            description="Har bir qoida formula, tushuntirish va kamida 3 ta misol bilan tekshirilgach shu yerda paydo bo‘ladi."
          />
        </Card>
      ) : (
        <ul className="grid gap-4 lg:grid-cols-2">
          {items.map((g) => (
            <li key={g.id}>
              <Card className="h-full">
                <div className="mb-2 flex flex-wrap items-center justify-between gap-2">
                  <h2 lang="ko" className="text-title font-bold text-foreground">
                    {g.pattern}
                  </h2>
                  <div className="flex gap-2">
                    {g.level && <Badge tone="primary" size="sm">{g.level}급</Badge>}
                    <VerificationBadge status={g.status} />
                  </div>
                </div>
                <p className="mb-3 inline-block rounded-control bg-surface-muted px-2.5 py-1 font-mono text-caption text-foreground">
                  {g.formula}
                </p>
                {g.explanation && <p className="text-body whitespace-pre-line text-foreground">{g.explanation}</p>}
                {g.examples.length > 0 && (
                  <ul className="mt-3 flex flex-col gap-2 border-t border-border pt-3">
                    {g.examples.map((e, i) => (
                      <li key={i} className="text-caption">
                        <p lang="ko" className="text-foreground">{e.ko}</p>
                        {e.uz && <p className="text-muted">{e.uz}</p>}
                      </li>
                    ))}
                  </ul>
                )}
              </Card>
            </li>
          ))}
        </ul>
      )}
    </PageContainer>
  );
}
