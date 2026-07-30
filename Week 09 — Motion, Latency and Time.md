---
tags: [product-design, course, week, phase/craft]
week: 9
phase: Craft Layer
---

# Week 09 — Motion, Latency and Time

> **The week's thesis:** This is your unfair advantage, pointed at a new target. In film and brand, motion carries *feeling*. In product, motion carries *information* — what happened, where it came from, how long, and whether you're still in control. Most product designers have no time-based craft at all. You do. This week converts it.

**Studio:** [[03 The Studios|Studio C]] kicks off on Day 6.
← [[Week 08 — Design Systems and Component Thinking]] · next → [[Week 10 — Accessibility and the Unhappy Path]]

---

## Day 1 — Motion's four jobs, and the one job it doesn't have

### CONCEPT

Motion in a product interface earns its place by doing one of exactly four jobs. Anything else is cost without benefit — and in product, motion's cost is *time*, paid by the user, on every single use.

**Job 1 — Continuity: preserving object identity across a change.**
When a thing moves, grows, or transforms rather than disappearing and reappearing, the user knows it's the *same thing*. This is the highest-value job and the most under-exploited. A list item that expands into a detail view teaches the relationship between the two. The same transition done as a cut requires the user to re-establish, every time, what they're looking at and where it came from.

**Job 2 — Spatial orientation: explaining where things are.**
Interfaces are pretend spaces. Motion is how you establish the geography. A panel sliding in from the right establishes that it lives to the right and is dismissed rightward. A modal scaling up from a button says "this came from there and will go back." Without motion, users maintain the spatial model manually, in working memory (Week 2), and mostly fail to.

**Job 3 — Feedback: confirming that something happened.**
Norman's stage 5. Especially for actions with no visible result — a save, a copy, a background sync. Motion is often the *only* available feedback channel that doesn't steal the user's position on the page.

**Job 4 — Attention direction: showing where to look next.**
Motion is the most powerful pre-attentive channel (Week 2, Day 1) — it overrides everything. Which is exactly why it must be spent carefully: one moving element in a still field is unmissable; three are noise; a permanently-animating element is a permanent tax on attention that the user eventually learns to filter out, at which point you've spent the channel and gained nothing.

**The job motion does *not* have in product: expression.**

This is the hard part for you. In brand and film work, motion carries personality, and a piece of motion can be justified by being *good*. In product, "it looks nice" is not a justification, because the cost is the user's time and it is paid on every repetition. A 400ms flourish seen once in a showreel is a delight. The same 400ms on a button pressed forty times a day is four seconds a week of a person's life spent watching your taste.

**The test to apply to every animation you add:**

> **What question does this answer for the user?**
> If it doesn't answer one — what happened / where did it come from / where did it go / am I still in control / how long — cut it or halve it.

**The exception, and it's real:** *once-per-session or once-per-lifetime* moments — first-run, a completed milestone, a genuine success. Here expression is legitimate, because the repetition cost is near zero and the emotional payoff is real. Notice these are exactly the moments most products under-invest in while over-animating their buttons. That inversion is an opportunity you're unusually well-equipped to exploit.

### SOURCE
[Material Design motion](https://m3.material.io/styles/motion/overview) and [IBM Carbon motion](https://carbondesignsystem.com/elements/motion/overview/). Carbon's **productive vs expressive** split is the single most useful framing in either — productive motion for frequent, task-focused interactions (fast, unobtrusive); expressive for rare, significant moments.

### DRILL
Audit motion in three products you use daily. For each animation: which of the four jobs does it do? How long is it (estimate)? Is it once-per-session or once-per-minute? Find one that's pure expression on a high-frequency action — that's a bug. Then find one place where motion is *missing* and continuity is being lost.

---

## Day 2 — Duration, easing and the physics of trust

### CONCEPT

You know easing. What you probably haven't done is treat duration and easing as **tokens with semantics** — decisions made once, at a system level, rather than per-animation taste.

**Duration.** The working ranges in product UI, which are much shorter than motion-graphics instincts:

| Range | Use |
|---|---|
| **50–100ms** | Micro-feedback: hover, focus, button press, checkbox |
| **150–250ms** | The workhorse. Most transitions, panel opens, expansions |
| **250–400ms** | Large-area changes: full-screen transitions, big modals |
| **400ms+** | Almost always too slow for anything repeated. Reserve for once-per-session moments |

**Duration scales with distance and area, not with importance.** A small element moving a short distance should be fast; a full-screen surface moving a long distance needs more time to be legible. Applying one duration to everything is the most common systemic motion error, and it produces UI where small things feel sluggish and large things feel jarring.

**Exit is faster than enter.** Roughly 0.7–0.8×. Things arriving need to be perceived and understood; things leaving just need to get out of the way. A dismissal that takes as long as an appearance feels like the interface is arguing with you.

**Easing, and the semantics of each curve:**

| Curve | Feels like | Use for |
|---|---|---|
| **Ease-out** (fast start, slow end) | Responsive, arriving | **The default.** Elements entering, expanding, appearing. Responds immediately to input, settles gently. |
| **Ease-in** (slow start, fast end) | Departing, accelerating away | Elements leaving the screen entirely |
| **Ease-in-out / standard** | Deliberate, controlled | Elements moving *within* the screen, both ends visible |
| **Linear** | Mechanical | Only for continuous indeterminate things: spinners, progress, marquees |
| **Spring / overshoot** | Physical, playful, alive | Direct-manipulation responses (drag release, pull-to-refresh). **Dangerous on frequent UI** — overshoot means the target moves after you've committed to a click. |

**The trust argument, and it's the substantive point of the day.** Motion is where an interface expresses its *physics*, and consistent physics is what makes a product feel trustworthy rather than merely decorated. If panels sometimes slide and sometimes fade, sometimes take 200ms and sometimes 350, the interface has no consistent world — and users read that inconsistency as unreliability, without being able to articulate why. **Coherent motion is a substantial and almost entirely invisible contributor to perceived quality.**

That's the argument for tokenising motion, which you set up in Week 8:

```
duration-instant    100ms
duration-fast       150ms
duration-standard   250ms
duration-slow       400ms

easing-standard     cubic-bezier(0.2, 0, 0, 1)      → entering, default
easing-accelerate   cubic-bezier(0.3, 0, 1, 1)      → exiting
easing-decelerate   cubic-bezier(0, 0, 0, 1)        → arriving
```

**One accessibility requirement, and it's non-negotiable:** honour `prefers-reduced-motion`. Vestibular disorders make large-area motion genuinely nauseating for some people. The correct response is not to remove all motion — it's to replace *movement* with *fades* and reduce durations. Every animation in your spec needs a reduced-motion variant. Week 10 returns to this.

### SOURCE
★ [Material's duration & easing guidance](https://m1.material.io/motion/duration-easing.html) — still the clearest single page on the subject anywhere. Then [Carbon's motion tokens](https://carbondesignsystem.com/elements/motion/overview/) for the productive/expressive implementation.

### DRILL
Define the **motion tokens** for your design system — 4 durations, 3–4 easings, each with a stated semantic use. Then take one component from Studio B and specify every animation it has using only those tokens, including reduced-motion variants. Where a token doesn't fit, that's information: either you need another token, or the animation is wrong.

---

## Day 3 — Choreography, shared elements and spatial continuity

### CONCEPT

Single animations are easy. **Choreography** — multiple elements moving in relation to each other — is where motion becomes structural, and it's where your film background is worth the most.

**Shared element transitions.** When an element persists across a state change, animate it *continuously* rather than cross-fading. The classic: tapping a card in a grid, and the card's image expands to become the hero image of the detail view. The user's eye tracks one object; no re-orientation is needed; the relationship between list and detail is taught without a word.

This is the single highest-value motion technique in product design and it's underused because it's genuinely harder to build — it requires the two screens to know about each other. It's worth arguing for on the interactions that matter most.

**Staggering.** When multiple elements enter, offsetting them by 20–50ms each creates a read order and makes the group comprehensible rather than an undifferentiated flash. The rules:
- **Stagger in the direction of reading** — the eye should be led, not scattered
- **Cap the total.** A twenty-item list staggered at 50ms takes a full second. Stagger the first 4–6, then have the rest arrive together.
- **Don't stagger on repeat views.** Charming once, tedious on the fortieth load. Stagger on first paint, not on every re-render — this is a distinction most implementations miss and it's worth specifying explicitly.

**Hierarchy of movement.** In a choreographed transition, not everything should move equally. Establish what's primary — usually the element the user acted on — and let it lead. Secondary elements follow, support, or stay still. **Everything moving at once is the motion equivalent of everything being bold.** Your compositional instincts apply directly here; it's the same problem in the time axis.

**Spatial models — pick one and hold it.** The most common:
- **Layers / z-depth** — things sit above and below each other. Modals rise toward the user; sheets slide over. Elevation is the token.
- **Cards / surfaces** — content lives on planes that move as units.
- **Lateral space** — screens sit side by side; navigation moves you along an axis. Back goes left, forward goes right, always.

The specific model matters much less than **consistency**. If back sometimes slides right and sometimes fades, the user's spatial model never forms, and they lose the sense of where they are in the product — which shows up as "I can never find anything" complaints that get misdiagnosed as IA problems.

**Interruptibility, and this is the one thing most designers get wrong.** Real interfaces get interacted with mid-animation. The animation must be *interruptible and reversible* from any point — if a user taps to close while the panel is still opening, it must reverse smoothly from where it is, not finish opening and then close. Non-interruptible animation is the fastest way to make an interface feel unresponsive, because it makes the system feel like it's ignoring the user. This is why spring physics are increasingly preferred over fixed-duration curves for direct-manipulation gestures: springs handle interruption naturally.

### SOURCE
[Material's motion choreography and transition patterns](https://m3.material.io/styles/motion/overview). Then spend twenty minutes on [Mobbin](https://mobbin.com/) or by screen-recording apps you admire at 0.25× speed — watch the choreography frame by frame. This is a form of study you're already equipped for and most designers aren't.

### DRILL
Take the most important transition in your Studio B flow — probably list → detail. Storyboard it properly: what moves, what stays, what leads, what follows, what the timing offsets are, and what happens if the user interrupts it at 40%. Then build it in Figma (Smart Animate) or Rive/After Effects. Specify it in tokens.

---

## Day 4 — The response-time budget and the Doherty Threshold

### CONCEPT

Week 3 introduced the three time thresholds. This day is about designing *inside* them when the system won't cooperate.

**The Doherty Threshold** (IBM, 1982): productivity rises sharply when system response drops below **400ms** — and importantly, it rises *superlinearly*. The finding wasn't just "fast is better"; it was that below ~400ms the user and the machine enter a state where neither waits for the other, and the user stays in flow, works faster, and explores more.

The corollary that matters: **above the threshold, the user's attention leaves.** And attention returning is not free — they have to re-establish where they were, what they were doing, and what they were holding in working memory. The cost of a 2-second wait is not 2 seconds; it's 2 seconds plus a re-orientation plus a lost train of thought.

**The budget:**

| Actual response | Required design response |
|---|---|
| **< 100ms** | Nothing. The result is the feedback. Do not add a spinner — you'd be *adding* perceived latency to something that felt instant. |
| **100–300ms** | State change on the control itself. Pressed state, subtle transition. |
| **300ms–1s** | Immediate acknowledgement + in-place indication. Skeleton, inline spinner. |
| **1–10s** | Determinate progress if at all possible. Keep the user oriented. Allow cancellation. |
| **> 10s** | Design a *departure and return*. Let them leave. Notify on completion. Preserve context so returning is cheap. |

**Perceived vs actual duration — where the design leverage actually is.** You often can't make the system faster, but perceived duration is substantially malleable:

- **Occupied time feels shorter than unoccupied time.** Progress that shows *what's happening* ("Analysing 240 of 1,200…") feels faster than an identical wait behind a spinner.
- **Uncertain waits feel longer than known waits.** An estimate — even a rough one — reduces perceived duration.
- **Anxiety inflates duration.** Reassurance about state ("Your file is safe, we're just processing it") measurably shortens a wait.
- **Early progress feels faster.** Progress bars that move quickly at the start and slow at the end are perceived as faster than linear ones, even at identical total duration. This is a well-replicated finding and it's mildly manipulative — use it for genuinely variable-duration operations, not to disguise a system you should have optimised.
- **The Peak-End Rule applies to waits.** People judge an experience by its worst moment and its ending. A wait that ends cleanly and satisfyingly is remembered as shorter.

**Optimistic UI** is the strongest technique available: show the result immediately, reconcile with the server afterwards. It takes a 400ms operation to a 0ms one perceptually. **But it's a promise, and you must design the retraction** — what happens when it fails, how the user finds out, whether their subsequent actions are still valid. An optimistic UI without a designed failure path is a product that lies to its users, occasionally, silently. That's worse than being slow.

### SOURCE
[Laws of UX — Doherty Threshold](https://lawsofux.com/doherty-threshold/) and NN/g's [Response Times: The 3 Important Limits](https://www.nngroup.com/articles/response-times-3-important-limits/).

### DRILL
Take one slow operation in a product you use — an export, a search, a generation. Time it. Then redesign the wait: what's shown at 0ms, 300ms, 1s, 5s, 15s? What can be optimistic? What's cancellable? What does the user see if it fails at second 12? Specify the whole timeline, not just the loading state.

---

## Day 5 — Designing for latency: skeletons, optimism, perceived performance

### CONCEPT

Practical patterns for the wait, and when each is right. This matters disproportionately for AI products, where waits are long, variable and unavoidable — which is the bridge into Studio C.

**The loading patterns, and their honest tradeoffs:**

| Pattern | Right when | Wrong when |
|---|---|---|
| **Nothing** | < 100ms | Anything longer — user thinks the click missed |
| **Spinner (indeterminate)** | 300ms–1s, unknown duration, small area | > 2s (feels stuck), or full-page (destroys context) |
| **Skeleton** | Layout is known in advance, 300ms–3s | Layout is unknown — a wrong skeleton is worse than none, because it promises a shape you then contradict |
| **Progress bar (determinate)** | You genuinely know the proportion | You're faking it. Users learn instantly, and a lying progress bar destroys trust in every other indicator you have |
| **Streaming / progressive** | Output arrives incrementally | Output is only meaningful complete |
| **Optimistic** | Success is very likely and failure is recoverable | Failure is likely, or consequences are serious (payments, deletes) |
| **Background + notify** | > 10s | Anything shorter — being sent away is its own cost |

**Skeletons, properly.** They work because they preserve layout and set expectations — and they fail badly when done carelessly:
- The skeleton must **match the real layout**. If content arrives in a different shape, you've caused a layout shift *and* broken a promise.
- Skeleton shimmer should be **slow and low-contrast**. A fast, high-contrast shimmer is a pre-attentive attention magnet pointed at nothing.
- **Don't skeleton for under ~300ms** — the flash is worse than the wait. Delay the skeleton's appearance by 200–300ms so fast responses never show one.
- Skeleton the *structure*, not every atom. Three grey bars, not a pixel-perfect grey clone.

**Streaming — the pattern that matters most for your work.** When output arrives incrementally (an LLM response, a large upload, a search index), streaming converts a long wait into an immediately-started experience. The design questions:

- **What arrives first, and is it useful alone?** Streaming a summary before detail is far better than streaming left-to-right through content that only makes sense complete.
- **How does the user know it's still going vs finished?** The end of a stream needs an explicit marker. Ambiguity here is a real and common failure — users can't tell "done" from "stalled."
- **Can they act on partial output?** Copy it, stop it, edit it, send it? Being able to *stop* a stream is a control affordance that dramatically changes how a slow system feels, because it converts waiting into a choice.
- **Does the layout jump as content arrives?** Streaming text that reflows a page under a user's cursor is a Fitts disaster.

**The reading-speed constraint, which is genuinely counter-intuitive:** streamed text that arrives faster than reading speed provides no benefit over showing it complete — and it can be worse, because moving text is harder to read than static text. Streaming's value is in *starting sooner*, not in the animation. If your model returns in 800ms, showing the complete answer is better than streaming it. This is a real design decision that most AI products make by default rather than deliberately.

### SOURCE
NN/g on [progress indicators](https://www.nngroup.com/articles/progress-indicators/) and [skeleton screens](https://www.nngroup.com/articles/skeleton-screens/). Then examine three AI products' streaming behaviour closely — screen-record and step through. Note where each marks completion.

### DRILL
Design the **complete latency experience** for one operation in your Studio B product — timeline from 0ms to failure, with every pattern choice justified. Then do it for an AI operation you use daily, and write down three things it does wrong. Those three things are candidate design work for Studio C.

---

## Day 6 — Studio C kickoff: the AI feature brief

### CONCEPT

Read the [[03 The Studios|Studio C brief]] in full. This is your capstone and your portfolio piece.

**Today's real work is choosing well and enumerating failure.** Two things:

**1. The failure-first discipline.** Before any screen exists, enumerate how the model can be wrong. This is the inversion that makes an AI design good, and almost nobody does it. The taxonomy:

- **Confidently wrong** — plausible, fluent, incorrect. *The hardest and most important case.*
- **Subtly wrong** — mostly right with an error buried in the middle
- **Refuses** — declines a reasonable request
- **Over-complies** — does something it shouldn't
- **Misunderstands intent** — answers a different question correctly
- **Stale or out of scope** — lacks context it needed
- **Slow or times out** — the latency case from Days 4–5
- **Inconsistent** — different answer to the same input

For each: **how would the user find out, and what can they do about it?** If the answer to the first question is "they wouldn't," that's your primary design problem, and the whole feature should be shaped around it.

**2. The verification-cost test.** From Week 2 Day 3: does the feature reduce total work, counting the cost of checking? Write this out honestly. Many AI features fail it, and identifying that in a brief — before four weeks of design — is exactly the judgment this course is meant to build.

### DRILL — Deliverables C1 + C2

**C1 — Feature brief** (one page):
- The job (Week 4 format), and the evidence it exists
- The capability, stated precisely — what the model does, in one sentence
- **The failure taxonomy** — all eight categories above, with detectability and recovery for each
- **The verification-cost analysis** — honest
- The appetite, and what fits in it
- What you're explicitly not doing

**C2 — Motion spec:**
- Your motion tokens finalised with real values
- The latency timeline for the core AI operation: 0ms → complete → failure
- Streaming behaviour specified: what arrives first, completion marker, stop control, layout stability
- Reduced-motion variants for everything

*Time check: C1 ~50 min, C2 ~40 min.*

> `/product-design-course critique C1` — I'll pressure-test the failure taxonomy specifically. Under-enumerating failure modes is the defining weakness of AI design work and it's very hard to see from inside.

---

## Week 9 self-check

1. Where have I used motion expressively on something high-frequency? *(There will be somewhere.)*
2. Which of the four jobs do I under-use — and I'd bet it's continuity.
3. What did I learn about my own craft by having to express it as tokens?
4. Where did I default to visual craft instead of the harder thinking this week?

---

> **Phase 3 complete.** You've converted taste into systems and motion into information. Phase 4 is about everything that determines whether the work survives contact with real users and real organisations.
