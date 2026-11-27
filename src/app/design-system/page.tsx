import type { Metadata } from "next";
import type { ReactNode } from "react";
import { Badge, VerificationBadge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardHeader } from "@/components/ui/card";
import { EmptyState } from "@/components/ui/empty-state";
import { IconButton } from "@/components/ui/icon-button";
import {
  ArrowRightIcon,
  BarChartIcon,
  BellIcon,
  BookOpenIcon,
  CalendarIcon,
  FileTextIcon,
  FlameIcon,
  HeadphonesIcon,
  InfoIcon,
  LayersIcon,
  PenIcon,
  TargetIcon,
  TrophyIcon,
} from "@/components/ui/icons";
import { Logo } from "@/components/ui/logo";
import { ProgressBar, ProgressRing } from "@/components/ui/progress";
import { Skeleton } from "@/components/ui/skeleton";
import { StatTile } from "@/components/ui/stat-tile";
import { ThemeToggle } from "@/components/theme/theme-toggle";
import { FormDemo, ModalDemo } from "./interactive-demos";

export const metadata: Metadata = {
  title: "Design system",
  robots: { index: false, follow: false },
};

function Section({ title, children }: { title: string; children: ReactNode }) {
  return (
    <section className="flex flex-col gap-4">
      <h2 className="text-caption font-semibold tracking-wide text-muted uppercase">{title}</h2>
      {children}
    </section>
  );
}

const swatches = [
  ["background", "bg-background"],
  ["surface", "bg-surface"],
  ["surface-muted", "bg-surface-muted"],
  ["primary", "bg-primary"],
  ["primary-soft", "bg-primary-soft"],
  ["success", "bg-success"],
  ["warning", "bg-warning"],
  ["danger", "bg-danger"],
  ["listening", "bg-listening"],
  ["reading", "bg-reading"],
  ["writing", "bg-writing"],
  ["grammar", "bg-grammar"],
] as const;

const sections = [
  { title: "Tinglash", ko: "듣기", icon: <HeadphonesIcon />, cls: "bg-listening-soft text-listening" },
  { title: "O'qish", ko: "읽기", icon: <BookOpenIcon />, cls: "bg-reading-soft text-reading" },
  { title: "Yozish", ko: "쓰기", icon: <PenIcon />, cls: "bg-writing-soft text-writing" },
  { title: "Grammatika", ko: "문법", icon: <LayersIcon />, cls: "bg-grammar-soft text-grammar" },
];

export default function DesignSystemPage() {
  return (
    <main className="mx-auto flex max-w-6xl flex-col gap-10 px-4 py-8 sm:px-6 lg:py-12">
      <header className="flex flex-wrap items-center justify-between gap-4">
        <Logo />
        <div className="flex items-center gap-2">
          <IconButton label="Bildirishnomalar" variant="soft" dot>
            <BellIcon />
          </IconButton>
          <ThemeToggle />
        </div>
      </header>

      <div className="flex items-start gap-3 rounded-card border border-primary/20 bg-primary-soft p-4 text-primary-soft-foreground">
        <InfoIcon className="mt-0.5 size-5 shrink-0" />
        <p className="text-caption">
          Bu sahifa faqat ishlab chiquvchilar uchun komponentlar ko&apos;rgazmasi. Undagi raqamlar
          komponent namunasi, haqiqiy foydalanuvchi statistikasi emas.
        </p>
      </div>

      <Section title="Tipografiya">
        <Card className="flex flex-col gap-3">
          <p className="text-display text-foreground">45 kunda 4급 ga tayyorlaning!</p>
          <p className="text-title font-bold">Bugungi reja</p>
          <p className="text-heading font-semibold">45 kunlik o&apos;quv rejasi</p>
          <p className="text-body">
            Asosiy matn: rejali o&apos;qish, amaliy testlar va natija tahlili.{" "}
            <span className="ko">다음 대화를 잘 듣고 이어질 수 있는 말을 고르십시오.</span>
          </p>
          <p className="text-caption text-muted">Izoh matni · ~15 daqiqa</p>
        </Card>
      </Section>

      <Section title="Ranglar">
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-4 lg:grid-cols-6">
          {swatches.map(([name, cls]) => (
            <div key={name} className="overflow-hidden rounded-card border border-border bg-surface">
              <div className={`h-14 ${cls}`} />
              <p className="px-3 py-2 text-caption font-medium">{name}</p>
            </div>
          ))}
        </div>
      </Section>

      <Section title="Tugmalar">
        <Card className="flex flex-col gap-4">
          <div className="flex flex-wrap items-center gap-3">
            <Button>
              Bugungi darsni boshlash <ArrowRightIcon />
            </Button>
            <Button variant="secondary">Pro reja</Button>
            <Button variant="outline">Batafsil</Button>
            <Button variant="ghost">Bekor qilish</Button>
            <Button variant="danger">O&apos;chirish</Button>
          </div>
          <div className="flex flex-wrap items-center gap-3">
            <Button size="sm">Kichik</Button>
            <Button size="md">O&apos;rta</Button>
            <Button size="lg">Katta</Button>
            <Button loading>Saqlanmoqda</Button>
            <Button disabled>O&apos;chirilgan</Button>
          </div>
        </Card>
      </Section>

      <Section title="Belgilar (badge)">
        <Card className="flex flex-wrap items-center gap-2">
          <Badge>Neytral</Badge>
          <Badge tone="primary">TOPIK II</Badge>
          <Badge tone="success">82 / 100</Badge>
          <Badge tone="warning">Muddati yaqin</Badge>
          <Badge tone="danger">Xato</Badge>
          <VerificationBadge status="verified" />
          <VerificationBadge status="reviewed" />
        </Card>
      </Section>

      <Section title="Ko'rsatkich kartalari">
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <StatTile icon={<CalendarIcon />} value="12-kun" suffix="/ 45" label="O'quv rejasi" />
          <StatTile icon={<TargetIcon />} value="35%" label="Umumiy progress" tone="reading" />
          <StatTile icon={<BarChartIcon />} value="4급" label="Maqsad daraja" />
          <StatTile icon={<FlameIcon />} value={null} label="Ketma-ket o'qish (ma'lumot yo'q)" tone="streak" />
        </div>
      </Section>

      <Section title="Progress">
        <div className="grid gap-4 md:grid-cols-3">
          <Card className="flex flex-col items-center gap-3">
            <ProgressRing value={35} label="45 kunlik progress" />
            <p className="text-caption text-muted">Qiymat bor</p>
          </Card>
          <Card className="flex flex-col items-center gap-3">
            <ProgressRing value={null} label="45 kunlik progress" />
            <p className="text-caption text-muted">Ma&apos;lumot yo&apos;q</p>
          </Card>
          <Card className="flex flex-col justify-center gap-4">
            <div className="flex justify-between text-caption font-semibold">
              <span>21 / 45 kun</span>
              <span>47%</span>
            </div>
            <ProgressBar value={47} label="O'quv rejasi" />
            <ProgressBar value={100} label="Bajarilgan" tone="success" />
            <ProgressBar value={null} label="Ma'lumot yo'q" />
          </Card>
        </div>
      </Section>

      <Section title="Kartalar">
        <div className="grid gap-4 md:grid-cols-2">
          <Card>
            <CardHeader
              title="Bugungi reja"
              icon={<CalendarIcon />}
              action={<span className="text-muted">2026-11-15</span>}
            />
            <p className="text-body text-muted">Karta sarlavhasi, ikonka va o&apos;ng tomondagi amal.</p>
          </Card>
          <Card>
            <CardHeader title="So'nggi natijalar" icon={<TrophyIcon />} />
            <EmptyState
              compact
              icon={<FileTextIcon />}
              title="Hali natija yo'q"
              description="Birinchi mashqni bajarganingizdan keyin natijalar shu yerda ko'rinadi."
            />
          </Card>
        </div>
        <div className="grid grid-cols-2 gap-3 lg:grid-cols-4">
          {sections.map((s) => (
            <Card key={s.title} interactive padded={false} className="flex items-center gap-3 p-4">
              <span className={`grid size-12 place-items-center rounded-control [&_svg]:size-6 ${s.cls}`}>
                {s.icon}
              </span>
              <span>
                <span className="block font-semibold">{s.title}</span>
                <span className="ko block text-caption text-muted">({s.ko})</span>
              </span>
            </Card>
          ))}
        </div>
      </Section>

      <Section title="Forma elementlari">
        <Card>
          <FormDemo />
        </Card>
      </Section>

      <Section title="Modal va yuklanish holati">
        <div className="grid gap-4 md:grid-cols-2">
          <Card className="flex items-center justify-center">
            <ModalDemo />
          </Card>
          <Card className="flex flex-col gap-3">
            <Skeleton className="h-5 w-1/3" />
            <Skeleton className="h-11 w-full" />
            <Skeleton className="h-11 w-full" />
            <Skeleton className="h-11 w-2/3" />
          </Card>
        </div>
      </Section>
    </main>
  );
}
