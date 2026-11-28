# Supabase muhitlari

| Muhit | Loyiha | Ref | Region |
|---|---|---|---|
| staging | `sabaq-staging` | `gdfvdvoyjtveyiuyfgqs` | ap-northeast-2 (Seul) |
| production | `sabaq-prod` | `gmglwubzhaicmgqhgbro` | ap-northeast-2 (Seul) |

Organization: `ikromjon Org` (Free plan — bir vaqtda 2 ta faol loyiha).

## Qoidalar

- Har bir migratsiya avval **staging**'da qo‘llanadi va tekshiriladi.
- Production'ga o‘zgarish faqat egasining tasdig‘idan keyin va oldin backup olingan holda.
- Maxfiy qiymatlar (DB paroli, service role key) repo'ga, chatga yoki `NEXT_PUBLIC_` o‘zgaruvchilariga yozilmaydi.
- Repo **public**: Actions artefaktiga ma’lumotli dump yuklanmaydi (uni har qanday GitHub foydalanuvchisi yuklab olishi mumkin).

## Migratsiyalar

Fayllar `supabase/migrations/<YYYYMMDDHHMMSS>_<nom>.sql` formatida — Supabase CLI shu versiyalar bo‘yicha qaysi migratsiya qo‘llanganini aniqlaydi.

## GitHub Actions orqali qo‘llash

1. Supabase Dashboard → loyiha → **Connect** → *Session pooler* ulanish satrini nusxalang (parolni o‘zingiz qo‘yasiz).
2. GitHub → repo **Settings → Environments** → `staging` va `production` muhitlarini yarating.
3. Har bir muhitga **secret** qo‘shing: `SUPABASE_DB_URL` = shu muhitning ulanish satri.
4. `production` muhitiga **Required reviewers** → o‘zingizni qo‘shing.
5. **Actions → Supabase DB → Run workflow**: avval `dry-run`, keyin `apply` (kerak bo‘lsa `seed`).

## Ilova sozlamasi

`.env.local` (va Vercel'dagi Environment Variables):

```
NEXT_PUBLIC_SUPABASE_URL=https://<ref>.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=<publishable / anon key>
```

Publishable kalit ochiq bo‘lishi mumkin — himoya RLS'da. Service role key ilovada ishlatilmaydi.
