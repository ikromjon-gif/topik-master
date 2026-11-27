import { Card } from "@/components/ui/card";
import { FlameIcon } from "@/components/ui/icons";
import { cn } from "@/lib/cn";

/** Ketma-ket o‘qish kartasi. Xabar haqiqiy holatga qarab tanlanadi. */
export function StreakCard({
  streak,
  atRisk,
  className,
}: {
  streak: number | null;
  atRisk: boolean;
  className?: string;
}) {
  const { title, text } =
    streak === null
      ? { title: "Ketma-ketlik hali boshlanmagan", text: "Birinchi darsni bajaring — ketma-ket kunlar shu yerda hisoblanadi." }
      : streak === 0
        ? { title: "Ketma-ketlik uzildi", text: "Bugun dars qilib, yangi ketma-ketlikni boshlang." }
        : atRisk
          ? { title: `${streak} kun ketma-ket o‘qish`, text: "Bugun hali dars qilinmadi — ketma-ketlikni saqlab qoling." }
          : { title: `${streak} kun ketma-ket o‘qish!`, text: "Ajoyib! Shu tempda davom eting." };

  return (
    <Card className={cn("flex items-center gap-4", className)}>
      <span
        className={cn(
          "grid size-14 shrink-0 place-items-center rounded-card",
          streak ? "bg-warning-soft text-streak" : "bg-surface-muted text-subtle",
        )}
      >
        <FlameIcon className="size-8" />
      </span>
      <div className="min-w-0">
        <p className="text-heading font-bold text-foreground">{title}</p>
        <p className="text-caption text-muted">{text}</p>
      </div>
    </Card>
  );
}
