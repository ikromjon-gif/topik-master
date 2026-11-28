import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/profile");

export default function Page() {
  return <RoutePlaceholder href="/profile" note="Hisob va sozlamalar autentifikatsiya ulangach qo‘shiladi." />;
}
