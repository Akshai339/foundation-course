---
tags: [product-design, course, week, phase/foundations]
week: 3
phase: Foundations
---

# Week 03 — Interaction, State and Evaluation

> **The week's thesis:** An interface is a state machine that a human is trying to steer. Most usability failure is the human being unable to tell what state they're in, how they got there, or how to leave. This week you learn to see state — and to evaluate an interface with a repeatable method rather than an opinion.

**Studio:** [[03 The Studios|Studio A]] — full evaluation writeup on Day 6.
← [[Week 02 — Human Capabilities and the Laws]] · next → [[Week 04 — Problem Framing and Product Sense]]

---

## Day 1 — Nielsen's 10 heuristics, properly understood

### CONCEPT

Everyone has seen this list. Almost nobody uses it well, because it gets taught as a checklist when it's actually a **diagnostic vocabulary**. The value isn't ticking ten boxes; it's that when something feels wrong you have ten specific hypotheses to test instead of a vague unease.

Here they are, with what each actually means in product work:

**1. Visibility of system status.** The system should always keep users informed about what's going on, through appropriate feedback within reasonable time. — *The most violated and the cheapest to fix.* Covers loading, saving, syncing, progress, and "did my thing take." Norman's stage 5.

**2. Match between system and the real world.** Speak the user's language; follow real-world conventions. — *This is a conceptual model heuristic.* "Archive" vs "Move to Cold Storage Tier." Your naming decisions live here.

**3. User control and freedom.** Users need a clearly marked emergency exit. — Undo, redo, cancel, back. The right to change your mind. Directly connected to Week 2's error handling.

**4. Consistency and standards.** Users shouldn't wonder whether different words or actions mean the same thing. — Two kinds: **internal** (within your product) and **external** (with platform and category conventions). External consistency is Jakob's Law: users spend most of their time on *other* products, so their expectations are formed elsewhere. See Day 5's caveat, though — Grudin's paper on why consistency is not an absolute good.

**5. Error prevention.** Better than good error messages is a design that prevents the problem. — Week 2's constraint hierarchy.

**6. Recognition rather than recall.** Minimise memory load by making objects, actions and options visible. — Week 2's working-memory tax.

**7. Flexibility and efficiency of use.** Accelerators — unseen by novices — speed up the expert. — Keyboard shortcuts, command palettes, saved views, bulk actions. **The most neglected heuristic in consumer-influenced design**, because designers optimise for the first-run experience they see in demos and never for the thousandth run. If your users use the product daily, this heuristic outranks most of the others.

**8. Aesthetic and minimalist design.** Dialogues shouldn't contain irrelevant or rarely needed information. — Note: this says *relevance*, not *sparseness*. Removing needed density to look clean is a violation of this heuristic, not an application of it. Misreading this one has caused enormous damage.

**9. Help users recognise, diagnose, and recover from errors.** Plain language, precise problem, constructive solution. — Three requirements, and most error messages meet zero.

**10. Help and documentation.** Ideally unnecessary; realistically, provide it, searchable, task-focused, concrete.

**How to actually use them:** when you notice something feels wrong, run down the list and ask "is it this one?" You'll usually hit it in three or four. Then you have a *named* problem, which means you can propose a *class* of fix rather than a bespoke patch. That's the difference between fixing a screen and fixing a system.

### SOURCE
Nielsen's [10 Usability Heuristics](https://www.nngroup.com/articles/ten-usability-heuristics/) on NN/g — the canonical statement with examples. Then, for contrast, [Tognazzini's First Principles of Interaction Design](https://asktog.com/atc/principles-of-interaction-design/) — longer, more opinionated, more prescriptive.

### DRILL
Take a product you use daily. Find one **clear violation of each** of the ten. If you can't find one for a given heuristic, that's a finding too — write down which ones the product does well and hypothesise why (usually: it reflects what the team measures). This takes about an hour and is the fastest way to internalise the list.

---

## Day 2 — Modes, state and visibility: the most common structural bug

### CONCEPT

**A mode is a state in which the same user input produces a different result.** Caps Lock is a mode. Vim's insert vs normal is a mode. "Edit mode" vs "view mode" is a mode. So is having a tool selected in Figma, and so is having text selected.

**A mode error** is doing the right thing in the wrong state. They are not rare edge cases — they are among the most frequent and most infuriating failures in software, and they are almost entirely a *visibility* problem. Larry Tesler spent his career fighting modes hard enough that his licence plate read NO MODES.

**Why modes are so dangerous:** the user's action is *correct for their believed state*. So they don't perceive an error — they perceive the system misbehaving. This destroys trust much faster than an ordinary failure does, because it makes the system feel unpredictable rather than merely difficult.

**The three tolerable kinds of mode:**

1. **Spring-loaded / quasi-modes** — the mode only persists while you're physically holding something. Shift for uppercase. Holding space to pan in Figma. These are nearly error-free, because your own body is the state indicator. **This is the single best trick in interaction design** and it's underused everywhere outside professional tools.
2. **Modes with overwhelming visibility** — the state is impossible to miss. A full-screen colour change, a persistent banner, a changed cursor, a border around the entire viewport.
3. **Modes the user explicitly and recently chose** — and even then, only if step 2 also applies.

Everything else is a bug waiting for a user.

**Seeing state properly.** The most useful discipline from this day: for any screen, enumerate its state dimensions. A single "inbox" screen is really:

```
loading × (empty | has-items) × (filtered | unfiltered) × (selection: none | one | many)
    × (online | offline) × (permissions: read | write) × (error | ok)
```

That's not one screen. That's dozens of meaningful combinations, of which maybe eight matter. **Most designers design one.** Then engineering invents the other seven, badly, at 6pm on a Friday, and the product feels incoherent — and everyone blames engineering, when the actual failure was that nobody designed the states.

This enumeration is the **state matrix**, and building one is the most reliably impressive thing a mid-level product designer does. We'll build one properly in Week 6 and again in Week 10. Start noticing them now.

**Where this bites in AI products:** an AI feature has states most designers never enumerate — *idle, prompted, thinking, streaming, complete, stopped-by-user, refused, errored, partially-wrong-but-completed*. That last one has no visual language yet in most products, which is why AI features so often feel unfinished at the edges.

### SOURCE
[MIT 6.831 Lecture 8 — Design Principles](https://ocw.mit.edu/courses/6-831-user-interface-design-and-implementation-spring-2011/), covering modes and visibility. Optionally Jef Raskin's *The Humane Interface* on modelessness — the most extreme and most interesting position on this.

### DRILL
Find **three modes** in software you use — at least one you didn't previously think of as a mode. For each: how is the state signalled? How would you know you were in the wrong one? Design a better signal for the weakest of the three. Then pick any one screen and write out its full state dimensions as above.

---

## Day 3 — Feedback and the response-time budget

### CONCEPT

Feedback is where you convert a system's internal events into the user's understanding. It's Norman's stages 5 and 6, and it is the cheapest high-value work in product design.

**The three time thresholds** (Miller 1968, popularised by Nielsen — they've held up for fifty years):

| Threshold | User experience | Design response |
|---|---|---|
| **~100ms** | Feels instantaneous; feels like *you* caused it | No feedback needed — the result *is* the feedback |
| **~1 second** | Flow of thought preserved, but the delay is noticed | Show something immediate: state change, spinner, optimistic result |
| **~10 seconds** | Attention lost; user will switch tasks | Must show *progress and estimate*, and allow leaving/returning |

Under 100ms, you get direct manipulation's engagement for free. Over 1 second, you must actively defend the user's attention. Over 10 seconds, you must design a *departure and return* experience — because they will leave, and if they can't return cleanly, you've lost the task.

**Four properties of good feedback**, in rough order of how often they're missed:

1. **Immediate.** Feedback that arrives after the network round-trip is too late. Acknowledge the *input* instantly and the *result* when it arrives. These are two different feedback events and most products only build the second.
2. **Located.** Feedback belongs where the action happened, or where the consequence is. A toast in the corner about something that happened in the middle of the page is feedback the user's fovea never sees. Selective attention means peripheral feedback frequently just doesn't register.
3. **Proportionate.** The magnitude of the feedback should match the magnitude of the event. A full-screen modal for a successful save is aggressive; a 200ms fade for "your account has been deleted" is negligent. Getting this wrong systematically is what makes a product feel either nagging or careless.
4. **Informative about state, not just activity.** "Loading…" tells the user the system is busy. "Loading 240 of 1,200 records" tells them what's happening and how long. The second costs almost nothing more and transforms the wait.

**The most common feedback bug in modern products:** *optimistic UI without failure handling.* You show the result instantly (great — 100ms rule satisfied), the request fails silently, and now the user's mental model and the system's state have diverged and neither of you knows. Optimistic UI is a promise. If you make it, you must design the retraction — and the retraction must be *noticeable*, because the user has already moved on.

**Your motion advantage.** Nearly all of this is temporal craft: what appears when, for how long, with what easing, in what order. Most product designers have no training in time-based work and produce feedback that is technically present and perceptually useless. You already have the instrument. What you're learning here is what to *point it at* — and Week 9 makes this the whole subject.

### SOURCE
[Response Times: The 3 Important Limits](https://www.nngroup.com/articles/response-times-3-important-limits/) — NN/g. Short. Then browse [Material's duration & easing guidance](https://m1.material.io/motion/duration-easing.html) with these thresholds in mind.

### DRILL
Instrument one flow you use: for each action, roughly time the gap between input and visible response. Classify each against the three thresholds. Find the worst offender and design its feedback properly — immediate acknowledgement, located, proportionate, informative. Specify the durations.

---

## Day 4 — Heuristic evaluation as a method

### CONCEPT

Here is where you stop having opinions and start producing findings. Heuristic evaluation is a **discount usability method**: a small number of evaluators inspect an interface against a set of principles, independently, then merge. Nielsen and Molich published it in 1990 and it remains the highest value-per-hour evaluation technique that exists.

**Why it works despite sounding unrigorous:** individual evaluators find only ~30% of usability problems, but *different* evaluators find *different* problems. Aggregating three to five gets you to roughly 70–80%. The method's power is in the aggregation, not the individual insight.

**The protocol — follow it exactly, the discipline is the point:**

1. **Define the scope**: specific flows and specific user goals. Not "evaluate the app."
2. **Go through the interface at least twice.** First pass for flow and feel, second pass for element-level inspection. The two-pass rule exists because you cannot see detail and structure simultaneously.
3. **Evaluate independently.** If you're doing this alone, evaluate on two different days, or do one pass yourself and one with me. Discussing before recording contaminates findings — the loudest opinion wins and you lose the diversity that makes the method work.
4. **Record each problem separately**, with: location, the heuristic violated, why it's a problem, and severity.
5. **Only then**, aggregate and discuss.

**Severity rating** — the part everyone skips, and the part that makes your report usable by a team. Rate on the combination of three factors: *frequency* (how often does this happen), *impact* (how bad when it does), *persistence* (does the user learn around it, or hit it every time).

| | |
|---|---|
| **0** | Not a usability problem |
| **1** | Cosmetic — fix if there's spare time |
| **2** | Minor — low priority |
| **3** | Major — important to fix, high priority |
| **4** | Catastrophe — imperative to fix before release |

**A rule that will save your reputation:** most novice evaluations rate everything 3 or 4. If everything is major, nothing is, and your report gets ignored. Force a distribution. If you have twenty findings, expect roughly two 4s, five 3s, and the rest 1s and 2s. The willingness to call your own finding a "1" is what makes people believe your "4."

**Writing findings that get acted on.** Dumas, Molich and Jeffries wrote a paper specifically on this, and the summary is: describe the *problem*, not the *solution*, and be specific about the user consequence. Compare:

> ✗ "Make the Save button blue."
> ✓ "The Save button (screen 4) uses the same weight and colour as Cancel, so in the two-pass eye scan the primary action isn't identified. Users hesitate before committing. [Heuristic 8, aesthetic/minimalist; Severity 3]"

The second is longer and it's the one that gets fixed, because it explains a mechanism a PM can weigh.

### SOURCE
★ **Nielsen & Molich (1990), "Heuristic evaluation of user interfaces," CHI '90.** Plus NN/g's [How to Conduct a Heuristic Evaluation](https://www.nngroup.com/articles/how-to-conduct-a-heuristic-evaluation/). If you want the finding-writing craft: Dumas, Molich & Jeffries (2004), "Describing usability problems: are we sending the right message?"

### DRILL
Run a **timed 45-minute heuristic evaluation** on a small, contained interface — a settings page, a single form, a checkout step. Follow the protocol strictly, including two passes and severity ratings. Force a severity distribution. Count your findings. This is a rehearsal for Day 6.

---

## Day 5 — Cognitive walkthrough: the four questions

### CONCEPT

Heuristic evaluation asks *"is this interface well-built?"* Cognitive walkthrough asks a different and often more revealing question: **"can a first-time user figure this out?"** It's specifically a *learnability* method, and it's the right tool whenever discovery matters — onboarding, new features, infrequently-used flows.

You walk through a specific task, step by step, in the persona of someone who has never used it. At **each action**, you ask four questions:

1. **Will the user try to achieve the right effect?** — Do they even know this sub-goal exists? *(This is the one that catches features nobody finds.)*
2. **Will the user notice that the correct action is available?** — Is the control visible and perceptible? *(Signifiers, Week 1.)*
3. **Will the user associate the correct action with the effect they're trying to achieve?** — Does the label/icon/position communicate what it does? *(Mapping, Week 1.)*
4. **If the correct action is performed, will the user see that progress is being made?** — Feedback. *(Norman stage 5.)*

For each question you answer yes or no, and **if no, you write a failure story** — a plausible narrative of what the user does instead. The failure story is the deliverable, not the "no." A no is a score; a story is a bug report someone can act on.

**Where it beats heuristic evaluation:** it catches *discoverability* failures that heuristic evaluation misses entirely. A perfectly-designed feature that nobody knows exists passes all ten heuristics and fails question 1. In products where the biggest problem is "nobody uses the thing we built," this is nearly always the diagnosis, and nearly always found here.

**The hard part, honestly:** you have to genuinely simulate not-knowing, and you *do* know. Two things help. First, be specific about who the user is and what they've seen before — vague "a user" defaults to you. Second, when you answer "yes, obviously," ask *why* obviously: is it because the interface says so, or because you already know? If the answer is the second, it's a no.

**One thing to be honest about:** this is the method with the largest gap between the effort of running it and the comfort of running it. It is slow and it feels pedantic. It is also the method that most reliably finds the problems that kill adoption. Do it anyway.

### SOURCE
Polson, Lewis, Rieman & Wharton (1992), "Cognitive walkthroughs: a method for theory-based evaluation of user interfaces." Listed in the [CS6750 syllabus](https://omscs6750.gatech.edu/spring-2022/required-reading-list/), Week 11. NN/g's [Cognitive Walkthroughs](https://www.nngroup.com/articles/cognitive-walkthrough-workshop/) is a lighter entry point.

### DRILL
Pick a feature in a product you know well but that a newcomer would have to *discover* — not a login, something optional. Walk through it with the four questions, one action at a time, writing a failure story at every "no." Then, hardest part: **do the same for something you designed.** Notice how much you're assuming.

---

## Day 6 — Studio A: the full evaluation writeup

### CONCEPT

Today you produce the thing an actual team would read. This is a deliverable, not an exercise — write it as if you were handing it to a PM who has fifteen minutes.

**Structure** (this is a genuinely reusable template — keep it):

1. **Scope & method** — half a page. What flow, what user goal, what methods, what you did *not* cover. Naming your gaps is what makes the rest credible.
2. **Summary of findings** — a severity-sorted table. This is the only part most people read, so it must stand alone.
3. **Detailed findings** — one block each: screen reference, description of the problem, heuristic or principle violated, the user consequence, severity, and a suggested direction (not a full solution).
4. **What's working** — 3–5 things the product does well and why. This is not politeness. It stops you from redesigning something that's load-bearing, and it makes your criticism credible.
5. **The three that matter** — your prioritisation. Which three would you fix, in what order, and what are you consciously choosing *not* to fix.

**Also do this, and don't skip it:** go back to the paragraph you wrote in Week 1 Day 6 predicting what was wrong with this flow. Compare it to what you actually found. Write a paragraph on the gap.

That comparison is the most valuable single artifact of the entire first phase. It's a direct measurement of how much your intuition was missing, and it will tell you what to distrust in yourself for the rest of your career.

### DRILL — Deliverable A3

Write the full evaluation report. **Target: 1,200–1,800 words plus annotated screens.** Aim for 15–25 findings with a forced severity distribution.

Then the Week 1 prediction comparison, one honest paragraph.

*Time check: findings assembly ~40 min, writing ~40 min, prediction comparison ~15 min.*

> Ask me to review it: `/product-design-course critique A3`. I'll grade it against [[04 Rubrics and Self-Critique]] and specifically check whether your findings are structural or cosmetic.

---

## Week 3 self-check

1. Which heuristic do I most consistently violate in my own work?
2. What's a mode I've designed without realising it was a mode?
3. How far off was my Week 1 intuition, and in which direction?
4. Where did I default to visual craft instead of the harder thinking this week?

---

> **Phase 1 complete.** You now have: a mechanical model of the user, five named laws, and two repeatable evaluation methods. From here the questions stop being "is this good?" and start being "should this exist?"
