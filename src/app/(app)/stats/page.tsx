import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/stats");

export default function Page() {
  return <RoutePlaceholder href="/stats" note="Statistika faqat haqiqiy o‘qish ma’lumotlaridan hisoblanadi. Ma’lumot yig‘ilgach shu yerda ko‘rinadi." />;
}
