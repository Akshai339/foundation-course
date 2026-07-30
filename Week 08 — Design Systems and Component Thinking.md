---
tags: [product-design, course, week, phase/craft]
week: 8
phase: Craft Layer
---

# Week 08 — Design Systems and Component Thinking

> **The week's thesis:** A design system is not a component library. It's a set of *decisions*, made once, that let a team produce coherent work without re-deciding. The components are the least interesting layer. This week you learn to think in APIs and rules rather than in artifacts.

**Studio:** [[03 The Studios|Studio B]] closes on Day 6.
← [[Week 07 — Interface Craft and the Grid Beneath]] · next → [[Week 09 — Motion, Latency and Time]]

---

## Day 1 — What a design system actually is: the three layers

### CONCEPT

Ask ten designers what a design system is and nine will describe a Figma file full of components. That's the smallest and most replaceable part.

**The three layers, from most to least durable:**

**Layer 1 — Principles and decisions.** The stated positions the product takes. *"We prefer undo to confirmation." "Destructive actions are never adjacent to frequent ones." "We use platform conventions over invention." "Density is comfortable by default, compact on data surfaces."*

This layer is invisible, has no Figma file, and is the layer that actually produces coherence. Two designers who share principles will produce compatible work even without shared components. Two designers who share components but not principles will produce incoherent work using identical buttons — which is exactly what most "design systems" achieve in practice.

**Layer 2 — Foundations.** The shared vocabulary: tokens for colour, type, space, radius, elevation, motion. Plus the grid and the density stance. This is Week 7's output, formalised. It's what makes things *feel* like one product even when the components differ.

**Layer 3 — Components and patterns.** Buttons, inputs, modals, tables. The visible layer, the one everyone means, and the most disposable — components get rebuilt constantly as frameworks change. **Patterns** (how components combine to solve a recurring problem — a form, an empty state, a destructive-action flow) sit here too and are more valuable than components, because a pattern encodes a *solution* while a component only encodes a *part*.

**Why the ordering matters practically:** teams build layer 3 first, skip layer 1 entirely, and then wonder why the system doesn't produce consistency. Without principles, every new situation is a fresh argument, and the components get forked. **The documentation of *when and why* is worth more than the components themselves** — which is exactly why Polaris is the best-regarded system on the internet: its components are ordinary and its usage guidance is exceptional.

**What a good system is actually for**, honestly stated:
- **Decision reduction** — so people spend judgment on the novel 20%, not the settled 80%
- **Coherence at scale** — many people, one product feel
- **Speed** — real, but a secondary benefit and the one most oversold
- **Quality floor** — accessibility, states and edge cases solved once, correctly

**What it is not for:** enforcing sameness, replacing design judgment, or being complete. A system that covers everything is a system nobody can hold in their head. **The best systems are deliberately incomplete** and have a clear, welcoming process for the cases they don't cover — because those cases are where the product is actually evolving.

### SOURCE
Read the *principles* pages of [Apple HIG](https://developer.apple.com/design/human-interface-guidelines/) and [Material 3](https://m3.material.io/) side by side. Notice how much of both is argument rather than specification. That's layer 1, and it's why those two documents have outlived a dozen component libraries.

### DRILL
Write **eight principles** for your Studio B product. Each must be (a) a decision, not a platitude, (b) something a reasonable person could disagree with, and (c) capable of resolving a real design argument. *"We value simplicity"* fails all three. *"We show disabled controls with a reason rather than hiding them, because inconsistent interfaces across permission levels feel broken"* passes all three.

---

## Day 2 — Tokens: the abstraction that makes design scale

### CONCEPT

Tokens are named design decisions. That's the whole idea, and it's more powerful than it sounds because naming a decision is what makes it *reusable, changeable, and arguable*.

**The three-tier architecture** every mature system converges on (Week 7 introduced it for colour — here it is generalised):

```
PRIMITIVE / GLOBAL     blue-500 · space-4 · radius-md · font-600 · duration-200
   (raw values, never referenced directly in a design)
        ↓
SEMANTIC / ALIAS       action-primary · space-inset-comfortable · surface-raised
   (meaning — this is the layer you design with)
        ↓
COMPONENT              button-primary-bg · card-padding · modal-radius
   (only when a component genuinely needs to diverge)
```

**Why three tiers and not one:** with one tier, changing your brand blue means finding every use. With three, you change one primitive. More importantly, the semantic tier is where *meaning* lives — and meaning is what survives redesigns. `action-primary` is still `action-primary` after a rebrand; `blue-500` is meaningless the moment the brand goes green.

**What should be tokenised**, roughly in order of value:
- Colour (highest value — themes, modes, brand)
- Spacing (highest value for consistency)
- Typography (size, weight, line-height, letter-spacing as bundles)
- Radius, border width, elevation/shadow
- **Motion — duration and easing.** Almost always forgotten, and it's where you have an unfair advantage. A system with `duration-fast: 150ms` and `easing-standard: cubic-bezier(0.2, 0, 0, 1)` is a system whose motion stays coherent. Week 9.
- Breakpoints, z-index layers, opacity levels

**Naming, which is genuinely the hard part.** Good token names are:
- **Semantic, not descriptive** — `text-secondary` not `grey-600`
- **Consistent in structure** — pick a pattern like `[category]-[role]-[variant]-[state]` and never deviate
- **Not over-specific** — `button-submit-bg` is too narrow; `action-primary-bg` covers the case and the next twenty
- **Modes, not names, carry theme** — you don't need `text-primary-dark`; you need `text-primary` that resolves differently per mode

**In Figma specifically:** variables with modes are the implementation. One set of semantic variables, multiple modes (light/dark, comfortable/compact, brand A/brand B), and every component references semantics only. If a component references a primitive directly, it will break in a mode — that's the rule to enforce and the thing to check for.

**The most common mistake:** tokenising too early and too much. A hundred tokens for a product with eight screens is overhead pretending to be rigour. Start with what you've used twice. Promote to a token on the third use. Systems grow from real repetition, not from anticipated repetition.

### SOURCE
[Adobe Spectrum's token documentation](https://spectrum.adobe.com/) and [Material 3's token system](https://m3.material.io/foundations/design-tokens/overview) — two rigorous, different naming philosophies. Read both and pick a side.

### DRILL
Formalise your Week 7 foundations as a **complete three-tier token set** in Figma variables, with light and dark modes. Include motion tokens (duration and easing) even though you haven't done Week 9 yet — you'll fill in the values next week. Then audit: does any component reference a primitive directly? Fix it.

---

## Day 3 — Component API thinking: props, variants, slots, composition

### CONCEPT

This is the day that most changes how you build, and the mental shift is: **stop thinking about what a component looks like, start thinking about what it accepts.**

A component is a *function*. It takes inputs and produces an interface. Designing a component means designing its **API** — the set of things a consumer can control — and the API is a much more consequential decision than the visual design.

**The four kinds of input:**

**1. Variants** — mutually exclusive appearance/behaviour modes. `type: primary | secondary | tertiary | destructive`. Keep these small and orthogonal.

**2. Properties** — independent toggles and values. `size`, `disabled`, `loading`, `icon-position`, `full-width`.

**3. Slots** — regions the consumer fills with arbitrary content. This is the most powerful and most underused idea in component design. A `Card` with a `header`, `body` and `actions` slot serves a hundred cases. A `Card` with a `title: string` and `description: string` serves one, and gets forked the first time someone needs a badge in the header.

**4. State** — what the component does in response to interaction: hover, focus, active, disabled, loading, error, selected, read-only. **A component isn't designed until all its states are.** Focus states specifically are forgotten in roughly 90% of design files and are a hard accessibility requirement (Week 10).

**The combinatorial trap.** 4 types × 3 sizes × 2 icon positions × 8 states = 192 combinations. You cannot draw 192 artboards, and you shouldn't try. Instead:
- Make properties **orthogonal** — each varies independently, so consumers compose rather than select from a list
- Draw the **matrix of type × state** and let size and icon be mechanical
- Explicitly document **which combinations are invalid** and why (`destructive` + `tertiary` might be forbidden because a destructive action must never be low-emphasis)

**Composition over configuration — the most important principle here.** When a component grows a tenth property, that's the signal that it should have been two components, or one component with slots.

> ✗ `Card(title, subtitle, image, badge, badgeColor, actionLabel, actionIcon, secondaryActionLabel, footerText, footerIcon…)`
> ✓ `Card` with `<CardHeader>`, `<CardMedia>`, `<CardBody>`, `<CardActions>` — consumers compose what they need

The first is a component that will be forked within a month. The second grows with the product.

**Why this matters even though you're not writing the code:** engineers build to APIs. If you deliver a component with a coherent API, the implementation matches your intent and stays matched. If you deliver 192 artboards, an engineer invents an API, and from then on the code and the design file diverge quietly and permanently. **Component API design is the single highest-leverage thing a designer can do to keep design and code in sync**, and very few designers do it.

**A test for your API:** hand a component to someone and ask them to build a case you didn't anticipate. If they can, the API is good. If they have to modify the component, it isn't.

### SOURCE
Study [Polaris](https://polaris.shopify.com/) or [Atlassian Design System](https://atlassian.design/) component pages — they document props and slots explicitly. Read a component's full documentation page (not just the visuals) and notice how much of it is about *when not to use it*.

### DRILL
Design **one component properly** — a Button or an Input. Deliver: the full variant/property/slot API written out as a table; the type × state matrix drawn; documented invalid combinations; a usage doc with "use when" and "don't use when." Then hand it to someone (or me) and ask them to build a case you didn't design for.

---

## Day 4 — Reading the great systems

### CONCEPT

Today is deliberately a reading day. The four major public systems are the best-documented design thinking freely available anywhere, and each has a distinct philosophy worth absorbing.

**[Material Design 3](https://m3.material.io/)** — the most *complete*. Token architecture, dynamic colour, adaptive layout, and by far the best public writing on motion. Its weakness is that it's the design system of a platform that must serve everyone, so it's generic by necessity. **Read it for:** token architecture, motion, adaptive layout.

**[Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)** — the most *philosophical*. Less "here's a component," more "here's what we believe and why." The prose is the product. Notably opinionated about clarity, deference and depth. **Read it for:** how to write principles, and platform-native thinking. Its weakness: prescriptive in ways that don't transfer off-platform.

**[Shopify Polaris](https://polaris.shopify.com/)** — the best *content and usage guidance* in the industry. Every component has extensive "use when / don't use when," and the content guidelines (how to write labels, errors, empty states) are exceptional and rare. **Read it for:** usage documentation, content design, and how to make a system teach rather than just supply.

**[IBM Carbon](https://carbondesignsystem.com/)** — the best for *density and enterprise*. The 2x grid, multiple density scales, excellent [motion guidance](https://carbondesignsystem.com/elements/motion/overview/) with a productive/expressive split, and best-in-class data visualisation guidance. **Read it for:** high-density UI, data tables, charts, and motion tokens.

**How to read a design system** — not front to back. Take one problem you actually have and read all four on it:

- How does each handle **empty states**?
- How does each handle **destructive actions**?
- How does each define **elevation**?
- What does each say about **when not to use a modal**?

Reading comparatively is what makes this valuable. The places where four competent teams disagree are the places where there's a genuine design decision, and seeing four resolutions of it teaches you the shape of the tradeoff far faster than any one system's answer.

**What to notice:**
- How much of each system is *prohibition* rather than provision
- How they handle the components they *don't* have
- How they document contribution and change
- Where they contradict each other, and what each is optimising for

### SOURCE
The four systems above. Also worth 20 minutes: [GitLab Pajamas](https://design.gitlab.com/), which is radically transparent — you can watch the governance and decision-making happen in public, which no other major system exposes.

### DRILL
Pick **one problem** — I'd suggest destructive actions, since it touches error, confirmation, undo and hierarchy all at once. Read what all four systems say about it. Write a **one-page comparison**: where they agree, where they diverge, what each is optimising for, and what *you* would do and why. This is a genuinely good portfolio artifact on its own.

---

## Day 5 — Governance, contribution and the politics of a system

### CONCEPT

Design systems fail for social reasons far more often than technical ones. This is the day nobody teaches and everybody needs.

**The three governance models:**

| Model | How it works | Fails by |
|---|---|---|
| **Centralised** | A dedicated team owns and builds everything | Becoming a bottleneck; drifting from real product needs |
| **Federated** | Product designers contribute; a small group curates | Inconsistency if curation is weak; contribution never happening if it's slow |
| **Hybrid** | Small core team owns foundations; contribution for components | The common answer, and it needs the core team to genuinely say no sometimes |

**Why systems die**, in rough order of frequency:

1. **Contribution is harder than forking.** If adding to the system takes three weeks and copy-pasting a component takes twenty minutes, everyone forks, and within a year there are nine buttons. **The contribution path must be genuinely faster than the workaround** or the system is decorative.
2. **It doesn't cover what people actually need.** A system built from imagined needs rather than observed repetition. Nobody uses it, everyone builds around it.
3. **No owner.** It was a project, not a product. It rots.
4. **It says yes to everything.** Every request becomes a variant. Within two years it's a pile, not a system.
5. **Design and code diverge.** The Figma library and the component library drift, and now nobody trusts either. Usually a symptom of not designing to an API (Day 3).

**What actually works:**

- **Version and changelog it like software.** People need to know what changed and whether it breaks them.
- **Make deprecation explicit and gradual.** Mark, announce, provide the migration, then remove. Silent removal destroys trust once and permanently.
- **Have a real intake process**, with a stated response time. Slow-but-predictable beats fast-but-random.
- **Say no with a reason and an alternative.** "No, because this is a one-off; here's how to build it locally without forking" is a good no.
- **Measure adoption, not component count.** The number of components is a vanity metric. The percentage of shipped UI using system components is the real one.

**Your role, realistically.** As a product designer you're usually a *consumer and contributor*, not an owner. The behaviours that matter:

- **Use the system, and when you deviate, document why.** The documented deviation is how systems learn. An undocumented one is just drift.
- **Contribute upward when you build something twice.** Twice is the threshold.
- **Push back when the system is wrong** — but with evidence, not preference.
- **Never fork silently.** This is the single behaviour that kills systems, and it's always locally rational, which is why it needs to be a stated norm rather than a hope.

**The framing that makes this land in a meeting:** a design system is *infrastructure*. It has maintenance costs, it needs an owner, it depreciates, and it should be judged on adoption and on how much it accelerates the work — not on how complete it looks.

### SOURCE
[GitLab Pajamas](https://design.gitlab.com/) for public governance in action. Also Nathan Curtis's writing on design system operations (Medium, "EightShapes") — the most practically useful body of work on this subject.

### DRILL
Write the **governance section** for your Studio B mini-system, one page: who owns it, how someone contributes, what the intake and response commitment is, how deviation is documented, how deprecation works, and what you'd measure. Even for a solo project, writing this clarifies what the system is *for*.

---

## Day 6 — Studio B close: build the mini-system

### CONCEPT

Assemble everything into a small, coherent, documented system — and keep it small on purpose.

**The size rule: 5–8 components.** Not more. A small system you can fully justify demonstrates more judgment than a large one you assembled by copying. In a portfolio, forty generic components reads as "downloaded a UI kit"; eight components each with a documented rationale reads as "understands systems."

Choose components by **what your Studio B screens actually used twice or more**. That's the whole selection criterion. Anything you used once is not yet a system component.

### DRILL — Deliverable B6

**The mini design system.** Deliver:

1. **Principles** — the eight from Day 1, refined
2. **Tokens** — full three-tier set, light + dark modes, including motion placeholders
3. **5–8 components**, each with:
   - [ ] A written API (variants, properties, slots) as a table
   - [ ] All interaction states including focus
   - [ ] "Use when / don't use when" guidance
   - [ ] At least one documented invalid combination
4. **2–3 patterns** — how components combine for a recurring problem (a form, an empty state, a destructive action)
5. **Governance page** — the one-pager from Day 5
6. **The comparison piece** from Day 4

Plus one paragraph: **which of your Week 7 screens had to change** once the system existed, and what that tells you.

*Time check: assembly ~2 hrs. Much of this exists already — today is formalisation and documentation, not new design.*

> `/product-design-course critique B6` — ask me to test your component APIs by proposing cases you didn't design for. That's the real test of a system.

---

## Week 8 self-check

1. Which of my eight principles could a smart person genuinely disagree with? *(If none — they're platitudes, rewrite them.)*
2. Where did I over-tokenise or over-component out of a desire for completeness?
3. What did comparing four systems on one problem teach me that reading one couldn't?
4. Where did I default to visual craft instead of the harder thinking this week?
