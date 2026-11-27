import { test } from "node:test";
import assert from "node:assert/strict";
import { activityGrid, levelForScore, sectionAccuracy } from "./stats.ts";

test("stats: bo‘limlar bo‘yicha o‘rtacha natija", () => {
  const r = sectionAccuracy([
    { id: "1", section: "reading", title: "", score: "16", max_score: "20", taken_on: "2026-11-20" },
    { id: "2", section: "reading", title: "", score: 8, max_score: 20, taken_on: "2026-11-21" },
    { id: "3", section: "listening", title: "", score: 10, max_score: 20, taken_on: "2026-11-21" },
  ]);
  assert.deepEqual(r, [
    { section: "listening", attempts: 1, scorePct: 50 },
    { section: "reading", attempts: 2, scorePct: 60 },
  ]);
  assert.deepEqual(sectionAccuracy([]), []);
});

test("stats: faollik xaritasi", () => {
  const g = activityGrid(new Set(["2026-11-28", "2026-11-26"]), "2026-11-28", 3);
  assert.deepEqual(g, [
    { date: "2026-11-26", active: true },
    { date: "2026-11-27", active: false },
    { date: "2026-11-28", active: true },
  ]);
});

test("stats: TOPIK II ball → daraja", () => {
  const t = { 3: 120, 4: 150, 5: 190, 6: 230 };
  assert.equal(levelForScore(119, t), null);
  assert.equal(levelForScore(150, t), 4);
  assert.equal(levelForScore(189, t), 4);
  assert.equal(levelForScore(190, t), 5);
  assert.equal(levelForScore(300, t), 6);
});
