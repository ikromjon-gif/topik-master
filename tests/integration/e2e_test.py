"""Sabaq: uchidan-uchigacha integratsiya testi (Next.js + mock Supabase + haqiqiy PostgreSQL RLS)."""
import asyncio, re, datetime, zoneinfo, time
from playwright.async_api import async_playwright, expect

BASE = "http://localhost:3200"
import os
AXE = open(os.environ.get("AXE_PATH", "/tmp/axe/node_modules/axe-core/axe.min.js")).read()
SHOTS = os.environ.get("SHOTS_DIR", "/tmp")
TODAY = datetime.datetime.now(zoneinfo.ZoneInfo("Asia/Seoul")).date().isoformat()
EMAIL = f"talaba{int(time.time())}@e2e.test"
EMAIL2 = f"boshqa{int(time.time())}@e2e.test"
PW = "parol-12345"
res, errs = [], []
def check(n, c, d=""):
    res.append((bool(c), n, d)); print(("✅" if c else "❌"), n, ("— " + str(d)) if (d and not c) else "", flush=True)

async def axe(pg, label, bucket):
    await pg.add_script_tag(content=AXE)
    v = await pg.evaluate("axe.run(document,{runOnly:['wcag2a','wcag2aa','wcag21aa','best-practice']}).then(r=>r.violations.map(v=>v.id+'('+v.nodes.length+'): '+v.nodes[0].target.join(' ')))")
    if v: bucket.append(f"{label}: {v}")

async def main():
    async with async_playwright() as p:
        b = await p.chromium.launch(executable_path=os.environ.get("CHROME_PATH") or None, args=["--no-sandbox"])
        ctx = await b.new_context(viewport={"width": 1440, "height": 900})
        pg = await ctx.new_page()
        pg.on("console", lambda m: errs.append(f"{pg.url}: {m.text}") if m.type == "error" else None)
        pg.on("pageerror", lambda e: errs.append(f"{pg.url}: {e}"))
        ax = []

        # 1. Himoya: login'siz → /login
        await pg.goto(BASE + "/dashboard", wait_until="networkidle")
        check("Login'siz /dashboard → /login?next=/dashboard", "/login" in pg.url and "next=%2Fdashboard" in pg.url, pg.url)
        check("Backend sozlangan: ‘baza ulanmagan’ banneri yo‘q", await pg.locator("text=Ma’lumotlar bazasi ulanmagan").count() == 0)
        await axe(pg, "login", ax)

        # 2. Ro‘yxatdan o‘tish
        await pg.get_by_role("tab", name="Ro‘yxatdan o‘tish").click()
        await pg.get_by_label("Email").fill(EMAIL)
        await pg.get_by_label("Parol").fill(PW)
        await pg.get_by_role("button", name="Ro‘yxatdan o‘tish").last.click()
        await pg.wait_for_url("**/dashboard", timeout=20000)
        check("Ro‘yxatdan o‘tish → Dashboard", pg.url.endswith("/dashboard"), pg.url)
        main = pg.locator("main div.md\\:grid")
        t = await main.inner_text()
        check("Yangi foydalanuvchi: bo‘sh holat, soxta raqam yo‘q", "Reja boshlanmagan" in t and not re.search(r"\d+\s?%", t), re.findall(r"\d+\s?%", t))

        # 3. Rejani boshlash
        await pg.goto(BASE + "/plan", wait_until="networkidle")
        check("Reja: boshlash formasi (shablon reviewed)", await pg.get_by_role("button", name="Rejani boshlash").count() == 1)
        await axe(pg, "plan-start", ax)
        await pg.get_by_role("button", name="Rejani boshlash").click()
        await pg.wait_for_selector("text=1-kun / 45", timeout=20000)
        pt = await pg.locator("main").inner_text()
        check("Reja boshlandi: 1-kun / 45, 7 hafta", "1-kun / 45" in pt and "7-hafta" in pt)
        await axe(pg, "plan-active", ax)

        # 4. Dashboard: bugungi topshiriqlar va belgilash
        await pg.goto(BASE + "/dashboard", wait_until="networkidle")
        t = await main.inner_text()
        check("Dashboard: 1-kun / 45 kun", "1-kun" in t and "/ 45 kun" in t, t[:300])
        toggles = main.get_by_role("button", name=re.compile("bajarildi deb belgilash"))
        n_tasks = await toggles.count()
        check("Dashboard: 1-kun topshiriqlari (3 ta) belgilanadigan", n_tasks == 3, n_tasks)
        check("Dashboard: 1-kun lug‘at topshirig‘i (Siyosat va farovonlik — 1-qism)", "Siyosat va farovonlik — 1-qism" in t)
        await toggles.first.click()
        await pg.wait_for_load_state("networkidle")
        await pg.wait_for_timeout(800)
        await pg.reload(wait_until="networkidle")
        t = await main.inner_text()
        pressed = await main.get_by_role("button", name=re.compile("bajarilmagan deb belgilash")).count()
        check("Belgilash saqlandi (sahifa qayta yuklangandan keyin ham)", pressed == 1, pressed)
        check("Ketma-ketlik: 1 kun (haqiqiy faollikdan)", "1 kun" in t)
        check("Umumiy progress: 1 / 126 → 1%", "1%" in t)
        await axe(pg, "dashboard-signedin", ax)
        # bekor qilish
        await main.get_by_role("button", name=re.compile("bajarilmagan deb belgilash")).first.click()
        await pg.wait_for_timeout(800); await pg.reload(wait_until="networkidle")
        check("Belgini qaytarish ishlaydi", await main.get_by_role("button", name=re.compile("bajarilmagan deb belgilash")).count() == 0)
        await main.get_by_role("button", name=re.compile("bajarildi deb belgilash")).first.click()
        await pg.wait_for_timeout(800)

        # 5. Lug‘at: faqat reviewed, mualliflik
        await pg.goto(BASE + "/vocabulary", wait_until="networkidle")
        cards = pg.locator("main ul li h2, main ul li p[lang=ko].text-heading")
        vt = await pg.locator("main").inner_text()
        n_cards = await pg.locator("main ul.grid > li").count()
        check("Lug‘at: faqat reviewed yozuvlar (21 ta)", n_cards == 21, n_cards)
        check("Lug‘at: Rebels mualliflik matni ko‘rinadi", "Lug‘at: Rebels / Jack korean" in vt)
        check("Lug‘at: tarjima va misol (ibora + misol tarjimasi)", "kutilmoqda / umid qilmoq" in vt and "Bu tizim muammoni hal qilishi kutilmoqda." in vt)
        await pg.goto(BASE + "/vocabulary?topic=TOP-POLITICS-WELFARE&part=1", wait_until="networkidle")
        check("Lug‘at: reja havolasi (mavzu + 1-qism)", "1-qism (5 dan)" in await pg.locator("main").inner_text())
        await pg.goto(BASE + "/vocabulary?q=%EC%8B%A4%EC%8B%9C", wait_until="networkidle")  # 실시
        n_q = await pg.locator("main ul.grid > li").count()
        check("Lug‘at: qidiruv (실시)", n_q >= 1, n_q)
        await axe(pg, "vocabulary", ax)

        # 5b. Grammatika (reviewed: GRM-3-001..003)
        await pg.goto(BASE + "/grammar", wait_until="networkidle")
        gt = await pg.locator("main").inner_text()
        check("Grammatika: 3 ta reviewed qoida, draft yashirin", "-는 바람에" in gt and "-더니" in gt and "-느라고" not in gt, gt[:200])
        check("Grammatika: o‘zbekcha izoh va misol tarjimasi", "Kutilmagan sabab" in gt and "Uxlab qolganim sababli majlisga kechikdim." in gt)
        await axe(pg, "grammar", ax)

        # 5c. Yozish (reviewed: WRT-53-0001)
        await pg.goto(BASE + "/writing", wait_until="networkidle")
        wt = await pg.locator("main").inner_text()
        check("Yozish: faqat reviewed topshiriq (53)", wt.count("-topshiriq") == 1 and "53-topshiriq · 30 ball" in wt, wt[:200])
        check("Yozish: o‘zbekcha ko‘rsatma va ma’lumot jadvali", "200–300 belgilik" in wt and await pg.locator("main table th", has_text="2026년").count() == 1
              and "Mashq uchun o‘ylab topilgan ma’lumot" in wt)
        await pg.get_by_role("button", name="Namunaviy javobni ko‘rish").click()
        wt2 = await pg.locator("main").inner_text()
        check("Yozish: namunaviy javob, belgi soni va izoh", "독서량" in wt2 and "Namunaviy javob: 225 belgi" in wt2 and "Namuna 4 qismdan iborat" in wt2, wt2[-300:])
        await axe(pg, "writing", ax)

        # 6. O‘qish mashqi → natija saqlanadi → statistika, xatolar
        await pg.goto(BASE + "/reading", wait_until="networkidle")
        qcount = await pg.locator("fieldset").count()
        check("O‘qish: 3 ta reviewed original savol", qcount == 3, qcount)
        await axe(pg, "reading", ax)
        fs = pg.locator("fieldset")
        await fs.filter(has_text="늦잠을 자는").locator("label", has_text="바람에").click()   # to‘g‘ri
        await fs.filter(has_text="출발해").locator("label", has_text="보니까").click()        # noto‘g‘ri
        # 3-savol (데다가) javobsiz
        await pg.get_by_role("button", name="Javoblarni tekshirish").click()
        await pg.wait_for_selector("text=Natija:", timeout=20000)
        rt = await pg.locator("main").inner_text()
        check("O‘qish: serverda baholandi — 1 / 3 to‘g‘ri, 2 / 6 ball", "1 / 3 to‘g‘ri" in rt and "2 / 6 ball" in rt, rt[:200])
        check("O‘qish: izoh yuborilgandan keyin ko‘rinadi", "kutilmagan sabab tufayli" in rt)
        await axe(pg, "reading-graded", ax)

        await pg.goto(BASE + "/stats", wait_until="networkidle")
        st = await pg.locator("main").inner_text()
        check("Statistika: urinish va bo‘lim natijasi (33%)", "O‘qish mashqi" in st and "33%" in st, st[:300])
        await axe(pg, "stats", ax)
        await pg.goto(BASE + "/mistakes", wait_until="networkidle")
        mt = await pg.locator("main").inner_text()
        check("Xatolarim: 2 ta savol (noto‘g‘ri + javobsiz)", mt.count("To‘g‘ri javob:") == 2, mt.count("To‘g‘ri javob:"))
        await axe(pg, "mistakes", ax)
        await pg.goto(BASE + "/dashboard", wait_until="networkidle")
        check("Dashboard: so‘nggi natija (2 / 6)", "2 / 6" in await main.inner_text())

        # 7. Profil
        await pg.goto(BASE + "/profile", wait_until="networkidle")
        check("Profil: email ko‘rinadi", EMAIL in await pg.locator("main").inner_text())
        await pg.get_by_label("Ism").fill("Test Talaba")
        await pg.get_by_label("Maqsad daraja").select_option("5")
        await pg.get_by_role("button", name="Saqlash").click()
        await pg.wait_for_selector("text=Saqlandi.", timeout=15000)
        await pg.reload(wait_until="networkidle")
        check("Profil: ism va maqsad saqlandi", await pg.get_by_label("Ism").input_value() == "Test Talaba" and await pg.get_by_label("Maqsad daraja").input_value() == "5")
        await axe(pg, "profile", ax)

        # 8. Chiqish → himoya
        await pg.get_by_role("button", name="Chiqish").click()
        await pg.wait_for_url("**/login**", timeout=15000)
        await pg.goto(BASE + "/stats", wait_until="networkidle")
        check("Chiqishdan keyin himoyalangan sahifa → /login", "/login" in pg.url)

        # 9. Noto‘g‘ri parol
        await pg.get_by_label("Email").fill(EMAIL)
        await pg.get_by_label("Parol").fill("noto‘g‘ri-parol")
        await pg.get_by_role("button", name="Kirish").last.click()
        await pg.wait_for_selector("text=Email yoki parol noto‘g‘ri.", timeout=15000)
        check("Noto‘g‘ri parol: xato xabari", True)

        # 10. Maxfiylik: boshqa foydalanuvchi
        await pg.get_by_role("tab", name="Ro‘yxatdan o‘tish").click()
        await pg.get_by_label("Email").fill(EMAIL2)
        await pg.get_by_label("Parol").fill(PW)
        await pg.get_by_role("button", name="Ro‘yxatdan o‘tish").last.click()
        await pg.wait_for_url("**/stats", timeout=20000)  # login ?next=/stats bilan ochilgan edi
        check("Login’dan keyin ?next sahifasiga qaytadi (/stats)", pg.url.endswith("/stats"), pg.url)
        await pg.goto(BASE + "/dashboard", wait_until="networkidle")
        t2 = await main.inner_text()
        check("Maxfiylik: 2-foydalanuvchi 1-foydalanuvchining reja/natijalarini ko‘rmaydi", "Reja boshlanmagan" in t2 and "2 / 6" not in t2)
        await pg.goto(BASE + "/mistakes", wait_until="networkidle")
        check("Maxfiylik: 2-foydalanuvchida xatolar yo‘q", "Hozircha xato yo‘q" in await pg.locator("main").inner_text())

        # 11. Qayta kirish: 1-foydalanuvchi ma'lumotlari joyida
        await pg.goto(BASE + "/profile", wait_until="networkidle")
        await pg.get_by_role("button", name="Chiqish").click()
        await pg.wait_for_url("**/login**")
        await pg.get_by_label("Email").fill(EMAIL)
        await pg.get_by_label("Parol").fill(PW)
        await pg.get_by_role("button", name="Kirish").last.click()
        await pg.wait_for_url("**/dashboard", timeout=20000)
        t3 = await main.inner_text()
        check("Qayta kirish: reja, belgi va natija saqlangan", "1-kun" in t3 and "2 / 6" in t3 and "5급" in t3, t3[:200])

        # 12. Mobile
        m = await b.new_context(viewport={"width": 375, "height": 812}, storage_state=await ctx.storage_state())
        mp = await m.new_page()
        for path in ["/dashboard", "/plan", "/vocabulary", "/reading", "/stats", "/mistakes", "/profile"]:
            await mp.goto(BASE + path, wait_until="networkidle")
            sw = await mp.evaluate("document.documentElement.scrollWidth")
            if sw > 375: errs.append(f"overflow {path} {sw}")
        check("Mobile 375px: 7 sahifada gorizontal overflow yo‘q", not any(e.startswith("overflow") for e in errs), [e for e in errs if e.startswith("overflow")])
        await mp.goto(BASE + "/dashboard", wait_until="networkidle")
        await mp.screenshot(path=f"{SHOTS}/e2e-mobile-dashboard.png", full_page=True)
        await m.close()
        await pg.goto(BASE + "/dashboard", wait_until="networkidle")
        await pg.screenshot(path=f"{SHOTS}/e2e-desktop-dashboard.png", full_page=True)
        await pg.goto(BASE + "/vocabulary", wait_until="networkidle")
        await pg.screenshot(path=f"{SHOTS}/e2e-vocabulary.png")
        await pg.goto(BASE + "/plan", wait_until="networkidle")
        await pg.screenshot(path=f"{SHOTS}/e2e-plan.png")

        check("axe WCAG 2.1 AA: tizimga kirgan holatdagi 11 sahifa holati", not ax, "\n".join(ax))
        check("Brauzer konsolida xato yo‘q", not [e for e in errs if not e.startswith("overflow")], errs[:4])
        await b.close()
    ok = sum(r[0] for r in res)
    print(f"\n{ok}/{len(res)} integratsiya testi o‘tdi")

asyncio.run(main())
