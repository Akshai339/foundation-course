---
tags: [product-design, course, progress]
type: tracker
---

# Progress

**Current:** Week 01, Day 3 — not started
**Last session:** 2026-08-02 — W01 D02 complete (source link dead end fixed, gulfs drilled live on Redbus)
**Studio A:** A1 — · A2 — · A3 — · A4 —
**Studio B:** not started
**Studio C:** not started

---

## Log

*One line per session. What you did, what landed, what didn't.*

- 2026-08-02 — **W01 D02 done.** The Day 2 SOURCE link is dead (points to a print-book chapter with no free text; the confirming link is just a reading-list page). Fix: MIT 6.831 lecture PDFs he already has downloaded at `Downloads/6.831-spring-2011/PDFs/` cover this — **Lecture 2 "Learnability"** (not Lecture 1) has the action-cycle/two-gulfs material around note-page ~38 and the three-models/thermostat/Back-button material at ~93–119. **Week 01 file's Day 2 SOURCE should be updated to point there** — flagged as carry-forward below. He didn't get the gulfs from the diagram/vocabulary — dropped jargon, taught via a hotel-shower example (gulf = a gap you cross by guessing), then he self-supplied two correct real examples (booking cancel = Execution, doc upload = Evaluation) before touching the seven stages. Ran the drill live on Redbus (booking a bus): correctly found Execution gulf in Plan (no personalization, re-filters from scratch every time despite a year of use — same shape as the scrollbar-vs-listbox example in Lec01) and Evaluation gulf in Compare (post-booking, can't tell if he got the best price). He then made the connective leap himself — that the Evaluation gap here was *caused by* the Execution gap (no baseline from Plan means nothing to Compare against) — and proposed the fix unprompted: a personalized suggestion (Execution) plus a "you saved ₹X/Y min vs usual" comparison (Evaluation), i.e. one feature closing both gulfs using the same underlying data. Pushed back only to stop him overgeneralizing "gulfs are always connected" — gave the counter-example (obvious button + no feedback after = pure isolated Evaluation gulf) so he holds the mechanism, not a slogan.
- 2026-08-01 — **W01 D01 done.** Drill: "looked right, worked badly" → a heavy mask-reveal/depth-map/lens-distortion app loader. Good, on-topic pick. Scored F2 S2 R2 **C3** Fail1 — landed almost exactly on the predicted baseline (Craft highest). Retreat called twice: solved a product-judgment problem with visual polish, then *re-*retreated in the post-mortem by re-framing it as a performance bug ("too heavy") instead of a problem-selection failure. Highest-leverage fix given: rewrite the ending to name what he optimised for (a feeling) vs the user's goal (speed to first action); correct move was shrink/delete the wait, not a lighter loader.

---

## Carry-forward

*Drills you owe, things to revisit, patterns worth watching.*

- **Fix Week 01 Day 2 SOURCE link** in `Week 01 — ....md` — currently points to a DOET print chapter + a GT reading-list page that confirms the chapter but has no text. Replace/supplement with the local PDF he already has: `Downloads/6.831-spring-2011/PDFs/MIT6_831S11_lec02.pdf` (Lecture 2, "Learnability" — despite the topic name, this is where 6.831 teaches the action cycle/two gulfs and the three-models framework, not Lecture 1). Worth checking other week files' SOURCE links for the same live-vs-dead problem before he hits another one mid-lesson.
- **Owe: D01 drill rewrite.** Redo the final two sentences to confess the framing error (optimised for a feeling, not the user's goal), and add specifics — product name, actual load time, the device it died on. Re-score Framing when it lands.
- **Watch:** the double retreat (into visual craft in the work, then into "technical bug" framing in the reflection). Same move will show up in Studio A diagnosis — hold him to the vocabulary, not the vibe.

---

## Checkpoint profile

Five axes, scored at each phase end. See [[05 Checkpoints]].

| Checkpoint | Date | Framing | Structure | Rationale | Craft | Failure | Total |
|---|---|---|---|---|---|---|---|
| *Baseline (Wk 1, predicted)* | — | 2 | 2 | 2 | 5 | 1 | 12 |
| 01 — The Cold Diagnosis | | | | | | | |
| 02 — The Framing Test | | | | | | | |
| 03 — The Handoff | | | | | | | |
| 04 — The Defence | | | | | | | |

Watch the **shape**, not the total. Craft still highest at CP03 means you retreated.

---

## Recurring question

Answer at the end of every week: **where did I default to visual craft instead of the harder thinking?**

| Week | Answer |
|---|---|
| 01 | |
| 02 | |
| 03 | |
| 04 | |
| 05 | |
| 06 | |
| 07 | |
| 08 | |
| 09 | |
| 10 | |
| 11 | |
| 12 | |

By Week 12 this column is your development plan for the following year.

---

← [[00 Start Here]]
