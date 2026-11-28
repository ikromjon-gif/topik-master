# Dashboard metrikalari

Barcha hisoblar `src/lib/dashboard/metrics.ts` dagi sof funksiyalarda
(`computeDashboard`) va unit testlar bilan qoplangan
(`src/lib/dashboard/metrics.test.ts`, `npm test`).

**Asosiy qoida:** ma'lumot bo‘lmasa qiymat `null` bo‘ladi va UI "—" yoki
bo‘sh holatni ko‘rsatadi. Hech qanday raqam taxmin qilinmaydi yoki o‘ylab
topilmaydi.

| Ko‘rsatkich | Ta'rif | Ma'lumot yo‘q bo‘lsa |
|---|---|---|
| **Joriy kun** | bugun − rejaning boshlanish sanasi + 1 (1…45) | "Reja boshlanmagan" |
| **Bajarilgan kun** | shu kunning *barcha* topshiriqlari bajarilgan | — |
| **45 kunlik progress** (halqa) | bajarilgan kunlar / 45 | halqa bo‘sh, "—" |
| **Umumiy progress** | bajarilgan topshiriqlar / rejadagi barcha topshiriqlar | "—" |
| **Maqsad daraja** | foydalanuvchi maqsadi (standart: 4급, 150–189 ball) | standart qiymat |
| **Faol kun** | kamida bitta topshiriq bajarilgan yoki o‘qish sessiyasi bo‘lgan kun | — |
| **Ketma-ketlik** | bugundan (bugun faollik bo‘lmasa — kechadan) orqaga uzluksiz faol kunlar | "hali boshlanmagan" |
| **O‘qish kunlari** | faol kunlar soni | "—" |
| **Jami o‘qish vaqti** | barcha sessiyalar daqiqalari yig‘indisi | "—" |
| **Haftalik statistika** | oxirgi 7 kun (bugun bilan) bo‘yicha kunlik daqiqalar | bo‘sh holat |
| **So‘nggi natijalar** | yangidan eskiga, ko‘pi bilan 3 ta | "Hali natija yo‘q" |

**Taqvim holatlari:** bajarilgan (yashil ✓), qisman (to‘q sariq), o‘tkazib
yuborilgan (chizilgan), bugun (ko‘k), rejadagi kun (kulrang).

**Vaqt zonasi:** "bugun" serverda `Asia/Seoul` (`siteConfig.timeZone`)
bo‘yicha `YYYY-MM-DD` ko‘rinishida hisoblanadi va brauzerga prop sifatida
beriladi. Shu sababli server va brauzer bir xil kunni ko‘radi (hydration
farqi yo‘q).

## Ma'lumot manbai

`getDashboardData()` (`src/lib/dashboard/data.ts`) hozircha **ataylab bo‘sh**
kirish qaytaradi, chunki auth va Supabase Phase 4 da ulanadi. Shu sababli
`/dashboard` sahifasi barcha bloklarda bo‘sh holatni ko‘rsatadi.

Phase 4 da shu funksiya ichida `plan_tasks`, `task_completions`,
`study_sessions` va `test_attempts` o‘qiladi. UI va metrikalarni
o‘zgartirish shart bo‘lmaydi.

## Namuna sahifasi

`/design-system/dashboard` — dizaynni ma'lumot bilan tekshirish uchun
(noindex). Namuna kirish (`src/lib/dashboard/sample.ts`) ham
`computeDashboard` orqali hisoblanadi. Sahifada "Namuna ma’lumot — haqiqiy
statistika emas" degan ogohlantirish bor. Haqiqiy Dashboard bu fayldan
foydalanmaydi.
