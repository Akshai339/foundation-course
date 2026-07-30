---
tags: [product-design, course, week, phase/craft]
week: 7
phase: Craft Layer
---

# Week 07 — Interface Craft and the Grid Beneath

> **The week's thesis:** You can already make things look good. This week is about the specific ways that visual and brand craft *transfers badly* to product interfaces — and about converting your instincts into systems that other people can execute against.

**Studio:** [[03 The Studios|Studio B]] — screens from your flows on Day 6.
← [[Week 06 — Flows, Structure and Information Architecture]] · next → [[Week 08 — Design Systems and Component Thinking]]

> **Compression note:** this is the week to cut to 3 days if you're behind. Do Days 1, 5 and 6 — they're the ones that contain things you genuinely don't already know.

---

## Day 1 — The visual designer's trap: why product UI isn't a poster

### CONCEPT

This is the most important day of the week and it's about unlearning.

**Everything that makes a great poster makes a bad product screen.** Not "some things" — the core moves invert.

| Poster / brand craft | Product UI |
|---|---|
| One dominant focal point | Multiple simultaneous read paths for different intents |
| Generous, even whitespace = premium | Even whitespace destroys grouping; space must be *rhythmic and unequal* |
| Composition is fixed | Composition must survive arbitrary content, length and count |
| Content is chosen to fit the layout | Layout must accommodate content you'll never see |
| Read once, then discarded | Read a thousand times; every friction compounds |
| Impression is the goal | Prediction is the goal — the user must know what happens next |
| Novelty is a virtue | Novelty is a tax (Jakob's Law) |
| Beauty is the deliverable | Beauty is a *constraint satisfied*, not the objective |

**The five failure modes**, in the order they'll bite you:

**1. Designing for the hero case.** You lay out a card with a 22-character title, one tag, and a nice image. Real data has a 140-character title, no image, eleven tags, and one item where every field is null. **Design with your worst realistic data first, then check that it degrades gracefully to the pretty case.** Backwards from how you're trained, and it's the highest-value habit in this list.

**2. Optimising the first impression over the thousandth use.** Brand work is judged on first contact. Product is judged on repeat use, where the priorities are speed, predictability and low friction — none of which show up in a screenshot. The onboarding screen everyone praises is seen once. The list view nobody comments on is seen four hundred times. **Spend your effort inversely to how often a screen appears in a portfolio.**

**3. Treating density as a failure.** Dense is not the same as cluttered. Cluttered means *no structure*. Bloomberg terminals, Linear, Figma's own layers panel, an airline crew scheduling tool — these are extremely dense and extremely usable, because the density is structured. For expert users, **density is a feature**: more visible information means fewer navigations, less working-memory load, and faster comparison. The instinct to add air is often the instinct to make a screen photograph well at the cost of making it work.

**4. Using colour and weight decoratively.** In product UI, visual emphasis is a *claim about importance*, and you have a fixed budget (Week 2, Day 1). Every decorative accent spends budget the interface needed for meaning. Ask of every emphasised element: *what is this claiming, and is the claim true?*

**5. Making the artifact rather than the system.** A brand designer delivers a finished thing. A product designer delivers a thing *plus the rules by which more of it can be made* — usually by other people, without you. If your Figma file can't be extended by an engineer without asking you a question, it isn't done. This is the whole of Week 8.

**What genuinely transfers, and you should lean on it hard:**
- Hierarchy and contrast instincts — these are pure asset, they just need re-pointing at *meaning* rather than *impact*
- Typographic sensitivity — enormously valuable and rare among product designers
- Compositional balance under constraint
- Restraint, once you've relocated where to apply it

### SOURCE
Wathan & Schoger, *Refactoring UI* — read the sections on hierarchy and on "designing with real data." Fast read, and it's written by people who came at this from engineering, so the framing will be unfamiliar in a useful way.

### DRILL
Take your favourite piece of your own visual work and one dense product UI you admire (Linear, Figma, a good admin tool). Write **ten differences in the design decisions**, and for each one, the *reason* the difference exists. Then find one of your past UI pieces and identify which of the five failure modes it committed.

---

## Day 2 — Spacing systems and the 8pt grid as a language

### CONCEPT

You know how to space things. What's probably missing is that in product, **spacing must be a stated system, not a per-screen judgment** — because other people have to reproduce it, at scale, without you.

**Why a base unit** (usually 4 or 8): it makes spacing decisions finite and shareable. Instead of infinite choices you have a scale, and the scale is a *shared vocabulary* between you, the next designer, and the engineer. The specific number matters much less than the fact that there is one.

A typical scale: `4, 8, 12, 16, 24, 32, 48, 64, 96`. Note it's roughly geometric at the top — evenly spaced steps stop being distinguishable, and you need the big jumps to make grouping legible.

**The thing that actually matters, and it's a rule not a taste:**

> **Space *within* a group must be visibly smaller than space *between* groups.** Aim for at least 2× difference.

This is Gestalt proximity (Week 2, Day 2) expressed as a number. When a screen feels "flat" or "hard to parse," this rule is usually being violated — everything is 16px from everything, so nothing is grouped, so the user's eye has no structure to hold. Fixing spacing rhythm is frequently the highest-impact, lowest-effort change available to a screen.

**Vertical rhythm and the reality of it:** perfect baseline grids are largely a print inheritance and rarely survive real product constraints. What matters in product is *consistency of the gaps between component types* — the space above a section heading is always X, between list rows always Y. Consistency of relationship beats mathematical purity.

**Auto-layout as spatial reasoning.** In Figma, auto-layout is not a convenience feature — it's the mechanism by which your spacing becomes a *rule* rather than a *position*. A hand-positioned layout encodes nothing; an auto-layout with named spacing tokens encodes intent that survives content change and translates directly to what engineers build. If you're placing things by eye and nudging, you're producing a picture of an interface rather than a specification of one.

**Density scales.** Serious systems ship more than one. Carbon has multiple row heights; Material has density variants. The same component at comfortable / default / compact spacing serves different contexts — a marketing page and a data table have genuinely different needs. Deciding your density *stance* per surface is a real design decision, not a detail.

### SOURCE
[IBM Carbon — the 2x grid and spacing](https://carbondesignsystem.com/), and [Material 3's layout guidance](https://m3.material.io/). Read them as two different opinions about the same problem — the disagreement is more instructive than either alone.

### DRILL
Take one screen you've designed. Measure **every** space in it. List the unique values. If there are more than eight, you don't have a system. Rebuild it on a strict scale, and enforce the 2× within/between rule. Compare before and after — the difference will be larger than you expect.

---

## Day 3 — Typographic scale for interfaces, not for brand

### CONCEPT

Your typography is likely your strongest asset. The transfer problem is that **brand typography optimises for voice and impact; interface typography optimises for scanning, hierarchy and legibility at small sizes under fatigue.**

**Practical differences:**

**Fewer sizes.** Editorial work can carry a dozen. A product interface needs about 5–7 total: display, heading, subheading, body, secondary, caption, and maybe an overline. More than that and hierarchy stops reading as hierarchy — because the user can no longer tell two adjacent levels apart, which means they carry no information.

**Smaller steps.** Brand scales often use dramatic ratios (1.5, golden ratio). Interface scales are tighter — 1.125 to 1.25 — because you need many distinguishable levels inside a small range. Big ratios blow out the top of the scale and you can't fit a heading in a card.

**Weight does more work than size.** In dense UI, changing size disturbs layout; changing weight doesn't. `600 at 14px` vs `400 at 14px` is a clear hierarchy step that costs zero vertical space. Under-used by designers coming from print, where the size lever is cheap.

**Line length still matters, and it's the most-violated rule in product UI.** 45–75 characters. Wide dashboard columns routinely produce 150-character body text that is genuinely hard to read, and nobody flags it because it looks fine at a glance.

**Line height inverts.** Small text needs *more* relative line height (1.5–1.6), large display text needs *less* (1.1–1.2). Applying a single line-height ratio across a scale is a common and visible error.

**Numerals matter more than in brand work.** Tabular figures for anything in a column — prices, counts, dates, metrics. Proportional numerals in a table make comparison genuinely harder, and it's invisible until you look for it. Check whether your typeface has them before committing to it for a data-heavy product.

**Font choice, honestly:** in product, a highly characterful typeface is a liability at small sizes and in long sessions. This will fight your instincts. The right move is usually a workhorse UI face for the interface and to spend your typographic personality budget on marketing surfaces, headings, and empty states — where it's seen briefly and does brand work. That's not a compromise; it's correctly allocating a resource.

### SOURCE
*Refactoring UI*, typography chapters. Then compare the type scales published by [Material 3](https://m3.material.io/), [Polaris](https://polaris.shopify.com/) and [Carbon](https://carbondesignsystem.com/) — three different resolutions of the same constraints.

### DRILL
Build a **complete interface type scale** for Studio B: 5–7 sizes, each with weight, line-height and letter-spacing, each with a stated *use* ("card title," "table cell," "helper text"). The use statement is the deliverable — a scale without semantics is decoration. Then set the densest screen in your flow using only that scale.

---

## Day 4 — Colour as semantics: status, hierarchy, tokens

### CONCEPT

In brand work colour is expression. In product work **colour is primarily a carrier of meaning**, and meaning has to be consistent or it stops working.

**The four jobs colour does in an interface:**

1. **Status** — success, warning, error, info. Nearly universal, and the one place external consistency (Jakob's Law) genuinely outranks brand differentiation. Green-means-good is worth more to your user than your palette is.
2. **Hierarchy / emphasis** — primary vs secondary vs tertiary action. A *ranking*, and rankings break if there are two firsts.
3. **Categorisation** — labels, tags, chart series. Limited to ~5–7 distinguishable categories at a glance (Week 2, Day 1). Beyond that, colour has stopped encoding and started decorating.
4. **Brand presence** — the smallest job, and the one that most often eats the others' budget.

**The rule you can hold onto:** if a colour appears in the interface and doesn't do one of jobs 1–3, ask whether it should be there. Not "no brand colour" — but brand colour should be *deployed*, in specific places, rather than *distributed*.

**Never encode with colour alone.** ~8% of men have some form of colour vision deficiency, and colour-only encoding also fails in bright light, on bad screens, in dark mode, and in printouts. Pair colour with icon, text, position, or shape. This is a Week 10 accessibility requirement arriving early because it's cheaper to build in than to retrofit.

**Semantic tokens — the mental shift.** Move from `blue-500` to `action-primary`, from `red-600` to `status-danger`. Why it matters:

- **Dark mode becomes a remapping instead of a redesign.** `surface-raised` resolves to a light grey in one theme and a lighter-than-background dark grey in the other. Without semantic tokens, dark mode is a manual re-decision on every element and it always drifts.
- **Meaning stays consistent** because there's one place it's defined.
- **You can change the brand without touching a screen.**
- **It's the vocabulary engineers already use**, which makes handoff conversations shorter.

The layering that all serious systems converge on:

```
PRIMITIVE     blue-500, grey-100, red-600        (raw values, never used directly in designs)
    ↓
SEMANTIC      action-primary, surface-raised,    (meaning — this is what you design with)
              status-danger, text-secondary
    ↓
COMPONENT     button-primary-bg,                 (optional, for components needing overrides)
              input-border-focus
```

**Dark mode specifically**, since you'll be asked for it: it is not an inversion. Pure black backgrounds cause halation with light text and are genuinely uncomfortable — use a dark grey. Elevation inverts: in light mode raised surfaces get *shadows*, in dark mode they get *lighter*. Saturated colours vibrate against dark backgrounds and usually need desaturating. And contrast ratios must be re-verified, not assumed — a pair that passes in light mode frequently fails inverted.

### SOURCE
[Material 3's colour system](https://m3.material.io/styles/color/system/overview) — the most thoroughly worked-out public treatment of semantic colour, including tonal palettes and dynamic theming. Then [Adobe Spectrum](https://spectrum.adobe.com/) for a different and more restrained take.

### DRILL
Build the **semantic colour token set** for Studio B. Three layers as above. Requirements: every semantic token has a stated meaning; every status colour is paired with a non-colour signal; the whole set resolves in both light and dark. Then apply it to your densest screen and check contrast in both modes.

---

## Day 5 — Layout under pressure: real data, long strings, resizing

### CONCEPT

This is the day that separates a portfolio screen from a shippable one, and it's the one that would be genuinely new to you.

**Every layout must survive four kinds of pressure:**

**1. Content pressure.** The realistic worst case for every field:
- Longest plausible name, title, description. Then the *implausible* one — someone will paste an essay into your 30-character field.
- Empty and null. Not just an empty list — a present item with missing fields.
- Extreme counts: 0, 1, 2, and 10,000.
- Numbers at every magnitude: 0, 7, 1,247, 1,300,000. Does the column jump?
- **Other languages.** German compounds run ~30% longer than English; Arabic and Hebrew reverse the entire layout; CJK is denser but taller per line. Even if you're English-only today, designing to survive +30% string length is free insurance and takes ten minutes.

**2. Viewport pressure.** Not "mobile, tablet, desktop" — a continuous range, plus a resized browser window, plus a split-screen tablet, plus a 4K monitor where your max-width has to actually exist or your line lengths go to 200 characters.

**3. State pressure.** Every cell of your Week 6 matrix has to fit in the *same layout*. An error message appearing must not reflow everything below it into a different position — that's a Fitts disaster, because the user's target moves out from under a click already in flight.

**4. Time pressure.** Content arrives asynchronously. Does the layout jump as things load? Cumulative layout shift is a genuine usability failure, not just a web-vitals metric — it causes mis-clicks and it makes a product feel unstable in a way users describe as "cheap" without being able to say why.

**The techniques:**

- **Design the extremes first, then the middle.** Longest content and emptiest state before the hero case.
- **Reserve space for async content.** Skeleton at the final dimensions, not a spinner that collapses. Week 9 goes deeper.
- **Truncate deliberately, and decide where.** End-truncation loses file extensions; middle-truncation preserves both ends (`document_final…v3.pdf`). Decide per field, don't inherit a default.
- **Decide the wrap/truncate/scroll policy per field** and write it down. This is exactly the kind of rule that belongs in your system.
- **Constrain, don't just fill.** `max-width` on text containers is one line of intent that fixes a whole class of large-screen failure.
- **Test at 200% browser zoom.** It's a WCAG requirement and it finds layout assumptions nothing else does.

**The habit worth building:** keep a "torture test" data set for your project — the longest name, the null-heavy record, the 200-item list, the zero state, the 8-digit number. Paste it in before you call a screen done. It takes two minutes and catches most of what would otherwise reach QA.

### SOURCE
[Inclusive Components — Heydon Pickering](https://inclusive-components.design/) — every article treats content and viewport pressure as first-class, which is unusual and instructive. Also [Polaris](https://polaris.shopify.com/) on content guidelines for components.

### DRILL
Take your densest Studio B screen. Build a **torture-test version**: longest realistic strings everywhere, one null-heavy record, a 200-item list, an inline error, at 320px wide and at 2560px wide, at 200% zoom. Screenshot every failure. Fix them. This is the drill that most changes the quality of your output.

---

## Day 6 — Studio B: screens from your flows

### CONCEPT

Now you design. Note what you have that you didn't have in Week 1: a task analysis, a flow with branches, a state matrix, a type scale, a colour system, a spacing system, and real research behind all of it.

**The rule for today:** every screen must be traceable to a node in your flow diagram. Label them with the node numbers. If you find yourself designing a screen that isn't in the flow, **stop and go fix the flow** — either you found a real gap (good, update the diagram) or you're inventing (bad, delete it). This traceability is the discipline the entire studio was building toward.

**Order of work:**
1. The densest, most data-heavy screen first. It stress-tests every system decision.
2. The three empty states you built in Week 6.
3. The happy-path core flow.
4. One failure path, fully designed.

Do not start with the prettiest screen. You will over-invest in it and then bend the system around it.

### DRILL — Deliverable B5

**6–10 screens** covering the core Studio B flow. Requirements:

- [ ] Every screen labelled with its flow node number
- [ ] Every screen built with auto-layout and named tokens — no hand-positioned elements
- [ ] Spacing from your scale only; type from your scale only; colour from your semantic tokens only
- [ ] At least one screen shown in three states (default, empty, error)
- [ ] The torture-test version of your densest screen included
- [ ] Light and dark for at least the densest screen

Plus **one paragraph**: what did designing the screens reveal that the flow diagram missed? There will be something — capture it.

*Time check: this will overflow one session. Budget 3–4 hours across two days; it's the single biggest making-day of the course so far.*

> `/product-design-course critique B5` — ask me to check traceability and system compliance specifically, not aesthetics. You don't need help with aesthetics.

---

## Week 7 self-check

1. Which of the five failure modes from Day 1 is *my* habitual one?
2. How many unique spacing values did I have before I systematised? What does that number tell me?
3. What broke in the torture test that I'd have shipped?
4. Where did I default to visual craft instead of the harder thinking this week? *(This week that question is inverted — where did I hide in craft to avoid a structural decision?)*
