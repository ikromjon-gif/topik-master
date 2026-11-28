# Sabaq — TOPIK II tayyorgarlik

O'zbek tilida TOPIK II (3급–6급) imtihoniga tayyorgarlik platformasi.
Asosiy maqsad: 45 kunlik reja bilan 4급 (150–189 ball).

## Stack

- Next.js 15 (App Router), React 19, TypeScript (strict)
- Tailwind CSS v4
- Supabase (Postgres, Auth, Storage) — Phase 4 da ulanadi

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
  config/site.ts  platforma nomi va asosiy sozlamalar
  components/     ui/, layout/, dashboard/
  content/schema/ kontent validatsiya sxemalari (keyingi bosqich)
  lib/            yordamchi kodlar
content/          o'quv materiallari (qarang: content/README.md)
supabase/
  migrations/     0001_content_core, 0002_rights_and_audio
  tests/          migration testlari
docs/             arxitektura qarorlari
```

Arxitektura va kontent qoidalari: [docs/architecture.md](docs/architecture.md).
