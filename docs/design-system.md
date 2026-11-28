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

## Shrift

Hozircha tizim shriftlari ishlatiladi: macOS va iOS'da SF Pro va Apple SD Gothic Neo,
Windows'da Segoe UI va Malgun Gothic. Barcha qurilmalarda bir xil ko'rinish uchun
Pretendard (SIL OFL, lotin va koreys yozuvlari) qo'shish tavsiya etiladi. Bu bitta
npm paketi bo'lgani uchun alohida tasdiq kerak.
