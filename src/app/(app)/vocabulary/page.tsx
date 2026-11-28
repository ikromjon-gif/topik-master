import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/vocabulary");

export default function Page() {
  return <RoutePlaceholder href="/vocabulary" />;
}
