import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/notifications");

export default function Page() {
  return <RoutePlaceholder href="/notifications" note="Hozircha bildirishnoma yo‘q." />;
}
