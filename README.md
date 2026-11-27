# Sabaq — TOPIK II tayyorgarlik

O'zbek tilida TOPIK II (3급–6급) imtihoniga tayyorgarlik platformasi.
Asosiy maqsad: 45 kunlik reja bilan 4급 (150–189 ball).

## Stack

- Next.js 15 (App Router), React 19, TypeScript (strict)
- Tailwind CSS v4
- Supabase (Postgres, Auth, Storage) — Phase 4 da ulanadi
- Shrift: Pretendard (SIL OFL 1.1) — qarang: [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)

## Ishga tushirish

```bash
npm install
cp .env.example .env.local   # Supabase kalitlari keyinroq kerak bo'ladi
npm run dev
```

| Buyruq | Vazifasi |
|---|---|
| `npm run dev` | lokal server |
| `npm run build` | production build |
| `npm run lint` | ESLint |
| `npm run typecheck` | TypeScript tekshiruvi |
| `npm run db:test` | migration'larni vaqtinchalik lokal PostgreSQL'da sinash (PostgreSQL 15+ kerak, root bo'lmagan foydalanuvchi) |

## Tuzilma

```
src/
  app/            sahifalar (App Router)
  config/         site.ts (nom, sozlamalar), navigation.tsx (navigatsiya)
  components/     ui/, layout/ (AppShell, Sidebar, Header'lar, BottomNav), theme/
  content/schema/ kontent validatsiya sxemalari (keyingi bosqich)
  lib/            yordamchi kodlar
content/          o'quv materiallari (qarang: content/README.md)
supabase/
  migrations/     0001_content_core, 0002_rights_and_audio
  tests/          migration testlari
docs/             arxitektura, design system, litsenziyalar
```

Arxitektura va kontent qoidalari: [docs/architecture.md](docs/architecture.md).
