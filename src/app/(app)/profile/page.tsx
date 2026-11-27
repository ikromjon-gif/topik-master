import Link from "next/link";
import { PageContainer } from "@/components/layout/page-container";
import { routeMetadata } from "@/components/layout/route-placeholder";
import { ProfileForm, ThemeSelector } from "@/components/profile/profile-forms";
import { Badge } from "@/components/ui/badge";
import { buttonClasses } from "@/components/ui/button";
import { Card, CardHeader } from "@/components/ui/card";
import { InfoIcon, SunIcon, UserIcon } from "@/components/ui/icons";
import { signOut } from "@/lib/learning/actions";
import { getLearningContext } from "@/lib/learning/queries";

export const metadata = routeMetadata("/profile");
export const dynamic = "force-dynamic";

const ROLE_LABEL = { learner: "O‘quvchi", editor: "Muharrir", korean_expert: "Koreys tili mutaxassisi", admin: "Administrator" } as const;

export default async function ProfilePage() {
  const ctx = await getLearningContext();

  return (
    <PageContainer title="Profil" description="Hisob va sozlamalar.">
      <div className="grid gap-5 lg:grid-cols-2">
        <Card>
          <CardHeader title="Hisob" icon={<UserIcon />} />
          {ctx.state === "signed-in" ? (
            <div className="flex flex-col gap-5">
              <div className="flex flex-wrap items-center gap-2 text-body">
                <span className="text-foreground">{ctx.email ?? "—"}</span>
                {ctx.profile && <Badge tone={ctx.profile.role === "learner" ? "neutral" : "primary"} size="sm">{ROLE_LABEL[ctx.profile.role]}</Badge>}
              </div>
              <ProfileForm displayName={ctx.profile?.display_name ?? null} targetLevel={ctx.profile?.target_level ?? 4} />
              <form action={signOut} className="border-t border-border pt-4">
                <button type="submit" className={buttonClasses({ variant: "outline" })}>
                  Chiqish
                </button>
              </form>
            </div>
          ) : ctx.state === "signed-out" ? (
            <div className="flex flex-col items-start gap-3">
              <p className="text-body text-muted">Siz tizimga kirmagansiz.</p>
              <Link href="/login?next=/profile" className={buttonClasses()}>
                Kirish
              </Link>
            </div>
          ) : (
            <p className="flex gap-2 text-body text-muted">
              <InfoIcon className="mt-1 size-4 shrink-0" />
              Hisob funksiyalari Supabase ulanganidan keyin ishlaydi.
            </p>
          )}
        </Card>

        <Card>
          <CardHeader title="Ko‘rinish" icon={<SunIcon />} description="Tanlov shu qurilmada saqlanadi." />
          <ThemeSelector />
        </Card>
      </div>
    </PageContainer>
  );
}
