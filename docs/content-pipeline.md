# Kontent pipeline

```
content/*.json ──► npm run content:validate ──► npm run content:seed ──► supabase/seed/content.sql ──► Supabase
                    (Zod sxemalar, bog‘lanishlar)   (idempotent upsert)
```

| Buyruq | Vazifasi |
|---|---|
| `npm run content:validate` | Barcha fayllarni `src/content/schema` bo‘yicha tekshiradi: sxema, takroriy key, manba va mavzu bog‘lanishlari, `reviewed_by`, o‘zbek tipografiyasi. Xato bo‘lsa 1 kod bilan chiqadi. |
| `npm run content:seed` | `supabase/seed/content.sql` ni yaratadi (`key` bo‘yicha upsert). |
| `npm run content:import-rebels <pdf>` | Rebels PDF → `content/vocab/rebels/lesson-NN.json` (talab: `pdftotext`). |

## Seed qoidalari

- Qayta ishga tushirish xavfsiz: o‘zgarmagan yozuvlarning versiyasi oshmaydi.
- **Mavjud yozuvning statusi seed orqali o‘zgartirilmaydi**, ya'ni tekshirilgan
  yozuv `draft` ga tushirilmaydi. Kontent o‘zgarsa, DB triggeri versiyani
  oshiradi va statusni `draft` ga qaytaradi.
- Yangi yozuv faylda `reviewed` bo‘lsa, `reviewed_by` (profiles.id,
  `content/meta/reviewers.json` da ro‘yxatda) bilan kiritiladi.
- `verified` fayldan hech qachon qabul qilinmaydi: uni faqat `korean_expert`
  Admin Panel orqali beradi (DB triggeri ham buni talab qiladi).

Supabase'ga yuklash: SQL Editor'da `supabase/seed/content.sql` ni ishga
tushiring yoki `psql "$DATABASE_URL" -f supabase/seed/content.sql`.

## Tekshiruvchi (reviewer) qo‘shish

1. Foydalanuvchi ilovada ro‘yxatdan o‘tadi (profil avtomatik yaratiladi).
2. Admin uning rolini o‘zgartiradi:
   `update public.profiles set role = 'editor' where id = '<uuid>';`
   (koreys tili mutaxassisi uchun `'korean_expert'`).
3. Fayl orqali ishlash uchun `content/meta/reviewers.json` ga qo‘shiladi:
   `{ "id": "<uuid>", "name": "Ism", "role": "editor" }`.

Kontent o‘quvchilarga faqat `reviewed` yoki `verified` holatida ko‘rinadi.

## Rebels importi (natija)

| | |
|---|---|
| Yozuvlar | 763 (8 dars): 692 ta so‘z, 71 ta ibora |
| Tarjimasi yo‘q | 5 ta (`review.notes` da belgilangan) |
| Misol gaplar | 53 ta (51 tasining muallif tarjimasi bor) |
| Shubhali tarjimalar | 3 ta (`떠넘기다`, `견제(하다)`, `취약`), `review.notes` da |
| Ajratilmagan qatorlar | 19 ta: `content/vocab/rebels/_unparsed.txt` (asosan 2-darsdagi alohida blokda berilgan misol tarjimalari; qo‘lda biriktirish kerak) |
| Holat | barchasi `draft` — tekshiruvdan keyin o‘quvchilarga ko‘rinadi |

Takroriy so‘zlar (bir nechta darsda uchraganlar) birinchi uchragan joyida
saqlanadi. So‘z turkumi (`pos`) va daraja (`level`) Rebels'da ko‘rsatilmagan,
shuning uchun `null` — tekshiruvda to‘ldiriladi.
