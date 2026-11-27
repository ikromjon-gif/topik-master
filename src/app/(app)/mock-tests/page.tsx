import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/mock-tests");

export default function Page() {
  return <RoutePlaceholder href="/mock-tests" />;
}
