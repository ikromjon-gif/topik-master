import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/grammar");

export default function Page() {
  return <RoutePlaceholder href="/grammar" />;
}
