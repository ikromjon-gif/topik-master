import { routeMetadata } from "@/components/layout/route-placeholder";
import { SectionPracticePage } from "@/components/practice/section-practice-page";

export const metadata = routeMetadata("/reading");
export const dynamic = "force-dynamic";

export default function Page() {
  return <SectionPracticePage section="reading" />;
}
