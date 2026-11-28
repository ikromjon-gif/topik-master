# Tinglash yozuvlari rejasi

`content/listening/*.json` dagi ssenariylar hozircha **matn ko‘rinishida** (draft). Platforma tinglash savolini faqat huquqi tasdiqlangan audio bog‘langandan keyin ko‘rsatadi (`publishable_audio_assets`), shuning uchun bu savollar hozir foydalanuvchiga chiqmaydi.

## Yozishdan oldin

1. Ssenariyni koreys tili mutaxassisi tekshiradi → `review.status: reviewed`.
2. Ovoz egasi (native Korean speaker) bilan yozma shartnoma: tijoriy foydalanish, platformada tarqatish, muallif nomini ko‘rsatish shartlari. Shartnoma `legal` bucket'iga yuklanadi va `voice_talents` yozuviga bog‘lanadi.
3. Har bir rol uchun `speakers[].gender` ga mos ovoz tanlanadi (ayol/erkak).

## Texnik talablar

| Parametr | Master | Veb |
|---|---|---|
| Format | WAV, 48 kHz, 24-bit, mono | MP3, 44.1 kHz, 128 kbps, mono |
| Balandlik | −23 LUFS atrofida | −16 LUFS |
| Pauza | Savoldan oldin va keyin 1 soniya | Masterdan olinadi |

Shovqinsiz xonada, bitta mikrofonda yoziladi. Har bir ssenariy kamida 2 marta yoziladi, eng tozasi tanlanadi.

## Nomlash

```
AUD-L-0001-v1.wav   # master
AUD-L-0001-v1.mp3   # veb
```

`AUD-L-0001` ssenariy `PSG-L-0001` ga mos keladi. Qayta yozilsa versiya oshiriladi (`-v2`).

## Bazaga qo‘shish

`audio_assets` yozuvi: `source` (original_recording), `license`, `commercial_use`, `redistribution_allowed`, `attribution_required`, `proof_url` (shartnoma), `voice_talent_id`. Keyin `audio_links` orqali savol yoki matnga bog‘lanadi. Huquq maydonlaridan biri tasdiqlanmasa, `guard_audio_rights` nashrga yo‘l qo‘ymaydi.
