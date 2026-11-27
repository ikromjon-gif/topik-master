import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/writing");

export default function Page() {
  return <RoutePlaceholder href="/writing" />;
}
