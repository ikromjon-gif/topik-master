import Link from "next/link";
import { Card, CardHeader } from "@/components/ui/card";
import { InfoIcon } from "@/components/ui/icons";
import { siteConfig } from "@/config/site";

/**
 * TOPIK II PBT bo‘lim formati (bir nechta manba bilan tasdiqlangan
 * ma'lumotlar; docs/architecture.md). Rasmiy manbaga havola bilan.
 */
const SECTIONS = {
  listening: { name: "Tinglash (듣기)", time: "60 daqiqa", count: "50 ta savol, 4 variantli", points: "100 ball", part: "1-qism" },
  writing: { name: "Yozish (쓰기)", time: "50 daqiqa", count: "4 ta yozma topshiriq (51–54)", points: "100 ball", part: "1-qism" },
  reading: { name: "O‘qish (읽기)", time: "70 daqiqa", count: "50 ta savol, 4 variantli", points: "100 ball", part: "2-qism" },
} as const;

export function ExamFormat({ section }: { section: keyof typeof SECTIONS }) {
  const s = SECTIONS[section];
  return (
    <Card>
      <CardHeader title="Imtihon formati" icon={<InfoIcon />} description={`TOPIK II PBT · ${s.part}`} />
      <dl className="grid grid-cols-3 gap-3 text-center">
        {[
          ["Vaqt", s.time],
          ["Savollar", s.count],
          ["Ball", s.points],
        ].map(([k, v]) => (
          <div key={k} className="rounded-control bg-surface-muted px-2 py-3">
            <dt className="text-xs text-muted">{k}</dt>
            <dd className="mt-0.5 text-caption font-semibold text-foreground">{v}</dd>
          </div>
        ))}
      </dl>
      {section === "writing" && (
        <ul className="mt-4 flex flex-col gap-2 text-caption">
          <li className="rounded-control border border-border px-3 py-2">
            <b>51–52.</b> Gap to‘ldirish (matndagi bo‘shliqlarga mos gap yozish)
          </li>
          <li className="rounded-control border border-border px-3 py-2">
            <b>53.</b> Grafik yoki jadval asosida tushuntirish matni — 200–300 belgi
          </li>
          <li className="rounded-control border border-border px-3 py-2">
            <b>54.</b> Berilgan mavzuda munozarali insho — 600–700 belgi
          </li>
        </ul>
      )}
      <p className="mt-4 text-xs text-muted">
        TOPIK II: 300 ballik shkala, daraja chegaralari — 3급 120, 4급 150, 5급 190, 6급 230. Rasmiy ma’lumot:{" "}
        <Link href={siteConfig.officialLinks.topik} className="text-primary underline" target="_blank" rel="noopener noreferrer">
          topik.go.kr
        </Link>
      </p>
    </Card>
  );
}
