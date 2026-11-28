# Design system

Ko'rgazma sahifasi: `/design-system` (qidiruv tizimlarida indekslanmaydi).

## Tokenlar

Ranglar `src/app/globals.css` dagi CSS o'zgaruvchilari orqali beriladi va
`.dark` klassi bilan almashadi. Komponentlarda xom Tailwind ranglari
(`blue-600` va h.k.) o'rniga faqat semantik klasslardan foydalaning:

| Guruh | Klasslar |
|---|---|
| Fon va sirt | `bg-background`, `bg-surface`, `bg-surface-muted`, `bg-surface-sunken` |
| Chegara | `border-border`, `border-border-strong` |
| Matn | `text-foreground`, `text-muted`, `text-subtle` |
| Asosiy (Blue) | `bg-primary`, `text-primary-foreground`, `bg-primary-soft`, `text-primary-soft-foreground` |
| Holat | `success`, `warning`, `danger` (+ `-soft`), `streak` |
| Bo'limlar | `listening`, `reading`, `writing`, `grammar` (+ `-soft`) |

Tipografiya: `text-display`, `text-title`, `text-heading`, `text-body`, `text-caption`.
Radius: `rounded-control` (12px), `rounded-card` (16px), `rounded-panel` (20px).
Soya: `shadow-card`, `shadow-raised`. Spacing — Tailwind'ning 4px shkalasi.

Koreyscha matnga `ko` klassini (yoki `lang="ko"`) qo'shing: so'zlar o'rtasidan uzilmaydi.

**Kontrast:** asosiy matn, muted matn, tugmalar va badge'lar ikkala rejimda
WCAG AA (≥ 4.5:1) talabiga javob beradi.

## Tema

- `ThemeProvider` — `light` / `dark` / `system`, `localStorage` (`sabaq-theme`).
  localStorage ishlamasa, tizim sozlamasi ishlatiladi.
- `themeInitScript` sahifa chizilishidan oldin `.dark` klassini qo'yadi, shuning uchun miltillash bo'lmaydi.
- `ThemeToggle` — header uchun tayyor tugma.

## Komponentlar (`src/components/ui`)

| Komponent | Izoh |
|---|---|
| `Button`, `buttonClasses()` | primary / secondary / outline / ghost / danger; sm / md / lg; `loading`. `buttonClasses()` havolalar uchun |
| `IconButton` | `label` majburiy (ekran o'quvchilar uchun), `dot` — bildirishnoma nuqtasi |
| `Card`, `CardHeader`, `CardContent` | `interactive` — bosiladigan kartalar uchun hover |
| `Input` | label, hint, error, leadingIcon; `aria-describedby` avtomatik |
| `Checkbox` | native input asosida, label va description bilan |
| `Modal` | native `<dialog>`: ESC, fokus, backdrop; mobile'da pastdan sheet |
| `Badge`, `VerificationBadge` | `verified` → "Mutaxassis tasdiqlagan", qolganlari → "Tekshirilmoqda" |
| `ProgressRing`, `ProgressBar` | `value={null}` → "Ma'lumot yo'q" (taxminiy qiymat ko'rsatilmaydi) |
| `StatTile` | ko'rsatkich kartasi; `value={null}` → "—" |
| `EmptyState` | ma'lumot yo'q holati |
| `Skeleton` | yuklanish holati |
| `Logo` | vaqtinchalik "S" belgisi |
| `icons.tsx` | inline SVG ikonkalar (tashqi kutubxonasiz) |

## Shrift: Pretendard

Barcha sahifalarda asosiy shrift — **Pretendard Variable** (SIL OFL 1.1,
qarang: `THIRD_PARTY_NOTICES.md`). Bitta shrift o‘zbek lotin va koreys Hangul
yozuvlarini bir xil uslubda chizadi, shuning uchun desktop, Android va iOS'da
ko‘rinish bir xil bo‘ladi (tizim shriftiga bog‘liq emas).

**Yuklanish (performance):**

- Muallifning `dynamic-subset` versiyasi ishlatiladi: shrift 92 ta kichik
  bo‘lakka (`unicode-range`) bo‘lingan va brauzer faqat sahifada uchragan
  belgilar bo‘laklarini yuklaydi. Masalan, `/sections` sahifasi 92 tadan
  8 ta bo‘lak (~206 KB) yuklaydi.
- Fayllar build vaqtida hash nomi bilan `/_next/static/media/` ga
  joylanadi va `Cache-Control: immutable` (1 yil) bilan keshlanadi.
- `font-display: swap`: matn darhol zaxira shriftda ko‘rinadi.
- **"Pretendard Fallback"** — `Arial`/`Helvetica Neue`/`Roboto` asosidagi
  zaxira shrift; `size-adjust`, `ascent-override`, `descent-override`
  Pretendard o‘lchamlariga moslangan, shuning uchun shrift almashganda matn
  siljimaydi (CLS).

**Fallback zanjiri:** `Pretendard Variable` → `Pretendard` → `Pretendard Fallback`
→ `-apple-system`, `BlinkMacSystemFont`, `system-ui`, `Roboto`,
`Helvetica Neue`, `Segoe UI` → Hangul uchun `Apple SD Gothic Neo`,
`Noto Sans KR`, `Malgun Gothic` → `sans-serif`.

## O‘zbek tipografiyasi

| Belgi | Kod | Qayerda |
|---|---|---|
| `‘` | U+2018 | oʻ, gʻ: **o‘qish, g‘oya, O‘zbek** |
| `’` | U+2019 | tutuq belgisi: **ma’lumot, ta’lim, san’at** |

ASCII `'` va `ʻ` (U+02BB) ishlatilmaydi: `ʻ` Pretendard subset'ida yo‘q va
tizim shriftida boshqacha ko‘rinadi. JSX'da `&apos;` kerak bo‘lmaydi —
to‘g‘ridan-to‘g‘ri `‘` / `’` yoziladi.

## Layout (`src/components/layout`)

| Kenglik | Navigatsiya | Header |
|---|---|---|
| < 768px | `BottomNav` (5 ta tab, iOS safe-area) | `MobileHeader` (logo, qidiruv, bildirishnoma, tema, profil) |
| 768–1279px | `Sidebar` rail (80px, faqat ikonka) | `DesktopHeader` (sarlavha, qidiruv, amallar) |
| ≥ 1280px | `Sidebar` to‘liq (256px) + maqsad kartasi | `DesktopHeader` |

| Komponent | Izoh |
|---|---|
| `AppShell` | umumiy karkas; skip link, `<main id="main-content">` |
| `Sidebar` | `items` prop; aktiv punkt `aria-current="page"`; rail'da nom ekran o‘quvchilar uchun saqlanadi |
| `DesktopHeader` | sahifa sarlavhasi (h1) navigatsiya konfiguratsiyasidan olinadi |
| `MobileHeader` | logotip va tezkor amallar |
| `BottomNav` | `items` prop; bo‘lim sahifalarida "Bo‘limlar" aktiv bo‘ladi |
| `PageContainer` | maksimal kenglik (1440px) va padding; mobile'da h1 (`hideMobileTitle`) |
| `SearchField` | GET forma → `/search?q=` (JavaScript'siz ham ishlaydi) |
| `UserAvatarLink` | profilga havola; auth ulangach `initial` beriladi |
| `RoutePlaceholder` | hali qurilmagan bo‘lim uchun ochiq "tayyorlanmoqda" holati |

Navigatsiya bitta joyda: `src/config/navigation.tsx` (`primaryNav`,
`mobileNav`, `sectionNav`). Yangi bo‘lim qo‘shish uchun shu faylga yozuv
qo‘shiladi.
