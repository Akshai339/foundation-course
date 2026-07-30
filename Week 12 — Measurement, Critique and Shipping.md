---
tags: [product-design, course, week, phase/professional]
week: 12
phase: Professional Layer
---

# Week 12 — Measurement, Critique and Shipping

> **The week's thesis:** Design work that can't be measured, defended, or handed over doesn't ship. This is the week that converts a designer into a colleague other people want to work with — and it's the week where your marketing and GTM background stops being a side note and becomes an advantage.

**Studio:** [[03 The Studios|Studio C]] closes — the case study on Day 6.
← [[Week 11 — Designing AI Products]] · back to [[00 Start Here]]

---

## Day 1 — HEART and Goals–Signals–Metrics

### CONCEPT

Designers who can't talk about measurement get overruled by people who can. You have an advantage here — you've run performance marketing, so you're already fluent in funnels, cohorts, and attribution. The transfer is mostly about **what to measure when the goal is quality of experience rather than conversion.**

**HEART** (Rodden, Hutchinson & Fu, Google, CHI 2010) — five categories of user-centred metric:

| | | Example signals |
|---|---|---|
| **H**appiness | Attitudinal — how do they feel? | Satisfaction, NPS, perceived ease, star ratings |
| **E**ngagement | Depth of involvement per user | Sessions per week, actions per session, time in core task |
| **A**doption | New users of a feature | % of eligible users who tried it in 30 days |
| **R**etention | Users who come back | % still active after 4 weeks |
| **T**ask success | Efficiency and effectiveness | Completion rate, time on task, error rate |

**You do not measure all five.** The paper's own guidance is to pick the categories that matter for *this* product at *this* stage. A new feature cares about Adoption and Task Success. A mature product cares about Retention and Happiness. Filling in all five is a sign you haven't decided what matters.

**The mechanism that makes HEART actually usable is GSM — Goals, Signals, Metrics:**

1. **Goal** — what does success mean for this feature, for the user *and* the business? Write both.
2. **Signal** — what observable behaviour would indicate it? *This is where the thinking is.* How does success manifest as something a human does?
3. **Metric** — how do you turn that signal into a trackable number?

Worked example for an AI feature:

| | |
|---|---|
| **Goal** | Users draft client updates faster, without losing their voice |
| **Signal** | They accept generated drafts with light edits rather than rewriting or abandoning |
| **Metric** | Acceptance rate; median edit distance; % abandoned; time-to-send vs manual baseline |

Notice the metric set includes a **counter-metric** (abandonment) and a **baseline** (manual). Both are essential and both are usually missing.

**The counter-metric discipline — the most valuable habit in this day.** Every metric can be gamed by a bad design. Pair each with something that would degrade if you optimised the first one dishonestly:

| Primary | Counter-metric |
|---|---|
| Engagement ↑ | Task completion time ↓ *(are they engaged or lost?)* |
| Adoption ↑ | Retention of adopters *(did they come back?)* |
| Acceptance rate ↑ | Edit distance, and downstream correction rate *(accepted ≠ correct)* |
| Time on task ↓ | Error rate *(faster and wronger is not better)* |

**On vanity metrics**, which your marketing background will make you allergic to already: total users, page views, and time-on-site are almost never design metrics. Time-on-site *rising* is ambiguous — engagement or confusion, indistinguishable without a counter-metric. Say this out loud in meetings; it's the single most useful contribution a designer can make to a metrics conversation.

**What design can and can't be held to.** Be precise about this, because it protects you. Design can reasonably be held to task success, error rates, adoption of a feature, and perceived ease. Design cannot be held to revenue, retention at the company level, or growth — too many other variables. Agreeing the measurable surface *before* you ship is how you avoid being blamed for a market condition.

### SOURCE
★ [Rodden, Hutchinson & Fu (2010) — the HEART paper, free PDF](https://research.google.com/pubs/archive/36299.pdf). Short and readable. Then [Kerry Rodden's own summary](https://kerryrodden.com/heart/).

### DRILL — Deliverable C5

Build the **measurement plan** for Studio C: a HEART table with only the categories that matter (justify the exclusions), a full GSM breakdown for your primary goal, a counter-metric for every primary metric, and the five design-layer AI metrics from Week 11 Day 5. State what you'd instrument and what baseline you'd compare to.

---

## Day 2 — Experiments: what A/B testing can and cannot tell you

### CONCEPT

You know experiments from performance marketing. The transfer is good but three things differ, and the differences matter.

**What A/B testing is genuinely good at:** comparing two specific alternatives on a specific measurable outcome, with enough traffic, over a short horizon.

**What it cannot do**, and this is where design and growth teams most often talk past each other:

**1. It can't tell you what to test.** The hypothesis is the hard part and it comes from research, framing and judgment — everything in Phase 2 of this course. A/B testing is a *selection* mechanism, not a *generation* one. Teams that lean entirely on testing converge on local maxima: endlessly refined versions of a fundamentally mediocre design.

**2. It's biased toward short-horizon, easily-measured outcomes.** Trust, comprehension, learnability, and the quality of a user's mental model develop over weeks and are near-invisible in a two-week test. This is why testing systematically over-rewards dark patterns and urgency mechanics — they win the two-week window and lose the two-year one. **Being able to name this bias is one of the most valuable things a designer contributes to a growth team.**

**3. Novelty and change-aversion contaminate the window.** New things get engagement because they're new; changes to familiar things get resistance because they're changes. Both effects decay. A two-week test frequently measures neither the old nor the new design but the *transition*.

**Statistical points worth having ready** (you'll know most of these):
- Underpowered tests are worse than no test — a "win" from insufficient sample is noise you'll now build on
- Peeking and stopping when significant inflates false positives dramatically
- Testing many variants without correction guarantees a spurious winner
- Segment effects hide in aggregates: a change can help new users and hurt power users and net to zero

**When *not* to A/B test**, which is the more useful list:
- Low traffic — you'll never reach power; use qualitative methods
- The change is obviously correct — testing a WCAG fix is a waste of a cycle
- The outcome is long-horizon — use cohorts and longitudinal measures
- It's a structural change — you're not comparing two buttons, you're comparing two products
- It would require shipping something you believe is harmful. **You are allowed to say no to this**, and the argument is that a test that damages trust costs more than the information is worth.

**The healthy relationship:** qualitative research tells you *what to build and why* (Weeks 4–6). Usability testing tells you *whether it's comprehensible* (Week 5). A/B testing tells you *which of two comprehensible options performs better at scale*. Using any one for another's job produces the characteristic failures of each discipline.

### SOURCE
The [ab-testing skill](https://claude.ai) available in this environment covers experiment design practically. For the design-specific critique, NN/g's writing on the limits of A/B testing.

### DRILL
For your Studio C feature, write **two hypotheses you'd A/B test and two questions you'd refuse to A/B test**, with reasons for the refusals. The refusals are the interesting half.

---

## Day 3 — Critique: how to run one, how to survive one

### CONCEPT

Critique is the mechanism by which design quality gets built socially rather than individually. Done well it's the highest-leverage hour in a design team's week. Done badly it's a status contest that makes everyone defensive and produces worse work.

**The structural rule from [[04 Rubrics and Self-Critique]], and it's the whole game: three passes, in order.**

1. **Structural** — is this the right set of screens and steps at all?
2. **Interaction** — within this structure, is each step clear, forgiving, low-load?
3. **Visual** — hierarchy, spacing, type, colour.

Critiques default to pass 3 because visual issues are the easiest to see and safest to raise. The result is a room full of people polishing a structure nobody examined. **The single most valuable thing a facilitator does is refuse to let the conversation start at pass 3.**

**Running a critique:**

- **The presenter frames first**, in two minutes: the job, the constraint, and the *specific thing they want help with*. Without a stated ask, you get scattered opinion.
- **Set the stage explicitly** — exploration, or converging on a decision? Feedback that's appropriate for one is destructive to the other.
- **Silent review first**, 5 minutes. Everyone writes notes before anyone speaks. Otherwise the first speaker anchors the room and you lose the diversity that makes critique work — the same mechanism as independent heuristic evaluation in Week 3.
- **Questions before opinions.** "What happens if the list is empty?" surfaces more than "I don't like the empty state."
- **Separate the observation from the prescription.** "I couldn't tell which was the primary action" is a finding. "Make it blue" is a solution, and it's the presenter's job to generate those.
- **Timebox and capture.** Someone writes it down or it didn't happen.

**Figma's team documented six different critique formats** for different situations — small group deep dives, large-group broad feedback, async written critique, and so on. The insight worth stealing: **one format doesn't fit every situation**, and matching the format to the stage of work is most of what makes critique feel useful rather than exhausting.

**Receiving critique** — the harder skill:

- **Your only job is to understand.** Write everything down before responding to any of it. The instinct to explain is the instinct that stops you hearing, and it's strongest exactly when the feedback is most useful.
- **Distinguish the three things you'll hear:** a *problem* (valuable, always), a *solution* (treat as a symptom — find the problem underneath), and a *preference* (acknowledge, weigh, often discard).
- **"Tell me more about that"** works here too.
- **You don't have to act on everything.** You do have to be able to say why you didn't. Unexplained non-action is how designers lose the room's willingness to engage.
- **Notice defensiveness as data.** The point you most want to defend is usually the one you're least sure about.

**On stakeholder feedback specifically** — the thing your marketing background prepared you for: stakeholders are **excellent problem detectors and unreliable solution generators**. When a VP says "make the logo bigger," the useful response is not compliance or resistance but translation: *what did you notice that made you say that?* Usually there's a real finding underneath — the brand doesn't feel present, or the page reads as generic — and the real finding has better solutions than the one proposed.

### SOURCE
★ [How we do design critiques at Figma](https://www.figma.com/blog/design-critiques-at-figma/) and the longer [Noah Levin version](https://nlevin.medium.com/design-critiques-at-figma-799d4a3a1b0) — six formats and the reasoning behind each.

### DRILL
Run a **real critique** on Studio C. Get two people — ideally one non-designer. Frame it properly, silent review first, enforce the three passes in order. Capture everything. Then write your response: what you'll act on, what you won't, and why.

---

## Day 4 — Design rationale: the document that gets you trusted

### CONCEPT

The single most reliable way to be treated as senior is to write down your reasoning before you're asked for it.

**Why it matters more than it seems.** Design decisions get revisited constantly — by a new PM, in a quarterly review, by an engineer six months later, by you when you've forgotten. Without written rationale, every revisit is a fresh argument decided by whoever is most senior or most recently annoyed. **With it, the decision is a fact with a reason attached, and the conversation moves to whether the reason still holds** — which is a much better conversation.

**The structure of a good rationale doc:**

1. **The decision**, in one sentence.
2. **The problem it addresses**, with evidence — research finding, metric, support volume, heuristic violation.
3. **The options considered** — at least three, including the obvious one and the one you rejected. *This section is what makes the doc credible.* A document with one option reads as a justification; a document with three reads as a decision.
4. **Why this one** — the reasoning, the principle, the tradeoff.
5. **What we're giving up.** Explicit. Every decision costs something and naming yours is the fastest signal of seniority available to you.
6. **What would change our mind** — the conditions under which this should be revisited. Turns a decision into a hypothesis, which is both more honest and more defensible.
7. **How we'll know it worked** — the metric from Day 1.

**Length: one page.** If it's longer, the decision is probably three decisions.

**The habit worth building:** write the rationale *while* designing, not after. Writing forces you to notice when you don't actually have a reason — which is the most useful moment in the whole process, because it's the point where you discover you were about to ship an assumption. Designing and writing are the same activity done at different resolutions.

**On tone.** Confidence with stated uncertainty. "I recommend X. The main risk is Y, and if Z happens we should reconsider." This reads as far more competent than either false certainty or hedging, because it demonstrates you've modelled the failure case.

**Your specific advantage, and be conscious of it:** you write for a living already. Most designers don't and find this genuinely difficult. Being the designer who reliably produces clear one-page rationale docs is a differentiator that costs you almost nothing and compounds enormously — it's how you become the person whose opinion is asked for before decisions rather than after.

### SOURCE
Shape Up's [pitch format](https://basecamp.com/shapeup) is the closest thing to a template for this. Also read a few public architecture decision records (ADRs) from engineering — the format transfers directly and reading them will show you the register.

### DRILL
Write **three rationale docs**, one page each, for the three most significant decisions in Studio C. Full structure. At least one must be a decision you're genuinely uncertain about — and the doc must say so.

---

## Day 5 — Working with engineering and PM

### CONCEPT

The last skill: getting the work built the way you intended, without being the person who blocks everything.

**What engineers actually need from you**, in order of how much it helps them:

1. **States, not screens.** Every state from your Week 6 and Week 10 matrices. This is the number one gap, and filling it prevents most implementation drift.
2. **Rules for the cases you didn't draw.** "All list errors use inline error + retry" covers more ground than fifty artboards and it's what makes the product coherent at the edges.
3. **Component APIs, not artboards** (Week 8, Day 3). Props, variants, slots, invalid combinations.
4. **Tokens, named as they'll be in code.** If your Figma variable is `action-primary` and their CSS variable is `--color-action-primary`, handoff is a lookup rather than a translation.
5. **What's essential vs what's flexible.** Mark it explicitly. Engineers will make a hundred small decisions; telling them which ones you care about is the difference between getting what you wanted and getting a negotiation.
6. **To be available.** Most implementation drift happens because a question came up and asking you was slower than guessing.

**What PMs need:** the appetite conversation (Week 4, Day 4). Options with costs, not one solution with a deadline. "Here's the two-week version and the six-week version, and here's what the extra four weeks buys" is the sentence that makes you a partner.

**The scope conversation, and how to have it well.** When scope needs cutting, the *design* answer is not "cut quality uniformly." It's:
- **Cut breadth, not depth** — fewer flows done properly beats all flows done badly
- **Cut the rare states last, not first** — this is counterintuitive and correct. The error state is what makes the product feel trustworthy; the third onboarding illustration is what makes it feel nice. Cut nice.
- **Cut the thing you can add later without rework** — some things are cheap to retrofit and some require structural change. Know which is which, and defend the structural ones.
- **Never cut accessibility** — retrofitting costs many times more (Week 10) and it's the one cut that's genuinely irreversible in practice.

**Handoff isn't a moment, it's a relationship.** The "throw it over the wall" model produces the outcomes it deserves. What works: engineers in the critique from Week 3 onward; you in their standup occasionally; a shared understanding of what's decided and what's open. This is a *cultural* thing you can influence from any seniority, and the influence is mostly just showing up.

**Design QA — the step everyone skips and everyone should do.** Before ship, go through the built thing against your spec. Not to be precious about 2px, but to catch: missing states, wrong focus behaviour, broken responsive cases, motion that wasn't implemented, contrast that shifted. File specific, prioritised issues — and use the severity discipline from Week 3. A design QA list where everything is critical gets ignored exactly like an evaluation report where everything is severity 4.

**The one thing that matters more than any of the above:** be the person who is easy to build with. Designers who are precious, slow to respond, or who relitigate settled decisions get routed around, and the work suffers regardless of how good the design was. Being reliably responsive, clear about what's flexible, and gracious when overruled buys you enormously more design influence than being right does.

### SOURCE
[Shape Up](https://basecamp.com/shapeup) on scope hammering and the building phase. Then read your own product's engineering docs — literacy about how the thing is actually built is a genuine multiplier on your influence.

### DRILL
Write the **handoff package** for Studio C: state list, rules for undrawn cases, component APIs, token names in code convention, and an explicit "essential vs flexible" annotation on your key screens. Then write the three-question list you'd send an engineer to check your assumptions.

---

## Day 6 — The case study

### CONCEPT

The final deliverable. Read the case study structure in [[03 The Studios]] before starting.

**The one thing that determines whether this works:** section 3, *"what I had to figure out."*

Most portfolios are galleries — here's the research, here's the wireframes, here's the final screens, here's a mockup on an iPhone. They demonstrate that you can execute a process. They do not demonstrate judgment, and judgment is the only thing anyone is actually hiring for now that execution is cheap.

The case studies that work show **the two or three genuinely hard questions** and how you thought about them. Not "I did user research" but *"I had to decide whether to show confidence numerically or categorically, and here's why the numeric version was worse despite being more precise."* That paragraph is worth more than every screenshot in the deck.

**Given your background, the specific risk:** you will make this look extraordinary. Your visual and motion craft will produce a case study far better-looking than the average product designer's, and that is a genuine asset — but it will also let you hide. **The temptation will be to spend the day on the presentation and half an hour on sections 2, 3 and 8.** Do the opposite. Write the thinking first, in plain text, badly formatted. Then design it.

A reviewer skims your visuals in fifteen seconds and forms an impression. Then they read one section to decide if you can think. Make sure that section exists.

### DRILL — Deliverable C6

**The complete case study.** Structure from [[03 The Studios]]:

1. The situation — 3 sentences
2. **The problem, framed** — POV statement and the evidence
3. **What I had to figure out** — 2–3 genuinely hard questions and your reasoning. *Longest section.*
4. The exploration — including what you killed and why
5. The design — flows and screens, annotated with rationale
6. **The unhappy path** — errors, edge cases, the model being confidently wrong
7. How I'd know it worked — the HEART table from Day 1
8. **What I'd do differently** — one honest paragraph

**Write sections 2, 3 and 8 first, as plain text, before opening Figma.**

*Time check: writing ~90 min, design ~90 min. This will overflow. Take two days — it's the last thing you'll do and it's the thing people will actually see.*

> `/product-design-course critique C6` — ask me to read it as a hiring manager with 90 seconds, then as one with 20 minutes. Those are two different reads and it needs to survive both.

---

## Week 12 self-check — and the course close

1. Which metric would I have proposed in Week 1 that I now know is a vanity metric?
2. Where in Studio C did I fail to name what I was giving up?
3. Re-read the 200 words you wrote on **Week 1, Day 1** — "the last time I designed something that looked right and worked badly." What would you now say was actually wrong with it?
4. Answer the recurring question one last time: **where did I default to visual craft instead of the harder thinking?** Then look back across all twelve answers. That pattern is your development plan for next year.

---

## What you have now

Three studios' worth of work. A mechanical model of the user. Two evaluation methods. A framing process. Research you actually ran. A structural practice — task analysis, flows, state matrices. A design system you can defend. Motion converted from expression into information. Accessibility as a constraint you design inside. A working position on AI product design that very few people have. And a measurement, critique and rationale practice that makes all of it legible to other people.

**What to do next**, briefly:
- Keep the **Product Sense Log** running. It's the habit with the longest compounding curve.
- Do Studio A again on something at work, in a week rather than four. The methods should now be fast.
- Read the four books you didn't get to in [[02 Resource Library]].
- Teach one of these weeks to someone. It's the fastest way to find out what you actually understood.

← back to [[00 Start Here]]
