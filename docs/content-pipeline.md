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

## Original kontent (Phase 8)

Barcha yozuvlar `SRC-SABAQ-ORIGINAL`, `authored_by: ai`, `status: draft`. Mutaxassis ko‘rib chiqmaguncha o‘quvchiga ko‘rinmaydi.

| Fayl | Tarkib |
|---|---|
| `content/meta/question-types.json` | 13 savol turi (tinglash 4, o‘qish 6, yozish 3), TOPIK II PBT formati bo‘yicha |
| `content/grammar/level-3.json`, `level-4.json` | 30 grammatika (3급 15, 4급 15), har birida formula, o‘zbekcha izoh, 3 misol |
| `content/reading/set-01.json` | 20 o‘qish savoli (1–18 raqamlari), 3 matn; joy nomi to‘qima (새솔시) |
| `content/listening/set-01.json` | 6 tinglash ssenariysi va savoli (4, 5, 9, 10, 13, 17); audio yo‘q |
| `content/listening/RECORDING-PLAN.md` | Native speaker yozuvi, format, nomlash va huquq tartibi |
| `content/writing/set-01.json` | 3 rubrika (51–52, 53, 54) va 8 topshiriq namunaviy javob bilan |

Qo‘shimcha tekshiruvlar (`npm run content:validate`):

- har savolda 4 variant va aynan 1 to‘g‘ri javob; o‘zbekcha izoh majburiy;
- savol raqami tur oralig‘ida; tinglash savoli ssenariysiz bo‘lmaydi;
- rubrika mezonlari yig‘indisi = maksimal ball = topshiriq bali; 51 va 52 bitta rubrikada;
- namunaviy javob uzunligi belgilar bo‘yicha (53: 200–300, 54: 600–700).

53-topshiriq ma’lumotlari mashq uchun o‘ylab topilgan va sahifada shunday belgilanadi. Rubrikalar Sabaq’ning o‘z qoralamasi — rasmiy TOPIK baholash mezonlari bilan solishtirilishi kerak.
