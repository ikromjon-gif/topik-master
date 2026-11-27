import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/plan");

export default function Page() {
  return <RoutePlaceholder href="/plan" note="45 kunlik reja va kunlik topshiriqlar keyingi bosqichda quriladi." />;
}
