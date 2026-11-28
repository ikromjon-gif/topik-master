# Integratsiya testi (uchidan-uchigacha)

Haqiqiy Supabase loyihasisiz butun oqimni sinaydi:
**Next.js ilova → mock Supabase (Auth + PostgREST) → haqiqiy PostgreSQL (migration'lar, RLS, seed)**.

- `mock_supabase.py` — Supabase Auth va PostgREST'ning ilova ishlatadigan qismi. Har bir so‘rov
  PostgreSQL'da `authenticated` roli va `request.jwt.claim.sub` bilan bajariladi, shuning uchun
  **RLS qoidalari haqiqiy** holda tekshiriladi.
- `fixture.sql` — FAQAT test uchun: editor foydalanuvchi, reviewed reja shabloni va 21 ta so‘z,
  3 ta "(TEST)" o‘qish savoli. Ilova kontentiga kirmaydi.
- `e2e_test.py` — 35 ta tekshiruv: ro‘yxatdan o‘tish, login, himoyalangan sahifalar, rejani boshlash,
  topshiriqni belgilash, lug‘at (faqat reviewed, mualliflik), o‘qish mashqi va baholash,
  statistika, xatolar, profil, chiqish, maxfiylik (ikkinchi foydalanuvchi), mobile overflow, axe.

```bash
sudo AXE_PATH=/path/to/axe.min.js CHROME_PATH=/usr/bin/google-chrome bash tests/integration/run.sh
```

Mock haqiqiy Supabase emas: email tasdiqlash, parolni tiklash, storage yuklash kabi qismlar
haqiqiy Supabase loyihasida alohida tekshirilishi kerak.
