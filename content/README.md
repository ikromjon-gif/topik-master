# content/

Sabaq o'quv materiallari. Birinchi bosqichda kontent shu papkadagi fayllar orqali
boshqariladi va seed skripti bilan Supabase'ga yuklanadi. Keyin Admin Panel
qo'shilganda haqiqat manbai DB ga o'tadi, `export` skripti esa bu papkaga
zaxira nusxa yozadi.

## Qoidalar

- **Har bir yozuvning barqaror `key`i bor** (`VOC-000001`, `GRM-000001`,
  `PSG-…`, `QST-…`, `WRT-…`, `AUD-…`). Key hech qachon o'zgarmaydi va qayta
  ishlatilmaydi.
- **Har bir yozuv manbaga bog'langan** (`sources/sources.json`). Litsenziyasi
  `granted` bo'lmagan manba kontenti foydalanuvchiga ko'rinmaydi.
- **Status:** `draft` → `reviewed` → `verified`.
  - `verified` ni faqat `meta/reviewers.json` ro'yxatidagi koreys tili
    mutaxassisi (`korean_expert`) beradi.
  - AI yaratgan kontent (`authored_by: "ai"`) avtomatik ravishda hech qachon
    `verified` bo'lmaydi.
  - Seed fayldagi `verified` statusini qabul qilmaydi. Bu status faqat
    Admin Panel yoki maxsus skript orqali, tekshiruvchi va sana bilan yoziladi.
- **Kontent o'zgarsa,** versiya oshadi va status `draft` ga qaytadi
  (DB triggeri buni majburiy qiladi).
- **Rasmiy TOPIK savollari, audio va matnlari ko'chirilmaydi.** Ulardan faqat
  havola (`official_reference`) sifatida foydalaniladi.
- **O‘zbek tipografiyasi:** oʻ/gʻ uchun `‘` (U+2018), tutuq belgisi uchun
  `’` (U+2019). ASCII `'` va `ʻ` (U+02BB) ishlatilmaydi (qarang:
  `docs/design-system.md`).
- **Audio fayllar git'da saqlanmaydi.** Ular yopiq `audio` bucket'ida turadi,
  bu yerda faqat metama'lumot (`media/`) saqlanadi.

## Tuzilma

```
meta/          reviewers.json, topics.json, question-types.json
sources/       manbalar va litsenziya holati
vocab/         level-3 … level-6 / {topic}.json
grammar/       level-3 … level-6 / {GRM-key}.json
passages/      listening/ va reading/ matnlar, transcriptlar
questions/     listening/ va reading/ / {type_code}/ {QST-key}.json
writing/       51/ 52/ 53/ 54/
rubrics/       yozish baholash mezonlari
sets/          mashq to'plamlari
mock-tests/    sinov imtihonlari
media/         audio-assets.json, audio-links.json, voice-talents.json (faqat taxalluslar)
_imports/      xom import natijalari (seed'ga kirmaydi)
```

`meta/question-types.json` savol turlari rasmiy sahifada tasdiqlangandan
keyin qo'shiladi.
