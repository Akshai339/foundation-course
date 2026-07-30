---
tags: [product-design, course, projects]
type: briefs
---

# The Studios — three projects

The daily drills are not busywork. They accumulate into three projects. Each one produces a real artifact, and the third one is a portfolio piece.

← back to [[00 Start Here]]

---

## Why three, and why these three

There are exactly three ways a product designer gets handed work:

1. **"This thing is broken, fix it."** → Studio A. Diagnosis under constraint. The most common real-world task and the one juniors do worst, because they redesign the pixels instead of finding the structural fault.
2. **"We think there's an opportunity here, figure it out."** → Studio B. Zero to one. Ambiguity all the way down. This is where product designers earn their title.
3. **"We have a new capability, make it usable."** → Studio C. The defining task of the next decade, and specifically of your job.

Do them in order. Each one assumes the last.

---

# STUDIO A — The Teardown & Rebuild
### Weeks 1–4 · ~14 hours

**The brief:** Take one *flow* in a product you use regularly. Diagnose it with real methods rather than opinion. Then rebuild it — and be able to defend every change with a named principle.

### Choosing your target

Pick a flow, not an app. A flow is a sequence with a goal and an end state.

**Good targets:** adding a payment method · setting up a recurring transfer · sharing a file with granular permissions · booking something with constraints (seats, dates, guests) · onboarding into a tool with a setup step · cancelling a subscription · uploading and organising media.

**Rules for choosing:**
- Something you use, so you have real intuition to check against.
- Something with **at least 5 steps** and **at least one decision point**. A login screen is not enough.
- Something with real data complexity — lists, empty states, errors.
- **Not** a famously-bad flow that's been torn down a thousand times on Medium. Nobody needs another Instagram redesign.
- **Not** something you'd redesign purely because it's ugly. If your first instinct is "the type is bad," pick something else.

### Deliverables

| # | Artifact | Built in |
|---|---|---|
| A1 | **Flow capture** — every screen and state, screenshotted and sequenced | W1 D6 |
| A2 | **Cognitive audit** — annotate against Gulfs, Fitts/Hick, memory load, Gestalt grouping | W2 D6 |
| A3 | **Heuristic evaluation** — the full Nielsen method, severity-rated, with a written report | W3 D6 |
| A4 | **Rebuild brief** — one page: the three problems worth fixing, why those three, what you'd trade away | W4 D6 |

### What "done well" looks like

- Your findings are **structural**, not cosmetic. "Step 3 requires the user to remember a value from step 1" is a finding. "The button is the wrong blue" is not.
- Every problem is tagged with a **named principle**. If you can't name it, you haven't diagnosed it — you've just noticed it.
- Your rebuild brief **cuts things**. If you fixed everything, you didn't prioritise, and prioritisation is the skill being tested.
- You can articulate **what your redesign makes worse**. Every design decision has a cost. Naming yours is the single fastest way to sound senior.

---

# STUDIO B — Zero to One
### Weeks 5–8 · ~18 hours

**The brief:** Find a real problem that real people have, frame it, and design a first version end to end — research through flows through screens through a small system.

### Choosing your problem

The problem must satisfy three tests:

1. **You can reach at least 3 people who have it.** Not hypothetical users. Actual humans you can talk to for 30 minutes each. This is the constraint that will shape your choice, and it should.
2. **You don't already know the answer.** If you can picture the screens, pick something else. The entire point is to be genuinely uncertain in Week 5 and certain by Week 8.
3. **It's small.** One job, done well. Not a platform. Not a marketplace. Not "an app for X community."

**Good hunting grounds:** something annoying in your own team's workflow · something a friend does in a spreadsheet that clearly shouldn't be a spreadsheet · a hobby community's shared frustration · a task you personally do badly and repeatedly.

**A note, given your background:** you have marketing and GTM instincts, which means you will be tempted to pick a problem with a good *story*. Resist. Pick the one with the strongest *evidence*, even if it's boring. Boring problems with real users beat exciting problems with imagined ones, every time.

### Deliverables

| # | Artifact | Built in |
|---|---|---|
| B1 | **Three interviews** — recorded/transcribed, with your notes | W5 D6 |
| B2 | **Synthesis** — findings, patterns, and one sharp POV statement | W5 D6 |
| B3 | **Task analysis + flow diagram** — the full happy path plus branches | W6 D6 |
| B4 | **State matrix** — every screen × every state | W6 D6 |
| B5 | **Screens** — 6–10 designed screens covering the core flow | W7 D6 |
| B6 | **Mini design system** — tokens, 5–8 components, documented | W8 D6 |

### What "done well" looks like

- **Something you believed in Week 5 turned out to be wrong.** If nothing surprised you, you either didn't listen or you asked leading questions. Write down what changed.
- Your flow diagram has **branches and failure paths**, not just a happy line.
- Your screens are **derived from the flow**, not designed first and retrofitted. This is the discipline the whole studio is teaching.
- Your system is **small and coherent** rather than large and generic. Eight components you can justify beat forty you copied.

---

# STUDIO C — The AI Feature
### Weeks 9–12 · ~22 hours · **This is your portfolio piece**

**The brief:** Design a feature where the core capability is a probabilistic model — one that can be confidently, plausibly wrong. Make it genuinely useful *and* genuinely trustworthy.

### Why this is your capstone

You work at an AI company. This is the most defensible thing you can put in front of a hiring manager or an internal stakeholder, because:

- Very few designers can do it well yet — the patterns are being invented right now.
- It requires *everything* in this course: mental models (W1), cognitive load (W2), feedback and state (W3), framing (W4), research (W5), flows (W6), craft (W7), systems (W8), latency and motion (W9), edge cases (W10).
- It plays directly to your motion background. Streaming, progressive disclosure of generated content, and confidence expression are **fundamentally temporal design problems**. Most designers approaching AI UI have no time-based craft at all. You do.

### Choosing your feature

Either **extend Studio B** with an AI capability (recommended — you already have research and a system), or start fresh.

**The one rule:** the model must be able to be *wrong in a way the user can't immediately detect*. That's what makes it a real AI design problem rather than a button that calls an API. Summarisation, extraction, recommendation, generation, classification, and agentic multi-step actions all qualify. A spell-checker does not.

### Deliverables

| # | Artifact | Built in |
|---|---|---|
| C1 | **Feature brief** — the job, the capability, the failure modes | W9 D6 |
| C2 | **Motion spec** — streaming, transitions, latency states, with durations and easing named | W9 D6 |
| C3 | **State & edge-case matrix** — including *wrong*, *uncertain*, *refused*, *partial*, *slow* | W10 D6 |
| C4 | **The AI interaction design** — mapped against the 18 HAX guidelines | W11 D6 |
| C5 | **Measurement plan** — HEART table + Goals-Signals-Metrics | W12 D1 |
| C6 | **The case study** — the full narrative, publishable | W12 D6 |

### What "done well" looks like

- You designed the **wrongness**, not just the rightness. Show me the screen where the model is confidently incorrect and the user recovers gracefully. That screen is the whole portfolio piece.
- **Trust is calibrated, not maximised.** A design that makes users trust the model *more than it deserves* is a failure, even if it tests well.
- The user can **steer, correct and undo** — not just accept or reject.
- Your motion is **informational**. Every animation answers a question the user has: what's happening, how long, where did that come from, is it done.
- The case study shows **the decisions you rejected**, with reasons. This is what separates a portfolio from a gallery.

---

## The case study format (Week 12 D6)

Not a Behance layout. A document. Structure:

1. **The situation** — 3 sentences. What, for whom, why now.
2. **The problem, framed** — your POV statement, and the evidence behind it.
3. **What I had to figure out** — the 2–3 genuinely hard questions. *This section is why anyone reads a case study.*
4. **The exploration** — including the approaches you killed and why.
5. **The design** — the flows and screens, annotated with rationale.
6. **The unhappy path** — errors, edge cases, and the model being wrong.
7. **How I'd know it worked** — HEART table, what you'd instrument.
8. **What I'd do differently** — one honest paragraph.

**The most common portfolio failure is section 3 being missing.** Most case studies are "here is what I made." The good ones are "here is what was hard, and how I thought about it." You are a strong visual communicator, so sections 4–6 will look great with almost no effort. Spend your effort on 2, 3 and 8 — that's where the perceived seniority actually lives.

See [[04 Rubrics and Self-Critique]] for how to grade each of these.
