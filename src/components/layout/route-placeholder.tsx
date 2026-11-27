import Link from "next/link";
import type { Metadata } from "next";
import { findRoute } from "@/config/navigation";
import { buttonClasses } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { PageContainer } from "./page-container";

/** Navigatsiya konfiguratsiyasidan sahifa metadata'si. */
export function routeMetadata(href: string): Metadata {
  const route = findRoute(href);
  return { title: route?.title ?? route?.label, description: route?.description };
}

/**
 * Hali qurilmagan bo‘lim uchun umumiy sahifa. Soxta kontent yoki raqam
 * ko‘rsatmaydi — bo‘lim tayyorlanayotganini ochiq aytadi.
 */
export function RoutePlaceholder({ href, note }: { href: string; note?: string }) {
  const route = findRoute(href);
  const title = route?.title ?? route?.label ?? "Sahifa";

  return (
    <PageContainer title={title} description={route?.description}>
      <Card>
        <EmptyState
          icon={route?.icon}
          title="Bu bo‘lim tayyorlanmoqda"
          description={note ?? "Kontent va funksiyalar keyingi bosqichlarda qo‘shiladi."}
          action={
            href !== "/dashboard" ? (
              <Link href="/dashboard" className={buttonClasses({ variant: "outline", size: "sm" })}>
                Bosh sahifaga qaytish
              </Link>
            ) : undefined
          }
        />
      </Card>
    </PageContainer>
  );
}
