---
tags: [product-design, course, week, phase/product]
week: 6
phase: Product Layer
---

# Week 06 — Flows, Structure and Information Architecture

> **The week's thesis:** Screens are the *output* of product design, not the input. The input is a structure — a decomposed task, a flow with branches, an information architecture, a state matrix. Designers who start with screens end up with beautiful products that don't hold together. This is the week that fixes that permanently.

**Studio:** [[03 The Studios|Studio B]] — full flow and state map on Day 6.
← [[Week 05 — Research That Changes Decisions]] · next → [[Week 07 — Interface Craft and the Grid Beneath]]

---

## Day 1 — Task analysis: decomposing a goal into steps

### CONCEPT

Before you can design a flow you have to know what the flow *is*. Task analysis is the unglamorous decomposition that makes everything after it easy.

**Hierarchical task analysis**: take a goal, break it into sub-tasks, break those down again, until you reach steps that are atomic — a single decision or a single action.

```
GOAL: Get paid for a completed project
├─ 1. Confirm the work is accepted
│   ├─ 1.1 Send deliverables
│   ├─ 1.2 Confirm receipt
│   └─ 1.3 Handle revision requests        ← usually forgotten
├─ 2. Create the invoice
│   ├─ 2.1 Retrieve agreed rate            ← where does this live?
│   ├─ 2.2 Calculate total incl. tax
│   ├─ 2.3 Set payment terms
│   └─ 2.4 Generate document
├─ 3. Send it
└─ 4. Track and chase                      ← the actual pain, usually
    ├─ 4.1 Know whether it's been seen
    ├─ 4.2 Know whether it's overdue
    └─ 4.3 Chase without damaging the relationship   ← nobody designs this
```

**What the decomposition gives you that nothing else does:**

1. **It reveals the steps that happen outside your product.** Above, "retrieve agreed rate" probably means digging through email. That's a step in the user's task that your product doesn't touch — and it's often the best opportunity in the whole tree.
2. **It exposes forgotten branches.** Revision requests. Partial payment. The client who never responds. These are where products break, and they only surface when you decompose systematically instead of imagining the happy case.
3. **It separates the task from your solution.** The tree above is technology-neutral. It's true whether you build software or not. That neutrality is what lets you notice that step 4.3 — chasing without damaging the relationship — is a *social* problem your product could address with tone and timing rather than a feature.
4. **It shows you where the pain actually concentrates.** In this tree, everyone builds beautiful invoice generation (step 2) and nobody designs step 4. That mismatch between where effort goes and where pain lives is extremely common, and task analysis is how you see it.

**Annotate each step with:**
- **Frequency** — how often. High-frequency steps deserve Fitts-optimised, accelerator-supported design (Week 2, Week 3).
- **Difficulty** — where do people fail or hesitate?
- **Information required** — what must they know or have to hand? *This is your working-memory audit and it directly generates your screen content.*
- **Who else is involved** — steps with other humans in them have social costs you must design for.

**The judgment call:** how far down do you decompose? Stop when a step is a single decision or a single action with no meaningful internal structure. Going further produces noise; stopping early hides the problem. In practice you'll go too shallow the first few times — when a step still feels like it has a story inside it, break it down again.

### SOURCE
Rogers, Sharp & Preece, *Interaction Design*, chapter on establishing requirements. Or free: [MIT 6.831 Lecture on task analysis / user-centered design](https://ocw.mit.edu/courses/6-831-user-interface-design-and-implementation-spring-2011/).

### DRILL
Do a full hierarchical task analysis for your Studio B problem, using **only what your interviews told you** — not what you assume. Three levels deep minimum. Annotate every leaf with frequency, difficulty, information required, and other people involved. Circle the steps that happen *outside* any product. Those circles are your opportunity map.

---

## Day 2 — Flow diagrams: the artifact that makes you a product designer

### CONCEPT

If there is one artifact that marks the transition from UI designer to product designer, it's a good flow diagram. It's also the thing most portfolios are missing, and hiring managers notice.

**A flow diagram is not a sitemap and not a wireflow.** It's a directed graph of *states and transitions*: what state the user is in, what they can do, what happens, where they end up.

**The four node types you actually need:**

```
  ▭  State/screen      — where the user is
  ◇  Decision          — a branch, either user's or system's
  ▱  System action     — something happens without the user (API call, validation, model inference)
  ⏹  Terminal          — an end state, success OR failure
```

**What separates a good flow from a decorative one:**

**1. Every decision node has all its branches drawn.** If there's a diamond with one line out, it isn't a decision. This is where flows earn their keep — the branches are the design work everyone skips.

**2. Failure paths are drawn as prominently as the happy path.** Most flow diagrams are a single line with an arrow. Real flows fork constantly: validation failed, network failed, permission denied, the thing already exists, the session expired, the model refused.

**3. Entry points are all shown.** Users don't only arrive at the front door. Deep link from an email, a notification, a shared URL, back-button re-entry, a resumed session. Each entry point arrives with *different context available*, and a flow that assumes front-door entry breaks for everyone else. This is one of the most common real-world bugs in shipped products and it is almost always a missing-entry-point problem in the design.

**4. Exit points are shown, including abandonment.** Where do people leave? What state are they left in? Can they come back? "User closes the tab at step 3" is a real path and it needs a designed answer — usually: save the draft.

**5. It's annotated with the information required at each step** (from yesterday's task analysis). This is what turns a flow into a screen spec without you having to design screens yet.

**The discipline that makes this hard and worth it:** you must resist drawing screens. The temptation, for you especially, will be to render each node as a little wireframe. Don't. Boxes with labels. **The moment the flow contains visual design, you stop being able to see the structure**, and you start defending layouts instead of interrogating logic. Draw it ugly on purpose.

**Practical rules:**
- One flow per goal. If your diagram has forty nodes, it's probably two flows.
- Name every state as a *state*, not a screen name: "Payment method selected, unconfirmed" beats "Payment page."
- Number the nodes. You'll reference them constantly for the rest of the project.
- Draw it in FigJam, not Figma. The tool matters — a low-fidelity canvas keeps you low-fidelity.

### SOURCE
Jim Kalbach, *Mapping Experiences* — the definitive treatment of flows, journeys and blueprints and when each is appropriate. For a fast free version, study flows on [Page Flows](https://pageflows.com/) or [Mobbin](https://mobbin.com/) and reverse-engineer the diagram from a real product's screens.

### DRILL
Draw the complete flow diagram for the **core goal** in your Studio B task analysis. Requirements: every decision has all branches; at least three failure paths; at least two entry points; at least one abandonment path with a designed answer. Ugly boxes only — if you catch yourself styling it, stop.

---

## Day 3 — Information architecture, navigation and findability

### CONCEPT

IA is how information is organised, labelled and made findable. It's the least visible and most consequential layer of a product — get it wrong and no amount of visual polish recovers it, because the user's mental model is built on it.

**Three separable problems, and conflating them is the usual mistake:**

1. **Organisation** — how things are grouped and related
2. **Labelling** — what things are called
3. **Navigation** — how you move between them

**On organisation.** The available schemes:

| Scheme | Example | Good when |
|---|---|---|
| **Exact** (alphabetical, chronological, geographic) | Contact list | The user knows the exact item |
| **Topical** | Documentation by subject | Well-known, stable domain |
| **Task-based** | "Get paid", "Find work" | Users think in goals, not objects |
| **Audience-based** | "For teams" / "For individuals" | Genuinely distinct user groups |
| **Metaphor-based** | Desktop, trash, folders | Strong existing mental model available |

**Task-based organisation is underused and usually the right answer in product** (as opposed to content sites), because users arrive with intentions, not with a desire to browse your object model. The most common IA failure is organising the navigation around your *database schema* — Accounts, Entities, Records, Settings — which is perfectly logical and matches nobody's mental model.

**On labelling — the highest-leverage and cheapest work in IA.** Rules:
- **Use the user's words, from your interviews.** You have transcripts. Grep them. The words your users actually used are sitting right there and they beat anything a naming workshop produces.
- **Prefer concrete to abstract.** "Insights" tells nobody anything. "Weekly report" does.
- **Never invent a word when a category-standard one exists** (Jakob's Law). Your clever name costs every user a learning step, forever, and buys you nothing but a differentiation nobody asked for.
- **Test labels separately from design.** A first-click test — "where would you click to do X?" — takes fifteen minutes and finds label failures that survive months of design review.

**On navigation:** the practical constraint is that navigation must answer three questions at all times — *where am I, where can I go, how do I get back.* Depth vs breadth is a real trade (Hick's Law says broad-and-shallow is often better than the intuition suggests, because a wider menu is *scanned* rather than *decided*), but the bigger issue is usually that products bury the 20% of destinations that account for 80% of trips. Instrument what people actually navigate to, and promote it.

**Two methods worth knowing by name:**
- **Card sorting** — give users the content items, let them group and name the groups. *Open* sort (they name the groups) tells you their model; *closed* sort (you provide groups) tests yours. Half a day, transforms an IA.
- **Tree testing** — give users the structure without any visual design and ask them to find things. Isolates IA failure from visual failure, which is otherwise almost impossible to separate.

### SOURCE
Rosenfeld, Morville & Arango, *Information Architecture* (the "polar bear book") — the standard reference. Free: NN/g's IA articles, and [Shopify Polaris](https://polaris.shopify.com/) for how a serious team documents naming decisions.

### DRILL
Do an **open card sort** on your Studio B content — with a real person, ideally one of your interviewees, or with two colleagues. Write every content item / feature on a card, let them group and name. Then compare their structure to the one you'd have built. Where they differ, they're right and you're wrong, and finding out why is the exercise.

---

## Day 4 — The state matrix: every screen is really *n* screens

### CONCEPT

Week 3 introduced states. Today you build the artifact that makes them tractable — and this is the one that most impresses engineers, because it's the thing they always have to invent themselves.

**The matrix:** screens down one axis, state dimensions across the other. Fill every cell that matters.

| Screen | Empty | Loading | Partial | Error | Offline | Permission-limited | Success |
|---|---|---|---|---|---|---|---|
| Project list | ✎ | ✎ | — | ✎ | ✎ | ✎ | — |
| Project detail | — | ✎ | ✎ | ✎ | ✎ | ✎ | — |
| Upload | — | ✎ | ✎ | ✎ | ✎ | — | ✎ |
| Share | — | ✎ | — | ✎ | ✎ | ✎ | ✎ |

`✎` = needs designing. `—` = not applicable, **and you must be able to say why.**

**The states almost everyone forgets, in order of how often they're missed:**

1. **Empty — first-run.** The user has nothing yet. This is the single most important screen in your product for new users and it's usually a grey box saying "No items." An empty state should *teach the model and offer the first action*. It's the highest-leverage screen you will ever design and it's almost universally an afterthought.
2. **Empty — user-emptied.** Different from first-run! They had things, now they don't. "No items" is wrong here; "You've archived everything" is right. Same visual slot, opposite message.
3. **Empty — filtered to nothing.** Also different. The fix is "clear the filter," not "create your first item." Three different empty states, one slot, and most products ship one message for all three.
4. **Partial.** Some data loaded, some failed. Increasingly common and almost never designed.
5. **Too much.** 10,000 items. Does your beautiful card grid survive? Does anything paginate, virtualise, summarise?
6. **Stale.** Data loaded ten minutes ago. Do you say so? Do you refresh? Does the user know they're looking at the past?
7. **Permission-limited.** They can see it but not edit it. Hide the control, or show it disabled with a reason? (Show it disabled with a reason — hiding it makes the product feel broken and inconsistent across users.)
8. **Offline / degraded.** What still works? What's queued? What's lost?

**Why building this is worth a whole day:** every one of these cells is a decision that will get made by *someone*. If you don't make it, an engineer makes it at implementation time under deadline pressure, and it will be inconsistent with the eleven other cells that three different engineers decided. **The matrix isn't documentation — it's the mechanism by which the product stays coherent.** This is the single most concrete answer to "what does a product designer do that a UI designer doesn't."

**Practical advice:** don't design all cells to the same fidelity. Identify the ~8–12 cells that genuinely matter and design those properly; for the rest, write a one-line rule ("all list errors use the standard inline error with retry"). Rules cover the long tail better than screens do — and a stated rule is what a design system is made of, which is Week 8.

### SOURCE
[Shopify Polaris](https://polaris.shopify.com/) and [Material 3](https://m3.material.io/) both document empty, loading and error patterns well. Read how they *write* about when to use each — the usage guidance is the lesson, not the components.

### DRILL
Build the full state matrix for your Studio B flow. Every screen × every state dimension. Mark `✎` or `—`, and for every `—` write the one-line justification. Then design **the three empty states** (first-run, user-emptied, filtered-to-nothing) as actual screens. Just those three.

---

## Day 5 — Progressive disclosure and Tesler's Law

### CONCEPT

**Tesler's Law of Conservation of Complexity:** every system has an irreducible amount of complexity. It cannot be removed — only *moved*, between the system and the user.

This is one of the most clarifying ideas in the field because it kills a fantasy. "Simplify it" is not a coherent instruction. The real question is always: **who absorbs this complexity — the user, the designer, or the engineer?**

Examples of the trade being made explicitly:
- **Email addresses.** Someone must specify the recipient. Autocomplete moves that complexity from the user's memory into the system's index. The complexity didn't vanish; engineering ate it.
- **Time zones.** Someone must decide what "3pm" means. Either the user specifies, or the system infers and is sometimes wrong. There is no third option, and every calendar product is a different position on this trade.
- **AI features generally.** The complexity of the task moves to the model. But a *new* complexity appears — verification. Tesler's Law predicts this exactly: you didn't remove the work, you transformed it. Whether that's a win depends entirely on whether verifying is cheaper than doing, which is the question from Week 2 Day 3 arriving again from a different direction.

**The practical stance:** when someone says "make it simpler," respond with "for whom, and what should absorb it?" That single question will make you sound more senior than almost anything else you can say in a design review.

**Progressive disclosure** is the main technique for managing complexity *without* pretending it isn't there: show the common case, keep the rest available but not present.

The levels, from lightest to heaviest:
1. **Sensible defaults** — the most powerful and most underused. If 80% want a value, set it. Every field you can default is a decision the user doesn't make.
2. **Staged disclosure** — reveal on demand. "Advanced settings," "More options," accordion sections.
3. **Progressive reduction** — the interface simplifies as the user demonstrates competence. Powerful, rare, and easy to get wrong.
4. **Separate modes for separate users** — basic and advanced views. Heaviest, and it doubles your design and maintenance surface. Use last.

**Where progressive disclosure goes wrong**, and it's worth knowing because this is the failure people actually ship:
- **Hiding things users need frequently** — you've traded a small ongoing cost for everyone into a large repeated cost for the people who matter most (your power users, who are usually your revenue).
- **Hiding things users need to know exist** — discoverability collapses. Nobody opens "Advanced." A capability behind a disclosure that nobody opens is a capability that does not exist.
- **Using it as an excuse not to prioritise.** "We'll put it under More" is how a product accumulates forty features nobody uses. Disclosure is not a substitute for the decision about what belongs.

**The honest test:** if you removed the disclosed content entirely, would anyone notice? If no — delete it, don't hide it. If yes — who, how often, and is hiding it costing them more than showing it costs everyone else?

### SOURCE
[Laws of UX — Tesler's Law](https://lawsofux.com/teslers-law/), and NN/g's [Progressive Disclosure](https://www.nngroup.com/articles/progressive-disclosure/). John Maeda's *The Laws of Simplicity* if you want the philosophical version.

### DRILL
Take a complex interface you use (an editor's settings, a cloud console, an ad manager — your performance marketing background gives you good candidates). Identify **where the complexity has been placed** and who absorbs it. Then find one thing that's been hidden that shouldn't be, and one thing that's shown that should be defaulted away. Justify both.

---

## Day 6 — Studio B: full flow and state map

### CONCEPT

Assembly day. Everything from this week becomes the structural spec for Studio B — the thing you'll design screens from next week.

**A note on why this order matters, since it will feel like a delay.** You could design screens today. They'd look good. And they would encode a structure you hadn't examined, and you'd discover the structural problems in Week 9 when the screens are too polished to throw away. **The whole point of this week is that the structure is cheap to change and the screens are not.** Every hour here saves three later.

### DRILL — Deliverables B3 + B4

**B3 — Task analysis + flow diagram**
- Hierarchical task analysis, 3 levels minimum, annotated with frequency / difficulty / information required / other people involved
- Complete flow diagram for the core goal: all decision branches, ≥3 failure paths, ≥2 entry points, ≥1 abandonment path with a designed answer
- Numbered nodes
- Deliberately unstyled

**B4 — State matrix**
- All screens × all state dimensions
- Every `—` justified in one line
- The three empty states designed as real screens
- A short list of **stated rules** covering the long-tail cells ("all list errors use inline error + retry"). This list is the seed of your Week 8 design system.

Also: **one paragraph** on where Tesler's Law bites in your product — what irreducible complexity exists, and who you've decided absorbs it.

*Time check: TA ~30 min, flow ~45 min, matrix ~30 min, empty states ~30 min. This is a long day; split across two if needed.*

> `/product-design-course critique B3 B4` — I'll specifically hunt for missing branches and unjustified `—` cells. Those are where structural work hides.

---

## Week 6 self-check

1. What did the task analysis reveal that happens entirely outside any product?
2. Which branch did I forget in the first draft of my flow — and is forgetting that kind of branch a pattern for me?
3. Which state in the matrix would I definitely have shipped without designing?
4. Where did I default to visual craft instead of the harder thinking this week?

---

> **Phase 2 complete.** You can now take an ambiguous situation, find the real problem, verify it with humans, and produce a complete structural spec — before a single screen exists. That's the product designer's core loop. Phase 3 is where you get to use the hands you already have.
