import Link from "next/link";
import { UserIcon } from "@/components/ui/icons";
import { cn } from "@/lib/cn";

/**
 * Profilga havola. Auth ulanmaguncha umumiy ikonka ko‘rsatiladi;
 * keyin `initial` (ism bosh harfi) beriladi.
 */
export function UserAvatarLink({
  initial,
  size = "md",
  className,
}: {
  initial?: string;
  size?: "md" | "lg";
  className?: string;
}) {
  return (
    <Link
      href="/profile"
      aria-label="Profil"
      title="Profil"
      className={cn(
        "grid shrink-0 place-items-center rounded-full bg-primary font-semibold text-primary-foreground",
        "transition-colors duration-150 hover:bg-primary-hover",
        size === "md" ? "size-11 [&_svg]:size-5" : "size-12 [&_svg]:size-6",
        className,
      )}
    >
      {initial ? <span aria-hidden="true">{initial}</span> : <UserIcon />}
    </Link>
  );
}
