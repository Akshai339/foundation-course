# Foundation — a 12-week product design course

A self-contained product design curriculum: **12 weeks · 72 days · ~130 hours** at 90–120 minutes a day, with four checkpoint assessments and three project studios.

**→ [Open the app](https://Akshai339.github.io/foundation-course/)** *(live once GitHub Pages is enabled)*

---

## What this is

Most UX courses are written for people who have never designed anything — three weeks on colour theory, two on typography. This one is built for someone who already has visual and motion craft and is missing the *product* half:

| Already have | Missing |
|---|---|
| Visual hierarchy, composition, colour, type | The cognitive science of *why*, so you can defend it |
| Motion craft, timing, easing | Motion as *feedback and orientation*, not decoration |
| Audience empathy from marketing | Structured needfinding that survives engineering |
| The ability to make a screen | The ability to decide *which screen should exist* |
| Taste | Rationale — saying why, under pressure, to a skeptical PM |
| Speed with AI tools | Judgment about which of the 40 generated options is right |

Execution is cheap now. The bottleneck moved upstream to **problem framing, structural thinking, and defensible judgment.** That's what this attacks.

---

## Structure

```
PHASE 1 · Weeks 1–3   FOUNDATIONS        why things work
PHASE 2 · Weeks 4–6   THE PRODUCT LAYER  deciding what to build
PHASE 3 · Weeks 7–9   THE CRAFT LAYER    making it real
PHASE 4 · Weeks 10–12 THE PRO LAYER      shipping, and being trusted
```

Every day is **CONCEPT → SOURCE → DRILL**. Read the lesson, go to one primary source, then make something. Day 7 of each week is deliberately empty.

### Three studios
- **A · The Teardown & Rebuild** (weeks 1–4) — diagnose a real flow with real methods
- **B · Zero to One** (weeks 5–8) — research → framing → flows → screens → system
- **C · The AI Feature** (weeks 9–12) — the capstone and portfolio piece

### Four checkpoints
Cold transfer tests at each phase boundary, scored on five axes. The instrument that shows whether the learning stuck.

| | After | Tests |
|---|---|---|
| 01 The Cold Diagnosis | Week 3 | Diagnosing on demand, without familiarity |
| 02 The Framing Test | Week 6 | Vague request → structural spec, assumptions marked |
| 03 The Handoff | Week 9 | Does your system work without you in the room? |
| 04 The Defence | Week 12 | Does the work survive other people — and do you? |

---

## Files

| | |
|---|---|
| `index.html` | The app. Self-contained, no build step, works offline. |
| `00 Start Here.md` | Philosophy, the daily ritual, progress |
| `01 The Curriculum.md` | All 72 days on one page |
| `02 Resource Library.md` | Every paper, book, course and tool |
| `03 The Studios.md` | The three project briefs |
| `04 Rubrics and Self-Critique.md` | How to grade yourself honestly |
| `05 Checkpoints.md` | The four assessments and the profile |
| `Week 01…12 .md` | The lessons |

Progress lives in browser localStorage — it is **not** committed here. The Sync tab in the app produces a code for moving it between devices.

---

## Running it with Claude

The course ships as a Claude Code skill. From any session with this repo available:

```bash
/product-design-course
```

Claude picks up where you left off, teaches the day's concept, sets the drill, critiques what you made — enforcing structural → interaction → visual order — and runs the checkpoints, including telling you when your self-score is generous.

Install the skill by copying `skill/SKILL.md` to `~/.claude/skills/product-design-course/SKILL.md`.

---

## Sources

Distilled from [MIT 6.831](https://ocw.mit.edu/courses/6-831-user-interface-design-and-implementation-spring-2011/), [Stanford CS147](https://hci.stanford.edu/courses/cs147/), [Georgia Tech CS6750](https://omscs6750.gatech.edu/spring-2022/required-reading-list/), [Laws of UX](https://lawsofux.com/), [NN/g](https://www.nngroup.com/articles/), [Shape Up](https://basecamp.com/shapeup), the [HEART paper](https://research.google.com/pubs/archive/36299.pdf), [Microsoft HAX](https://www.microsoft.com/en-us/haxtoolkit/ai-guidelines/) and [Google PAIR](https://pair.withgoogle.com/guidebook-v2/). Full list in `02 Resource Library.md`.

The lesson text is original; the sources are where to go for depth.
