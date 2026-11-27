"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { Input } from "@/components/ui/input";
import { Modal } from "@/components/ui/modal";
import { SearchIcon } from "@/components/ui/icons";

export function ModalDemo() {
  const [open, setOpen] = useState(false);
  return (
    <>
      <Button variant="outline" onClick={() => setOpen(true)}>
        Modalni ochish
      </Button>
      <Modal
        open={open}
        onClose={() => setOpen(false)}
        title="Bugungi darsni yakunlash"
        description="Belgilangan topshiriqlar saqlanadi."
        footer={
          <>
            <Button variant="ghost" onClick={() => setOpen(false)}>
              Bekor qilish
            </Button>
            <Button onClick={() => setOpen(false)}>Yakunlash</Button>
          </>
        }
      >
        <p className="text-body text-muted">
          Modal native &lt;dialog&gt; asosida: ESC bilan yopiladi, fokus ichida qoladi, mobile&apos;da
          pastdan chiqadi.
        </p>
      </Modal>
    </>
  );
}

export function FormDemo() {
  const [tasks, setTasks] = useState([true, false]);
  return (
    <div className="grid gap-5 md:grid-cols-2">
      <div className="flex flex-col gap-4">
        <Input
          label="Qidiruv"
          hideLabel
          placeholder="Qidirish (so'z, grammatika, dars...)"
          leadingIcon={<SearchIcon />}
        />
        <Input label="Ism" placeholder="Ismingiz" hint="Profilda ko'rinadi." />
        <Input label="Email" defaultValue="noto'g'ri-email" error="Email manzili noto'g'ri." />
        <Input label="O'chirilgan" placeholder="Tahrirlab bo'lmaydi" disabled />
      </div>
      <div className="flex flex-col gap-4">
        <Checkbox
          label="Lug'at: yangi so'zlar"
          description="~15 daqiqa"
          checked={tasks[0]}
          onChange={(e) => setTasks([e.target.checked, tasks[1]])}
        />
        <Checkbox
          label={<span className="ko">Grammatika: -(으)면서</span>}
          description="~20 daqiqa"
          checked={tasks[1]}
          onChange={(e) => setTasks([tasks[0], e.target.checked])}
        />
        <Checkbox label="O'chirilgan topshiriq" disabled />
      </div>
    </div>
  );
}
