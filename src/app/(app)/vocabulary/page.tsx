import Link from "next/link";
import { AccessNotice } from "@/components/layout/access-notice";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { VerificationBadge } from "@/components/ui/badge";
import { buttonClasses } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { BookOpenIcon, InfoIcon, SearchIcon } from "@/components/ui/icons";
import { pendingVocabCount } from "@/lib/content/pending";
import { getTopics, getVocabulary } from "@/lib/content/queries";
import { getLearningContext } from "@/lib/learning/queries";
import { cn } from "@/lib/cn";

export const metadata = routeMetadata("/vocabulary");
export const dynamic = "force-dynamic";

const PAGE_SIZE = 60;

export default async function VocabularyPage({
  searchParams,
}: {
  searchParams: Promise<{ topic?: string; q?: string; part?: string; page?: string }>;
}) {
  const sp = await searchParams;
  const ctx = await getLearningContext();
  const title = "Lug‘at";
  const description = "TOPIK II so‘zlari va iboralari, o‘zbekcha tarjima va misollar bilan.";

  if (ctx.state !== "signed-in") {
    return (
      <PageContainer title={title} description={description}>
        <AccessNotice state={ctx.state} icon={<BookOpenIcon />} next="/vocabulary" what="Lug‘at" />
      </PageContainer>
    );
  }

  const part = Number(sp.part) >= 1 && Number(sp.part) <= 5 ? Number(sp.part) : undefined;
  const page = Math.max(1, Number(sp.page) || 1);
  const q = sp.q?.trim() || undefined;
  const [topics, vocab] = await Promise.all([
    getTopics(ctx.supabase),
    getVocabulary(ctx.supabase, { topic: sp.topic, q, part, parts: part ? 5 : undefined }),
  ]);
  const items = vocab.items.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE);
  const pages = Math.ceil(vocab.total / PAGE_SIZE);
  const attributions = [...new Set(vocab.items.map((i) => i.attribution).filter(Boolean))] as string[];
  const activeTopic = topics.find((t) => t.key === sp.topic);
  const isStaff = ctx.profile && ctx.profile.role !== "learner";

  const qs = (patch: Record<string, string | undefined>) => {
    const p = new URLSearchParams();
    const merged = { topic: sp.topic, q, part: part ? String(part) : undefined, ...patch };
    for (const [k, v] of Object.entries(merged)) if (v) p.set(k, v);
    const s = p.toString();
    return s ? `/vocabulary?${s}` : "/vocabulary";
  };

  return (
    <PageContainer title={title} description={description}>
      <div className="flex flex-col gap-5">
        <form action="/vocabulary" method="get" role="search" aria-label="Lug‘atdan qidirish" className="flex flex-col gap-3 sm:flex-row">
          {sp.topic && <input type="hidden" name="topic" value={sp.topic} />}
          <label htmlFor="vocab-q" className="sr-only">
            So‘z qidirish
          </label>
          <div className="relative flex-1">
            <SearchIcon className="pointer-events-none absolute top-1/2 left-3.5 size-5 -translate-y-1/2 text-subtle" />
            <input
              id="vocab-q"
              name="q"
              type="search"
              defaultValue={q}
              placeholder="Koreyscha so‘zni qidiring (masalan: 정책)"
              className="h-11 w-full rounded-control border border-border bg-surface pr-4 pl-11 text-body placeholder:text-subtle focus:border-primary focus:ring-3 focus:ring-primary/20 focus:outline-none"
            />
          </div>
          <button type="submit" className={buttonClasses({ variant: "outline" })}>
            Qidirish
          </button>
        </form>

        <nav aria-label="Mavzular" className="-mx-1 flex gap-2 overflow-x-auto px-1 pb-1">
          <Link href={qs({ topic: undefined, part: undefined, page: undefined })} aria-current={!sp.topic ? "page" : undefined} className={chip(!sp.topic)}>
            Barchasi
          </Link>
          {topics.map((t) => (
            <Link key={t.key} href={qs({ topic: t.key, part: undefined, page: undefined })} aria-current={sp.topic === t.key ? "page" : undefined} className={chip(sp.topic === t.key)}>
              {t.name_uz}
            </Link>
          ))}
        </nav>

        {(activeTopic || part) && (
          <p className="text-caption text-muted">
            {activeTopic?.name_uz}
            {part && ` · ${part}-qism (5 dan)`} · {vocab.total} ta yozuv
          </p>
        )}

        {vocab.total === 0 ? (
          <Card>
            <EmptyState
              icon={<BookOpenIcon />}
              title={q ? `“${q}” bo‘yicha so‘z topilmadi` : "Hali nashr qilingan so‘z yo‘q"}
              description={
                q
                  ? "Boshqa so‘z bilan qidirib ko‘ring."
                  : `${pendingVocabCount()} ta so‘z va ibora tekshiruvdan o‘tishni kutmoqda. Tekshirilgan yozuvlar shu yerda paydo bo‘ladi.`
              }
            />
          </Card>
        ) : (
          <ul className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
            {items.map((v) => (
              <li key={v.id} className="min-w-0 rounded-card border border-border bg-surface p-4 shadow-card">
                <div className="flex items-start justify-between gap-2">
                  <p lang="ko" className="text-heading font-bold text-foreground">
                    {v.term}
                  </p>
                  <VerificationBadge status={v.status} />
                </div>
                <p className="mt-1 text-body text-foreground">
                  {v.meaning ? v.meaning.text : <span className="text-muted">Tarjima hali qo‘shilmagan</span>}
                </p>
                {v.examples.length > 0 && (
                  <ul className="mt-3 flex flex-col gap-2 border-t border-border pt-3">
                    {v.examples.map((e) => (
                      <li key={e.id} className="text-caption">
                        <p lang="ko" className="text-foreground">
                          {e.ko}
                        </p>
                        {e.uz && <p className="text-muted">{e.uz}</p>}
                      </li>
                    ))}
                  </ul>
                )}
                {v.topic && (
                  <p className="mt-3 text-xs text-subtle">
                    {v.topic.name_uz}
                    {isStaff && v.status === "draft" && " · draft (faqat xodimlarga ko‘rinadi)"}
                  </p>
                )}
              </li>
            ))}
          </ul>
        )}

        {pages > 1 && (
          <nav aria-label="Sahifalar" className="flex items-center justify-center gap-2">
            {page > 1 && (
              <Link href={qs({ page: String(page - 1) })} className={buttonClasses({ variant: "outline", size: "sm" })}>
                Oldingi
              </Link>
            )}
            <span className="text-caption text-muted tabular-nums">
              {page} / {pages}
            </span>
            {page < pages && (
              <Link href={qs({ page: String(page + 1) })} className={buttonClasses({ variant: "outline", size: "sm" })}>
                Keyingi
              </Link>
            )}
          </nav>
        )}

        {attributions.length > 0 && (
          <p className="flex items-center gap-2 text-caption text-muted">
            <InfoIcon className="size-4 shrink-0" />
            {attributions.join(" · ")}
          </p>
        )}
      </div>
    </PageContainer>
  );
}

function chip(active: boolean) {
  return cn(
    "shrink-0 rounded-full border px-3.5 py-1.5 text-caption font-medium whitespace-nowrap transition-colors",
    active ? "border-primary bg-primary text-primary-foreground" : "border-border bg-surface text-muted hover:text-foreground",
  );
}
