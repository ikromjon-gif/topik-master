import type { ReactNode } from "react";
import {
  AlertTriangleIcon,
  BarChartIcon,
  BellIcon,
  BookOpenIcon,
  CalendarIcon,
  FileTextIcon,
  HeadphonesIcon,
  HomeIcon,
  LayersIcon,
  PenIcon,
  TrophyIcon,
  UserIcon,
  SearchIcon,
} from "@/components/ui/icons";

export type NavItem = {
  href: string;
  label: string;
  /** Koreyscha nom (bo'limlar uchun), masalan 듣기. */
  labelKo?: string;
  icon: ReactNode;
  /** Header sarlavhasi; berilmasa `label` ishlatiladi. */
  title?: string;
  /** Sahifa qisqacha tavsifi (placeholder va metadata uchun). */
  description?: string;
};

/** Desktop Sidebar va tablet rail'dagi asosiy navigatsiya. */
export const primaryNav: NavItem[] = [
  {
    href: "/dashboard",
    label: "Bosh sahifa",
    icon: <HomeIcon />,
    description: "Bugungi reja, progress va tezkor kirish.",
  },
  {
    href: "/plan",
    label: "O‘quv rejasi",
    icon: <CalendarIcon />,
    description: "45 kunlik TOPIK II tayyorgarlik rejasi.",
  },
  {
    href: "/vocabulary",
    label: "Lug‘at",
    labelKo: "단어장",
    icon: <BookOpenIcon />,
    description: "3급–6급 so‘zlari, o‘zbekcha tarjima va misollar bilan.",
  },
  {
    href: "/grammar",
    label: "Grammatika",
    labelKo: "문법",
    icon: <LayersIcon />,
    description: "Grammatik qoidalar: formula, tushuntirish va misollar.",
  },
  {
    href: "/listening",
    label: "Tinglab tushunish",
    labelKo: "듣기",
    icon: <HeadphonesIcon />,
    description: "TOPIK II formatidagi tinglash mashqlari.",
  },
  {
    href: "/reading",
    label: "O‘qib tushunish",
    labelKo: "읽기",
    icon: <FileTextIcon />,
    description: "TOPIK II formatidagi o‘qish matnlari va testlar.",
  },
  {
    href: "/writing",
    label: "Yozish",
    labelKo: "쓰기",
    icon: <PenIcon />,
    description: "Yozish 51–54: topshiriqlar va baholash mezonlari.",
  },
  {
    href: "/mock-tests",
    label: "Sinov imtihoni",
    labelKo: "모의고사",
    icon: <TrophyIcon />,
    description: "Vaqt bilan to‘liq sinov imtihonlari.",
  },
  {
    href: "/mistakes",
    label: "Xatolarim",
    icon: <AlertTriangleIcon />,
    description: "Xato qilgan savollaringizni qayta ishlash.",
  },
  {
    href: "/stats",
    label: "Statistika",
    icon: <BarChartIcon />,
    description: "Kunlik va haftalik o‘qish statistikasi.",
  },
];

/** Mobile pastki navigatsiya (5 ta). */
export const mobileNav: NavItem[] = [
  { href: "/dashboard", label: "Bosh sahifa", icon: <HomeIcon /> },
  { href: "/plan", label: "Reja", icon: <CalendarIcon />, title: "O‘quv rejasi" },
  {
    href: "/sections",
    label: "Bo‘limlar",
    icon: <LayersIcon />,
    description: "Lug‘at, grammatika, tinglash, o‘qish, yozish va sinov imtihoni.",
  },
  { href: "/stats", label: "Statistika", icon: <BarChartIcon /> },
  { href: "/profile", label: "Profil", icon: <UserIcon />, description: "Hisob va sozlamalar." },
];

/** Navigatsiyada ko'rinmaydigan, lekin header sarlavhasi kerak bo'lgan sahifalar. */
export const secondaryRoutes: NavItem[] = [
  { href: "/search", label: "Qidiruv", icon: <SearchIcon />, description: "So‘z, grammatika va darslarni qidirish." },
  { href: "/notifications", label: "Bildirishnomalar", icon: <BellIcon />, description: "Eslatmalar va yangiliklar." },
];

/** Mobile "Bo'limlar" sahifasida chiqadigan bo'limlar. */
export const sectionNav: NavItem[] = primaryNav.filter((item) => item.labelKo);

const allRoutes = [...primaryNav, ...mobileNav, ...secondaryRoutes];

export function isActivePath(pathname: string, href: string): boolean {
  return pathname === href || pathname.startsWith(`${href}/`);
}

/** Joriy yo'l uchun navigatsiya yozuvini topadi (eng uzun mos keluvchi). */
export function findRoute(pathname: string): NavItem | undefined {
  return allRoutes
    .filter((item) => isActivePath(pathname, item.href))
    .sort((a, b) => b.href.length - a.href.length)[0];
}

/** Mobile pastki navigatsiyada qaysi tab aktiv: bo'lim sahifalari "Bo'limlar"ga tegishli. */
export function activeMobileTab(pathname: string): string | undefined {
  const direct = mobileNav.find((item) => isActivePath(pathname, item.href));
  if (direct) return direct.href;
  if (sectionNav.some((item) => isActivePath(pathname, item.href))) return "/sections";
  if (isActivePath(pathname, "/mistakes")) return "/sections";
  return undefined;
}
