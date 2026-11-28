import type { SupabaseClient } from "@supabase/supabase-js";

/**
 * O‘quv kontenti so‘rovlari. RLS o‘quvchiga faqat nashr qilingan
 * (reviewed/verified + manba granted) yozuvlarni qaytaradi; editor va
 * mutaxassislar draft'larni ham ko‘radi (ular uchun status belgisi chiqadi).
 */
export type ContentStatus = "draft" | "reviewed" | "verified";

type One<T> = T | T[] | null;
const one = <T,>(v: One<T>): T | null => (Array.isArray(v) ? (v[0] ?? null) : v);

export type VocabItem = {
  id: string;
  key: string;
  term: string;
  pos: string | null;
  level: number | null;
  status: ContentStatus;
  topic: { key: string; name_uz: string; name_ko: string } | null;
  attribution: string | null;
  meaning: { text: string; status: ContentStatus } | null;
  examples: { id: string; ko: string; uz: string | null; status: ContentStatus }[];
};

export async function getTopics(supabase: SupabaseClient) {
  const { data } = await supabase.from("topics").select("key, name_uz, name_ko, sort").order("sort");
  return (data ?? []) as { key: string; name_uz: string; name_ko: string; sort: number }[];
}

export async function getVocabulary(
  supabase: SupabaseClient,
  opts: { topic?: string; q?: string; part?: number; parts?: number; limit?: number } = {},
): Promise<{ items: VocabItem[]; total: number }> {
  // Mavzu bo‘yicha filtrlashda `!inner`: mavzusi mos kelmagan yozuvlar chiqarib tashlanadi
  const topicRel = opts.topic ? "topic:topics!inner(key, name_uz, name_ko)" : "topic:topics(key, name_uz, name_ko)";
  let query = supabase
    .from("vocab_entries")
    .select(
      `id, key, term, pos, level, status, ${topicRel}, source:sources(attribution_required, attribution_text), examples:vocab_examples(id, sentence_ko, sort, status)`,
    )
    .order("key");
  if (opts.topic) query = query.eq("topic.key", opts.topic);
  if (opts.q) query = query.ilike("term", `%${opts.q.replace(/[%_,()]/g, "")}%`);

  const { data, error } = await query;
  if (error || !data) return { items: [], total: 0 };

  type Row = {
    id: string; key: string; term: string; pos: string | null; level: number | null; status: ContentStatus;
    topic: One<{ key: string; name_uz: string; name_ko: string }>;
    source: One<{ attribution_required: boolean; attribution_text: string | null }>;
    examples: { id: string; sentence_ko: string; sort: number; status: ContentStatus }[] | null;
  };
  let rows = data as unknown as Row[];

  // Reja topshirig‘idagi "N-qism": mavzu yozuvlarini teng bo‘laklarga bo‘lish
  if (opts.topic && opts.part && opts.parts) {
    const size = Math.ceil(rows.length / opts.parts);
    rows = rows.slice((opts.part - 1) * size, opts.part * size);
  }
  const total = rows.length;
  if (opts.limit) rows = rows.slice(0, opts.limit);

  const entryIds = rows.map((r) => r.id);
  const exampleIds = rows.flatMap((r) => (r.examples ?? []).map((e) => e.id));
  const [meanings, exTr] = await Promise.all([
    entryIds.length
      ? supabase.from("translations").select("entity_id, text, status").eq("entity_table", "vocab_entries").eq("field", "meaning").eq("locale", "uz").in("entity_id", entryIds)
      : Promise.resolve({ data: [] }),
    exampleIds.length
      ? supabase.from("translations").select("entity_id, text, status").eq("entity_table", "vocab_examples").eq("locale", "uz").in("entity_id", exampleIds)
      : Promise.resolve({ data: [] }),
  ]);
  type Tr = { entity_id: string; text: string; status: ContentStatus };
  const mMap = new Map(((meanings.data ?? []) as Tr[]).map((t) => [t.entity_id, t]));
  const eMap = new Map(((exTr.data ?? []) as Tr[]).map((t) => [t.entity_id, t]));

  return {
    total,
    items: rows.map((r) => {
      const src = one(r.source);
      const m = mMap.get(r.id);
      return {
        id: r.id,
        key: r.key,
        term: r.term,
        pos: r.pos,
        level: r.level,
        status: r.status,
        topic: one(r.topic),
        attribution: src?.attribution_required ? src.attribution_text : null,
        meaning: m ? { text: m.text, status: m.status } : null,
        examples: [...(r.examples ?? [])]
          .sort((a, b) => a.sort - b.sort)
          .map((e) => ({ id: e.id, ko: e.sentence_ko, uz: eMap.get(e.id)?.text ?? null, status: e.status })),
      };
    }),
  };
}

export type GrammarItem = {
  id: string;
  key: string;
  pattern: string;
  formula: string;
  level: number | null;
  status: ContentStatus;
  explanation: string | null;
  examples: { ko: string; uz: string | null }[];
};

export async function getGrammar(supabase: SupabaseClient): Promise<GrammarItem[]> {
  const { data } = await supabase
    .from("grammar_points")
    .select("id, key, pattern, formula, level, status, examples:grammar_examples(id, sentence_ko, sort)")
    .order("level")
    .order("key");
  type Row = { id: string; key: string; pattern: string; formula: string; level: number | null; status: ContentStatus; examples: { id: string; sentence_ko: string; sort: number }[] | null };
  const rows = (data ?? []) as Row[];
  if (rows.length === 0) return [];
  const ids = rows.map((r) => r.id);
  const exIds = rows.flatMap((r) => (r.examples ?? []).map((e) => e.id));
  const [expl, exTr] = await Promise.all([
    supabase.from("translations").select("entity_id, text").eq("entity_table", "grammar_points").eq("field", "explanation").in("entity_id", ids),
    exIds.length ? supabase.from("translations").select("entity_id, text").eq("entity_table", "grammar_examples").in("entity_id", exIds) : Promise.resolve({ data: [] }),
  ]);
  const eMap = new Map(((expl.data ?? []) as { entity_id: string; text: string }[]).map((t) => [t.entity_id, t.text]));
  const xMap = new Map(((exTr.data ?? []) as { entity_id: string; text: string }[]).map((t) => [t.entity_id, t.text]));
  return rows.map((r) => ({
    id: r.id, key: r.key, pattern: r.pattern, formula: r.formula, level: r.level, status: r.status,
    explanation: eMap.get(r.id) ?? null,
    examples: [...(r.examples ?? [])].sort((a, b) => a.sort - b.sort).map((e) => ({ ko: e.sentence_ko, uz: xMap.get(e.id) ?? null })),
  }));
}

export type PracticeQuestion = {
  id: string;
  key: string;
  number_slot: number | null;
  stem_ko: string;
  prompt_ko: string | null;
  points: number;
  status: ContentStatus;
  passage: { id: string; body_ko: string; kind: string } | null;
  audio: { storage_path: string; attribution: string | null } | null;
  options: { id: string; label: number; text_ko: string }[];
};

/** Mashq uchun savollar (to‘g‘ri javoblarsiz — javob faqat serverda tekshiriladi). */
export async function getPracticeQuestions(
  supabase: SupabaseClient,
  section: "listening" | "reading",
  limit = 10,
): Promise<PracticeQuestion[]> {
  const { data } = await supabase
    .from("questions")
    .select("id, key, number_slot, stem_ko, prompt_ko, points, status, passage:passages(id, body_ko, kind), options:question_options(id, label, text_ko)")
    .eq("section", section)
    .order("number_slot", { nullsFirst: false })
    .order("key")
    .limit(limit * 3);
  type Row = Omit<PracticeQuestion, "passage" | "audio"> & { passage: One<{ id: string; body_ko: string; kind: string }> };
  let rows = ((data ?? []) as unknown as Row[]).map((r) => ({ ...r, passage: one(r.passage), audio: null as PracticeQuestion["audio"] }));
  // Faqat 4 variantli savollar (nashr qilinganlarda bu DB tomonidan kafolatlangan)
  rows = rows.filter((r) => (r.options ?? []).length === 4);

  if (section === "listening") {
    const passageIds = rows.map((r) => r.passage?.id).filter(Boolean) as string[];
    if (passageIds.length === 0) return [];
    const { data: audio } = await supabase
      .from("publishable_audio_assets")
      .select("storage_path, attribution_text, transcript_passage_id")
      .in("transcript_passage_id", passageIds);
    const aMap = new Map(((audio ?? []) as { storage_path: string; attribution_text: string | null; transcript_passage_id: string }[]).map((a) => [a.transcript_passage_id, a]));
    // Tinglash savoli faqat huquqi va sifati tasdiqlangan audio bilan ko‘rsatiladi
    rows = rows
      .filter((r) => r.passage && aMap.has(r.passage.id))
      .map((r) => {
        const a = aMap.get(r.passage!.id)!;
        return { ...r, audio: { storage_path: a.storage_path, attribution: a.attribution_text } };
      });
  }
  return rows.slice(0, limit).map((r) => ({ ...r, options: [...r.options].sort((a, b) => a.label - b.label) }));
}

export type WritingTaskItem = {
  id: string;
  key: string;
  task_no: number;
  prompt_ko: string;
  min_chars: number | null;
  max_chars: number | null;
  points: number;
  status: ContentStatus;
  model_answer: string | null;
};

export async function getWritingTasks(supabase: SupabaseClient): Promise<WritingTaskItem[]> {
  const { data } = await supabase
    .from("writing_tasks")
    .select("id, key, task_no, prompt_ko, min_chars, max_chars, points, status, model_answers(body_ko, status)")
    .order("task_no")
    .order("key");
  type Row = Omit<WritingTaskItem, "model_answer"> & { model_answers: { body_ko: string }[] | null };
  return ((data ?? []) as Row[]).map((r) => ({ ...r, model_answer: r.model_answers?.[0]?.body_ko ?? null }));
}

export async function getMockTests(supabase: SupabaseClient) {
  const { data } = await supabase.from("mock_tests").select("id, key, title, status, items:mock_test_items(position)").order("key");
  return ((data ?? []) as { id: string; key: string; title: string; status: ContentStatus; items: { position: number }[] | null }[]).map((m) => ({
    ...m,
    itemCount: m.items?.length ?? 0,
  }));
}
