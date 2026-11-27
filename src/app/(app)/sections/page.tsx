import Link from "next/link";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { primaryNav, sectionNav } from "@/config/navigation";
import { ChevronRightIcon } from "@/components/ui/icons";

export const metadata = routeMetadata("/sections");

const extra = primaryNav.filter((item) => item.href === "/mistakes");

/** Mobile "Bo‘limlar" sahifasi: barcha o‘quv bo‘limlariga kirish. */
export default function SectionsPage() {
  return (
    <PageContainer title="Bo‘limlar" description="Lug‘at, grammatika, tinglash, o‘qish, yozish va sinov imtihoni.">
      <ul className="grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
        {[...sectionNav, ...extra].map((item) => (
          <li key={item.href} className="min-w-0">
            <Link
              href={item.href}
              className="flex items-center gap-4 rounded-card border border-border bg-surface p-4 shadow-card transition-colors duration-150 hover:border-border-strong"
            >
              <span className="grid size-12 shrink-0 place-items-center rounded-control bg-primary-soft text-primary [&_svg]:size-6">
                {item.icon}
              </span>
              <span className="min-w-0 flex-1">
                <span className="block font-semibold text-foreground">
                  {item.label}
                  {item.labelKo && <span className="ko ml-1.5 font-normal text-muted">({item.labelKo})</span>}
                </span>
                {item.description && (
                  <span className="mt-0.5 block truncate text-caption text-muted">{item.description}</span>
                )}
              </span>
              <ChevronRightIcon className="size-5 shrink-0 text-subtle" />
            </Link>
          </li>
        ))}
      </ul>
    </PageContainer>
  );
}
