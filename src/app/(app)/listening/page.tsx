import { RoutePlaceholder, routeMetadata } from "@/components/layout/route-placeholder";

export const metadata = routeMetadata("/listening");

export default function Page() {
  return <RoutePlaceholder href="/listening" note="Tinglash mashqlari huquqi tasdiqlangan original audio tayyor bo‘lgach qo‘shiladi." />;
}
