import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/mistakes");

export default function Page() {
  return <RoutePlaceholder href="/mistakes" />;
}
