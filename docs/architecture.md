# Arxitektura qarorlari

## Kontent

| Qaror | Tafsilot |
|---|---|
| Status | `draft` → `reviewed` → `verified`. `verified` ni faqat `korean_expert` beradi; AI kontent ham shu qoidaga bo'ysunadi. DB triggeri (`content_before_write`) buni service role uchun ham majburiy qiladi. |
| Versiya | Kontent ustunlaridan `checksum` hisoblanadi. U o'zgarsa versiya +1 bo'ladi, status `draft` ga tushadi, snapshot `content_revisions` ga yoziladi. |
| Tekshiruv tarixi | Har bir status o'tishi `content_reviews` ga yoziladi (kim, qaysi versiya, qachon). |
| Alohida boshqaruv | Savol, variantlar (`question_options`), izohlar (`explanations`), tarjimalar (`translations`) va audio (`audio_assets`) — har biri o'z statusi va versiyasiga ega alohida jadvallar. |
| Nashr qilish | O'quvchi faqat `reviewed`/`verified` statusidagi va manbasi `granted` bo'lgan kontentni ko'radi (`is_published`). Savol nashr qilinishi uchun 4 ta variant, aynan 1 ta to'g'ri javob va umumiy izoh kerak. |
| Manbalar | Har bir yozuv `sources` ga bog'langan. Rasmiy TOPIK materiallari faqat `official_reference` havolasi; kontent ko'chirilmaydi. |
| Boshqaruv | Phase 1: `content/` fayllari → validate → seed. Keyin Admin Panel; ikkala yo'l bir xil Zod sxemalari va `key`/`checksum` dan foydalanadi. |

## Audio

| Qaror | Tafsilot |
|---|---|
| Asosiy strategiya | Sabaq uchun original native Korean speaker yozuvlari (`original_recording` manbasi + ovoz huquqi shartnomasi). |
| NIKL | `per_item_proof_required = true`: har bir fayl o'z `proof_url`'i bilan tekshiriladi. |
| TTS | Google TTS / Naver CLOVA keyingi bosqichda. `provider = 'tts'`, `tts_provider`, `tts_voice`, `tts_params` ustunlari tayyor. |
| Ikki o'q | Huquq (`rights_status`: unverified/verified/revoked) va sifat (`status`) alohida. Huquq maydonlari o'zgarsa, tasdiq avtomatik bekor bo'ladi. Huquqni faqat `admin` tasdiqlaydi. |
| Meros | `audio_assets` dagi huquq ustunlari NULL bo'lsa, qiymat `sources` dan olinadi (`audio_effective_rights`). Bitta manba ko'p audio faylga bog'lanadi. |
| Chiqarish | Faqat `publishable_audio_assets` view'i orqali: manba `granted` va muddati o'tmagan, huquq `verified`, `commercial_use` va `redistribution_allowed` = true, `proof_url` bor, attribution talabi bajarilgan, sifat `reviewed`/`verified`, transcript eskirmagan. |
| Storage | `audio` va `legal` bucket'lari yopiq. O'quvchilar audio'ni faqat server bergan qisqa muddatli signed URL orqali oladi. Shartnomalar `legal/` da, faqat admin uchun. |
| Shaxsiy ma'lumot | `voice_talents` (ism, aloqa) faqat admin'ga ko'rinadi; ilovada taxallus ishlatiladi. |

## TOPIK II PBT (format versiyasi `topik2-pbt-2014`)

| Bo'lim | Vaqt | Savollar | Ball |
|---|---|---|---|
| Tinglash | 60 daqiqa | 50 | 100 |
| Yozish | 50 daqiqa | 4 (51–54) | 100 |
| O'qish | 70 daqiqa | 50 | 100 |

Daraja chegaralari: 3급 120, 4급 150, 5급 190, 6급 230 (300 balldan).
Savol turlari ro'yxati (`content/meta/question-types.json`) topik.go.kr'dagi
rasmiy materiallar bilan solishtirib tasdiqlangandan keyin qo'shiladi.
