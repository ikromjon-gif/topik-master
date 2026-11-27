import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/reading");

export default function Page() {
  return <RoutePlaceholder href="/reading" />;
}
