---
tags: [product-design, course, week, phase/professional]
week: 11
phase: Professional Layer
---

# Week 11 — Designing AI Products

> **The week's thesis:** Every design principle you've learned assumed a deterministic system — same input, same output, knowable rules. A model breaks that assumption, and the break propagates through every layer: the conceptual model, the feedback loop, the error state, the trust relationship. This is the week that makes you specifically valuable where you work.

**Studio:** [[03 The Studios|Studio C]] — the AI interaction design on Day 6.
← [[Week 10 — Accessibility and the Unhappy Path]] · next → [[Week 12 — Measurement, Critique and Shipping]]

---

## Day 1 — What changes when the system is probabilistic

### CONCEPT

Five things break. Understanding exactly *which* five is what lets you design deliberately instead of copying whatever ChatGPT did last month.

**1. The conceptual model has no correct version.**
Week 1: your job is to give the user a simplified, predictive model of the system. But a language model's actual behaviour is not summarisable in a way that predicts reliably. Every available metaphor is wrong in a load-bearing way:

- *"It's a person who knows things"* → predicts wrongly about hallucination, memory, and consistency
- *"It's a search engine"* → predicts wrongly about synthesis and about sourcing
- *"It's a tool"* → predicts wrongly about variability; a hammer does the same thing twice

The design consequence: **you cannot fix this with a metaphor, so you must fix it with behaviour.** The interface has to *demonstrate* the model's limits repeatedly, in context, at the moment they're relevant. Showing sources teaches "it can be wrong about facts." Showing a confidence signal teaches "it has degrees of certainty." Letting the user regenerate teaches "it's non-deterministic." Each of these is a small lesson, delivered at the right moment, that accumulates into an accurate mental model. That accumulation *is* the design work.

**2. The Gulf of Evaluation becomes enormous.**
Norman's stage 6 — interpret what happened — normally takes milliseconds. With a model, evaluating the output can be *harder than producing it manually*. This is the central design problem of the field, and it's why "make the output prettier" is almost never the highest-value work. **Reducing verification cost is.**

Verification cost drops when you: show provenance (where did this come from), show the reasoning or the intermediate steps, structure the output so it can be scanned rather than read, highlight what's uncertain, and make it cheap to check one claim rather than all of them.

**3. Errors are graded, not binary.**
Conventional software works or fails. A model produces output on a spectrum from perfect to plausible-nonsense, and the *user* has to place it on that spectrum. Your error design (Week 10) has to handle "70% right" — a state with no established design language. Most products have a success state and an error state and nothing in between, which is precisely wrong for the actual distribution of outcomes.

**4. Consistency — heuristic 4 — partially breaks.**
Same input, different output. This violates the predictability users rely on. Sometimes it's a feature (creative variation); usually it's a cost. Design decisions follow: do you offer regeneration (embracing variance) or caching (hiding it)? Do you show that variance exists, or conceal it? Concealing it is tempting and it produces a worse mental model.

**5. The failure surface is unbounded.**
You can enumerate the ways a form can fail. You cannot enumerate the ways a model can be wrong. This means design must shift from *handling known errors* to **building general-purpose recovery**: undo, edit, steer, constrain, escalate to a human. A good AI interface assumes it will be wrong in ways nobody predicted and makes that survivable.

**The synthesis, and it's the most useful sentence of the week:**

> **In deterministic software, you design the happy path and handle exceptions. In AI software, you design the recovery path and handle the happy case as a special instance of it.**

### SOURCE
[Google PAIR — People + AI Guidebook](https://pair.withgoogle.com/guidebook-v2/), the chapters on **Mental Models** and **Errors + Graceful Failure**. The best free writing on this.

### DRILL
Take an AI feature you use daily. Write out: (a) the conceptual model it gives you, in three sentences, (b) two things that model predicts *wrongly*, (c) what the interface does to correct those wrong predictions, and (d) what it could do. Section (d) is candidate work for Studio C.

---

## Day 2 — Microsoft's 18 Human-AI guidelines

### CONCEPT

Amershi et al. (CHI 2019) synthesised twenty years of scattered guidance into 18 validated guidelines, organised by *when in the interaction* they apply. This is the closest thing the field has to a standard, and being able to reference it by structure is genuinely useful in a product review.

**INITIALLY — before and at first contact**
1. **Make clear what the system can do.**
2. **Make clear how well the system can do what it can do.** — Set expectations about accuracy *up front*. The most-violated guideline in the industry, because overselling capability is commercially tempting and produces exactly the trust collapse it was trying to avoid.

**DURING INTERACTION**
3. **Time services based on context.** — Act when the user's task and attention allow it.
4. **Show contextually relevant information.**
5. **Match relevant social norms.**
6. **Mitigate social biases.**

**WHEN WRONG**
7. **Support efficient invocation.** — Easy to call when wanted.
8. **Support efficient dismissal.** — Easy to reject or ignore. *Frequently missing, and its absence makes a feature feel imposed.*
9. **Support efficient correction.** — Easy to edit or refine rather than start over. **The single highest-value guideline for most products.**
10. **Scope services when in doubt.** — When uncertain, do less. Disambiguate, or degrade gracefully.
11. **Make clear why the system did what it did.** — Explanation, provenance, reasoning.

**OVER TIME**
12. **Remember recent interactions.**
13. **Learn from user behaviour.**
14. **Update and adapt cautiously.** — Don't disrupt an established model with sudden change.
15. **Encourage granular feedback.**
16. **Convey the consequences of user actions.** — Does correcting this teach the system?
17. **Provide global controls.** — Let users turn it off, adjust it, opt out.
18. **Notify users about changes.**

**How to actually use them:** not as a checklist to pass, but as an **audit grid**. Map your feature against all 18 and mark each: *implemented / deliberately skipped / gap*. The "deliberately skipped" column is the valuable one — it's where you demonstrate judgment rather than compliance.

**The four that are most commonly missing, and where you can add most value:**

- **#2 (make clear how well)** — because saying "this is right about 80% of the time" feels like admitting weakness. It isn't; it's the foundation of calibrated trust, and products that do it get *more* trust over time, not less.
- **#8 (efficient dismissal)** — AI features that can't be easily ignored are experienced as intrusive regardless of quality.
- **#9 (efficient correction)** — most products offer accept-or-regenerate. Regenerating throws away a 90%-correct output and rolls the dice. **Editing beats regenerating**, almost always, and it's the design move that most improves an AI feature.
- **#11 (make clear why)** — even shallow explanation ("based on your last three projects") substantially improves both trust and the user's mental model.

### SOURCE
★ [Microsoft HAX Toolkit — Guidelines for Human-AI Interaction](https://www.microsoft.com/en-us/haxtoolkit/ai-guidelines/) for the canonical wording, and the [design pattern library](https://www.microsoft.com/en-us/haxtoolkit/design-patterns/) for concrete implementations of each. The underlying paper is Amershi et al., CHI 2019.

### DRILL
Audit an AI product you use against all 18. Mark each implemented / skipped / gap. Then pick the three biggest gaps and sketch what closing them would look like. Keep this — it's the format for Deliverable C4.

---

## Day 3 — Trust calibration: confidence, explanation, graceful wrongness

### CONCEPT

The goal is **not** maximum trust. It's **calibrated** trust — the user's confidence should track the system's actual reliability.

Two failure modes, and the second is the one people forget:

- **Under-trust** — the user doesn't use a capable feature, or checks everything manually. The feature is net-negative on effort.
- **Over-trust** — the user accepts output they should have checked. **This is the more dangerous failure**, and design frequently causes it, because polish reads as competence. A fluent, well-typeset, confidently-worded wrong answer is more dangerous than a hesitant one, and *your visual craft actively contributes to the problem*. Sit with that: the better you make it look, the more you have to work to keep trust calibrated.

**How to express confidence, from weakest to strongest:**

| Method | Notes |
|---|---|
| **Numeric probability** ("87% confident") | Precise, mostly useless — people are bad at probabilities and false precision reads as certainty |
| **Categorical** ("high / medium / low confidence") | Better. Coarse enough to be honest. |
| **Hedged language** ("this looks like…", "I think…") | Natural, and it works — but it's easy to overdo into uselessness |
| **Visual encoding** (colour, weight, a marker on uncertain spans) | Strong when it marks *which parts* are uncertain rather than the whole output |
| **Showing alternatives** | Very strong — "here are three options" communicates non-determinism structurally |
| **Showing sources** | Strongest for factual output. Converts "trust me" into "check this." |
| **Showing the work** | Strong for multi-step reasoning. Lets the user verify the *process* when they can't verify the *answer*. |

The pattern: **the best confidence signals are the ones that give the user something to *do*.** A percentage is information; a source is an action. Design toward actionable signals.

**Explanation — three kinds, and they answer different questions:**
- **Provenance** — where did this come from? (citations, source documents, "based on your calendar")
- **Process** — how was it derived? (steps, reasoning, what was searched)
- **Rationale** — why this rather than something else? (what factors, what weighting)

Provenance is usually the cheapest and highest-value. Start there.

**Designing graceful wrongness — the core skill.** When the system is wrong, the user should be able to:
1. **Notice** — the wrongness must be detectable. If not, everything else fails.
2. **Understand** — what kind of wrong is this? Wrong facts, wrong intent, or wrong scope?
3. **Correct efficiently** — edit the specific part, not regenerate everything
4. **Prevent recurrence** — constrain, instruct, or teach it
5. **Escape** — do it manually, with no penalty and no loss of what they'd built

Point 5 is the one products skip. **An AI feature with no manual fallback is a trap**, and users learn to avoid features that trap them.

**A design stance worth adopting**, which will occasionally put you in tension with a product manager: *the interface should be as confident as the system deserves, and no more.* When you're asked to make the output "feel more authoritative," that's a request to miscalibrate trust. The honest counter is that calibrated systems accrue trust over time and overconfident ones lose it in a single incident — which is a business argument, not just an ethical one, and it's the one that lands.

### SOURCE
[Google PAIR Guidebook](https://pair.withgoogle.com/guidebook-v2/) — the **Explainability + Trust** chapter. Then HAX guidelines #2, #10, #11.

### DRILL
Take one AI output from a product you use. Design **three different confidence expressions** for it — one categorical, one visual/inline, one provenance-based. Then honestly assess: which one would make you check the output when you should? That's the one that works.

---

## Day 4 — The interaction primitives of AI products

### CONCEPT

The pattern language is being invented right now. Here's the current state — worth knowing as a vocabulary, and worth knowing which ones are underused.

**Input primitives**
- **Open prompt** — maximum expressiveness, maximum blank-page problem. Almost always needs scaffolding: examples, suggested prompts, templates.
- **Structured prompt** — fields, dropdowns, and constrained inputs that compose into a prompt. Far better discoverability, and it teaches the capability surface (HAX #1) implicitly. **Underused.**
- **Selection-based** — act on what's selected. Lowest friction, highest context, no blank page. **The most underused primitive in the field.** "Explain this" on a highlighted paragraph beats a chat box asking about the same paragraph, every time.
- **Ambient / proactive** — the system offers unprompted. Highest value when right, highest annoyance when wrong. Requires HAX #3 (timing) and #8 (dismissal) to be excellent.

**Output primitives**
- **Streaming** — start before complete (Week 9, Day 5). Remember: only valuable if it starts *sooner*, not because motion is nice.
- **Structured output** — tables, lists, sections rather than prose. Dramatically reduces verification cost, because structure allows scanning. **The single easiest win available in most AI products.**
- **Inline / in-place** — output appears where the work is, not in a separate panel. Reduces context-switching and keeps the user's spatial model intact.
- **Multiple candidates** — shows non-determinism honestly, lets the user select rather than judge. Costs screen space; buys a much better mental model.
- **Cited / grounded** — claims linked to sources.
- **Diff / preview** — show the *change* rather than the result. Enormously better for edits, because the user verifies a delta rather than re-reading everything. **Badly underused.**

**Control primitives** — where most products are weakest:
- **Stop** — interrupt generation. Converts waiting into a choice. Essential.
- **Regenerate** — retry. Cheap to build, throws away partial value.
- **Edit output** — modify directly. **Better than regenerate almost always**, and much rarer.
- **Steer** — "shorter," "more formal," "focus on X." Cheaper than re-prompting from scratch.
- **Constrain** — set boundaries in advance (format, length, sources, tone). Prevention over correction, which is Week 2's error hierarchy applied here.
- **Undo** — revert an applied result. Non-negotiable for anything that modifies the user's work.
- **Escalate / fall back** — do it manually, or get a human. The escape hatch.

**The four-question checklist for any AI feature:**

1. **Does the user know what it can do?** (HAX #1) → capability communication
2. **Do they know how well?** (HAX #2) → calibration
3. **Can they tell when it's wrong?** → verification cost
4. **Can they fix it without starting over?** (HAX #9) → correction

Most AI features fail 2, 3 and 4. Getting those three right is a differentiated product, not because it's clever but because so few teams do it.

**Where your motion background pays off, concretely:** almost every primitive above is *temporal*. Streaming, progressive structure, diff reveal, steering that transforms existing output rather than replacing it — these are all choreography problems (Week 9, Day 3). A diff that animates from old to new teaches the change; a diff that cuts requires the user to compare manually. Most teams building these have no time-based craft and produce jump-cuts. That's your opening.

### SOURCE
[Microsoft HAX design patterns library](https://www.microsoft.com/en-us/haxtoolkit/design-patterns/) — organised by guideline and interaction stage. Then examine four AI products closely and catalogue which primitives each uses.

### DRILL
Build a **primitive audit** of four AI products: which input, output and control primitives does each use? Which are missing? Then, for your Studio C feature, choose your primitives explicitly and justify each. Pay particular attention to whether you can use selection-based input and diff-based output instead of the default chat-and-prose.

---

## Day 5 — Evaluation and feedback loops as UX surface

### CONCEPT

In conventional software, feedback collection is a product-management activity. In AI products it's **an interface surface with direct functional consequence**, because feedback is how the system improves and how the user exerts control.

**The three purposes feedback serves** — and conflating them produces bad design:
1. **Improving the model** (aggregate, over time, invisible to the user)
2. **Correcting this instance** (immediate, personal, visible)
3. **Teaching the system about this user** (personal, cumulative)

Thumbs up/down conflates all three and delivers poorly on all of them. The user doesn't know which they're doing, sees no consequence, and stops bothering. **HAX #16 — convey the consequences of user actions — is the fix**: tell the user what their feedback did.

**Granular feedback (HAX #15) beats binary.** "This part is wrong" is far more useful than "this is bad" — to you, and to the user, who gets to be specific rather than merely dissatisfied. Design for:
- **Span-level marking** — this sentence, this cell, this region
- **Category** — wrong fact / wrong tone / wrong format / missed the point / unsafe
- **Correction as feedback** — the user's edit *is* the signal. This is the highest-quality feedback available and it's free. If a user edits your output, capture the diff.

**The reciprocity problem, which is the real reason feedback systems die:** users give feedback when they believe it does something. If nothing visibly changes, they stop within a few uses. Options, in ascending order of effectiveness:
- Acknowledge it ("Thanks — noted")
- Apply it immediately in-session ("I'll keep responses shorter")
- Show accumulated preferences somewhere the user can see and edit them
- Show change over time ("You've corrected date formats 4 times — always use DD/MM?")

The third is underrated: **a visible, editable memory of what the system has learned about you** satisfies HAX #12, #13, #16 and #17 simultaneously, and turns an invisible adaptive system into a legible one.

**Evaluation as a design concern.** Model quality is usually treated as an engineering metric, but the *user-facing* question is different: not "is the model accurate" but **"can the user achieve their goal, including the cost of verification and correction?"** These come apart constantly. A more accurate model with worse correction affordances can produce a worse product. This is a genuinely useful argument to be able to make, because it puts design work on the same footing as model work in a roadmap conversation.

Metrics that capture the design layer rather than the model layer:
- **Acceptance rate** — how often is output used as-is?
- **Edit distance** — how much do users change it? (Small edits = good; total rewrites = bad even if "accepted")
- **Correction depth** — how many rounds to get to acceptable?
- **Abandonment** — how often do they give up and do it manually?
- **Time to acceptable output** vs time to do it manually — the honest bottom line

That last one is the verification-cost test from Week 9, expressed as something you can instrument. Week 12 turns these into a HEART table.

### SOURCE
[PAIR Guidebook — Feedback + Control](https://pair.withgoogle.com/guidebook-v2/), and HAX guidelines #12–#18.

### DRILL
Design the **feedback and control surface** for your Studio C feature: granular feedback mechanism, what the user sees as consequence, where accumulated learning is visible and editable, and the global controls (HAX #17). Then define your five design-layer metrics.

---

## Day 6 — Studio C: design the AI interaction

### DRILL — Deliverable C4

The core design of your AI feature, mapped against the standard.

**Deliver:**

1. **The interaction design** — screens and flows for the complete AI interaction:
   - [ ] Capability communication (what it can do, how well) — HAX #1, #2
   - [ ] Input primitive, chosen and justified
   - [ ] The latency and streaming experience (from C2)
   - [ ] Output primitive, chosen and justified — with a strong bias toward structured and diff-based over prose
   - [ ] Confidence expression — actionable, not just informational
   - [ ] Explanation / provenance
   - [ ] All control primitives: stop, edit, steer, constrain, undo, fall back
   - [ ] The feedback surface and its visible consequence

2. **The wrongness design** — the most important part:
   - [ ] The confidently-wrong screen (from C3), now with full recovery
   - [ ] The subtly-wrong case — how does the user notice?
   - [ ] The refusal case
   - [ ] The manual escape hatch

3. **The HAX audit** — all 18 guidelines, each marked *implemented / deliberately skipped / gap*, with a one-line justification for every skip. **The skips are where your judgment shows.**

4. **The verification-cost statement** — revisited from C1, now with evidence from the design. Is this feature net-positive on user effort, and how would you know?

*Time check: ~2.5 hrs. Split across two days if needed.*

> `/product-design-course critique C4` — ask me to attack it as a skeptical user who has just been burned by a confidently wrong output. That's the review that matters.

---

## Week 11 self-check

1. What conceptual model does my feature give, and what does it predict wrongly?
2. Where did I make something look more confident than it deserves?
3. Which control primitives did I skip, and was that a decision or an omission?
4. Where did I default to visual craft instead of the harder thinking this week?
