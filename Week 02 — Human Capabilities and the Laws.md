---
tags: [product-design, course, week, phase/foundations]
week: 2
phase: Foundations
---

# Week 02 — Human Capabilities and the Laws

> **The week's thesis:** The human is a known machine with published specifications. Perception, memory, attention and motor control have measurable limits, and most interface failures are attempts to exceed them. Learn the specs and you stop guessing.

**Studio:** [[03 The Studios|Studio A]] — cognitive audit on Day 6.
← [[Week 01 — The Discipline and the Machine in the Head]] · next → [[Week 03 — Interaction, State and Evaluation]]

---

## Day 1 — Perception: what the eye does before you think

### CONCEPT

You already have excellent visual instincts. This week converts them into **stated rules you can defend in a meeting.** That conversion is worth more than it sounds — the difference between "I think this should be bigger" and "this is the primary action and it's currently losing the pre-attentive competition to a decorative element" is the difference between being overruled and not.

**Pre-attentive processing** is the set of visual judgments your brain makes in under ~250ms, before conscious attention arrives. It's parallel, effortless, and enormously fast. A small number of visual properties are processed this way:

| Pre-attentive channel | Strength | Notes |
|---|---|---|
| **Colour (hue)** | Very strong | But only ~5–7 distinguishable categories at a glance |
| **Size / length** | Very strong | The most accurate quantitative channel |
| **Position** | Very strong | Strongest of all for comparison |
| **Orientation** | Strong | |
| **Motion / flicker** | Overwhelming | Wins against everything. Use with extreme care. |
| **Enclosure** | Strong | A box around things groups them instantly |
| **Shape** | Weak | Slower, needs attention |
| **Texture / area** | Weak | Poor for quantity |

**The design consequence:** anything encoded in a pre-attentive channel is found *without search*. Anything not encoded pre-attentively requires serial scanning — the user reads through items one by one. The difference is roughly an order of magnitude in time.

So: **the number of things competing pre-attentively on a screen is a budget, and it's small.** If your primary CTA, your notification badge, your promotional banner and your brand accent are all saturated red, you have spent your entire attention budget on a four-way tie, and the user resolves it by ignoring all of them. This is the mechanism behind banner blindness and behind "nobody clicks our main button."

**Von Restorff / the isolation effect** is the flip side: the item that differs is remembered. One divergent element in a uniform field is unmissable. Two is a comparison. Five is noise. Your motion background makes this intuitive — you already know one moving thing in a still frame owns the shot. Same physics, static.

**The rule to take away:** decide *explicitly*, per screen, what wins pre-attentively. Write it down. Then check that nothing else is competing. Most "cluttered" screens don't have too many elements — they have too many *emphasised* elements.

### SOURCE
[MIT 6.831 Lecture 4 — Human Capabilities](https://ocw.mit.edu/courses/6-831-user-interface-design-and-implementation-spring-2011/) (notes PDF). Also Jeff Johnson, *Designing with the Mind in Mind*, ch. 1–4.

### DRILL
Take three screens from products you use. For each: squint or blur it heavily, then write down what you can still perceive. That's what's winning pre-attentively. Compare against what *should* win. Then do it to your own most recent piece of UI work.

---

## Day 2 — Gestalt: grouping is a decision, not an accident

### CONCEPT

The Gestalt principles are a hundred years old, endlessly repeated, and almost universally applied at the wrong altitude. Designers use them to make things look tidy. Their actual power is **structural**: they determine what the user believes belongs to what, and that belief is the interface's information architecture as experienced.

The ones that carry the most weight in product UI, in order of strength:

1. **Proximity** — near things are one thing. This is the *strongest* grouping force and the one you have most control over. Whitespace is not decoration; it is a structural claim about relatedness.
2. **Common region** — things inside a shared boundary are one thing. Cards, panels, bordered sections. Common region **beats proximity** — an element inside a card belongs to that card even if it's physically closer to something outside it.
3. **Uniform connectedness** — things visually connected (by a line, a bar, a shared background) are one thing. Strongest of all when present, which is why a connecting line can override both proximity and enclosure.
4. **Similarity** — things that look alike are the same *kind* of thing. This is how you signal "these are all actions" or "these are all statuses" across a scattered layout.
5. **Prägnanz / good figure** — people resolve complex arrangements into the simplest reading available. If your layout has a simpler wrong reading, that's the one they'll get.

**The diagnostic that makes this useful:** when a screen feels wrong, ask *"what is this layout claiming belongs together, and is that claim true?"* Nine times out of ten a confusing screen has a grouping that contradicts the actual data model — a label sitting closer to the field below it than the field above it, a "cancel" nested inside the same card as the thing it cancels out of, filters proximate to results they don't filter.

**The most common real bug:** in forms, label-to-field proximity. If the gap above a label equals the gap below it, the eye cannot tell which field the label belongs to, and the user resolves it by trial and error. Fixing this is a two-minute change and measurably reduces form error rates. It is also invisible to anyone who hasn't been taught to look for it, which is why forms across the internet get it wrong constantly.

**Where your instincts might mislead you:** in poster and brand work, generous uniform whitespace reads as premium. In dense product UI, uniform whitespace *destroys grouping information* — everything is equally far from everything, so nothing is grouped. Product spacing must be **rhythmic and unequal**: tight within a group, loose between groups. The ratio matters more than the absolute values. A common working rule is that between-group space should be at least 2× within-group space for the grouping to read reliably.

### SOURCE
[Laws of UX](https://lawsofux.com/) — read Law of Proximity, Law of Common Region, Law of Similarity, Law of Uniform Connectedness, Law of Prägnanz. Each is a two-minute read with sources.

### DRILL
Find a dense product screen — a settings page, a dashboard, an admin table. Draw boxes around what the *visual grouping* claims are groups. Then, separately, draw boxes around what *logically* belongs together. Photograph both. Every mismatch is a real bug. Fix the worst one.

---

## Day 3 — Working memory, chunking and cognitive load

### CONCEPT

Working memory is the scarcest resource in your design. It holds roughly **4 ± 1 chunks** for a few seconds. (Miller's famous "7 ± 2" from 1956 was about a specific kind of recall; modern estimates for the kind of holding you care about in interfaces are lower. Design for four.) It is destroyed by interruption and it does not improve with expertise — only *chunking* does.

**A chunk is a unit that has meaning to that particular person.** `BBCITVNHS` is nine chunks to a non-Brit and three to a Brit. This is the entire mechanism of expertise: an expert doesn't have more memory, they have bigger chunks. A chess master sees five meaningful formations where a novice sees twenty pieces.

**Three design consequences, in order of leverage:**

**1. Every "remember this from a previous step" is a tax.** The confirmation code on the previous screen, the price from the comparison page, the ID from the email, the setting you configured three steps ago. Each one occupies a slot and each one leaks. The fix is nearly always: **put it on screen.** Recognition over recall, the second-oldest rule in the field. Users should never have to hold a value in their head across a screen transition — if they do, show it to them at the destination.

**2. Interruption clears the buffer.** A modal, a permission prompt, a notification, an unexpected page load — after any of them the user has lost the values they were holding and often the *intention* itself. This is why "are you sure?" dialogs are more harmful than they look: they cost a full working-memory reset to prevent an error that undo would have handled for free.

**3. Cognitive load has three separable kinds**, and you can only remove one of them:

| Type | What it is | Can you reduce it? |
|---|---|---|
| **Intrinsic** | The inherent difficulty of the task itself | Only by changing the task |
| **Extraneous** | Load imposed by *how it's presented* | **Yes — this is your job** |
| **Germane** | Effort spent building understanding | No — and you don't want to; it's learning |

Almost all design improvement is **removing extraneous load**. Inconsistent labels, unclear structure, hunting for controls, decoding jargon, mental arithmetic the system could have done. Meanwhile the classic beginner mistake is stripping *germane* load — over-simplifying to the point that the user never builds a model, and is therefore permanently dependent on hand-holding.

**Applied to your world:** AI features are load-shifters. They reduce intrinsic load (the model does the hard task) while often *increasing* evaluative load (now you must judge whether the output is right). If judging the output is harder than doing the task, the feature is a net negative — no matter how impressive the generation is. Ask this about every AI feature you ever design. It is the single most useful question in the category.

### SOURCE
[Laws of UX](https://lawsofux.com/) — Cognitive Load, Miller's Law, Chunking, Working Memory. Then Jeff Johnson, *Designing with the Mind in Mind*, chapters on memory.

### DRILL
Take a multi-step flow (checkout, signup, onboarding). At every step, list every piece of information the user must be **holding in their head** to proceed correctly. Count them. Any step over 3 is a redesign candidate. Fix the worst one by putting the value on screen — and note how little visual design that fix required.

---

## Day 4 — Fitts's Law, Hick's Law and the real cost of a click

### CONCEPT

Two predictive models. Both are genuinely quantitative, both are routinely quoted wrongly, and both give you arguments that survive contact with an engineer.

**Fitts's Law.** Time to acquire a target is a function of **distance to it** and **size of it**:

> T = a + b · log₂(D/W + 1)

The practical content: **size matters more than distance, and it's logarithmic.** Doubling a small target's size helps a lot; doubling an already-large target's size helps barely at all. Halving the distance helps less than you'd think.

The important corollaries, which is where the actual design value is:

- **Screen edges have infinite width.** You cannot overshoot them. This is why the Mac menu bar at the very top is faster than Windows' in-window menus, and why "pin to edge" targets are so effective. On mobile it's why bottom-edge navigation beats a floating bar 12px above the edge — those 12px cost real time.
- **Corners are the fastest targets on any screen** — infinite in two dimensions.
- **The target is the whole clickable area, not the visible one.** A 14px icon with a 44px hit area is a 44px target. Conversely a big beautiful card where only the tiny title is a link is a 20px target that *looks* like a 300px one — which is worse than looking small, because it invites a miss.
- **Thumb reach on mobile isn't Fitts, but it compounds with it.** Distance in the model is *effective* distance; a target requiring a grip change is enormously more expensive than its pixel distance suggests.

**Hick's Law.** Decision time increases logarithmically with the number of choices:

> T = a + b · log₂(n + 1)

Also logarithmic — which means **the popular use of it is wrong.** Hick's Law does *not* say "always reduce the number of options." Going from 10 options to 5 saves much less time than intuition suggests. And critically, Hick's Law only applies when the options are **unordered and equally likely.** A sorted list, a categorised menu, a search field — these break the log relationship entirely, because the user isn't choosing among *n*, they're navigating a structure.

This is why "we simplified by cutting features" often fails to make anything feel simpler, and why **organising** twenty options into four groups of five beats **cutting** to ten. Structure beats subtraction. Remember this in Week 6.

**Where these two collide, and it's the most useful thing here:** big targets take space, and space pushes other targets further away. Every enlargement is a Fitts trade against everything else. There is no free lunch — there is only an explicit decision about *what is the primary action*, which gets the size and the position, and what is secondary, which pays for it. Designers who don't make this decision explicitly end up with screens where everything is medium-sized and nothing is fast.

### SOURCE
[Laws of UX](https://lawsofux.com/) — Fitts's Law and Hick's Law, both with original citations. Then [MIT 6.831 Lecture 4](https://ocw.mit.edu/courses/6-831-user-interface-design-and-implementation-spring-2011/) for the formal treatment and the Model Human Processor.

### DRILL
Pick a screen you've designed or a screen you use daily. For each interactive element, estimate its effective target size (hit area, not visual) and its distance from the previous likely action. Rank them. Then check: **is the ranking the same as the importance ranking?** Wherever it isn't, you have a Fitts bug. Fix the top one.

---

## Day 5 — Human error: slips, mistakes, and undo over confirm

### CONCEPT

Norman's central claim, and one of the most important ideas in the field:

> **Most "human error" is design error.** If a system reliably produces errors from competent, attentive people, the system is at fault.

This is not sentimentality. It's the only stance that produces improvement, because you cannot redesign a human but you can redesign an interface.

**Two fundamentally different failures**, and they need opposite fixes:

**Slips** — you had the right intention and executed it wrongly. Autopilot failures. Typing your old password. Clicking "Archive" because it's where "Reply" used to be. Slips happen *more* to experts, because expertise means automaticity, and automaticity means acting without checking.
→ **Fix with constraints, spacing, and reversibility.** Never with warnings — the user isn't attending, so they won't read it. Physically separate destructive actions from frequent ones. This is a *layout* fix.

**Mistakes** — you executed correctly but the intention was wrong. A model failure. Deleting a file you thought was a copy. Setting a recurring transfer thinking it was one-off. Mistakes happen more to novices and to anyone with a wrong conceptual model.
→ **Fix with better feedback, clearer conceptual models, and visible system state.** This is a *model* fix. Warnings can help here, because the user *is* attending and the warning can correct the model — but only if it says something specific about consequences, not "Are you sure?"

Confusing these is why so much error handling fails. A confirmation dialog is a mistake-fix deployed against a slip. It doesn't work, because the same autopilot that clicked "delete" clicks "yes." Everyone has experienced this and almost nobody names it correctly.

**The hierarchy of error handling**, best to worst:

1. **Make the error impossible** — constraint. Can't select an invalid date because it's not in the picker.
2. **Make the error harmless** — undo. This is nearly always the right answer for destructive actions.
3. **Make the error obvious immediately** — inline validation at the moment of entry, not on submit.
4. **Make the error recoverable** — clear message, preserved input, obvious next step.
5. **Warn beforehand** — mostly ineffective for slips, occasionally useful for genuinely irreversible actions.
6. **Blame the user** — "Invalid input." Never do this.

**Undo over confirm** is the single highest-leverage principle in this entire week. A confirm dialog interrupts every user, every time, to prevent an error that happens rarely. Undo interrupts nobody and fixes the error when it happens. Gmail's "Undo Send" is the canonical proof: it replaced a universally-hated confirm-before-send pattern with a five-second window, and it is beloved. The cost is engineering — undo is genuinely harder to build than a dialog — which is why designers must argue for it explicitly rather than assuming it.

**Forcing functions**, three flavours worth knowing by name:
- *Interlock* — forces sequence (can't start the car without the brake down)
- *Lock-in* — keeps an action going, prevents premature stop ("you have unsaved changes")
- *Lockout* — prevents entry into a dangerous state (fire exit stairs that stop at ground floor so you don't run into the basement)

### SOURCE
Norman, *DOET*, **Chapter 5: Human Error? No, Bad Design**. One of the best chapters in design literature.

### DRILL
Find **three** confirmation dialogs in products you use. For each: classify the error it's trying to prevent as slip or mistake, then design the version that uses undo, a constraint, or better feedback instead. Note honestly what each replacement costs to build — this is the conversation you'll actually have with engineering.

---

## Day 6 — Studio A: the cognitive audit

### CONCEPT

Re-audit your Studio A flow with this week's instruments. Where Week 1 asked *"where are the gulfs?"*, this week asks *"what does this cost the human machine?"*

Work through your captured flow and answer, screen by screen:

- **Pre-attentive:** what wins the 250ms competition on this screen? Is it the right thing?
- **Gestalt:** what does the layout claim is grouped? Is the claim true?
- **Memory:** what must be held in the head from a previous step? Count it.
- **Fitts:** are the highest-frequency and highest-importance targets the largest and closest?
- **Hick:** where is there an unordered choice set? Could structure beat subtraction there?
- **Error:** where can a slip happen? Where can a mistake happen? Is each handled with the right class of fix?

### DRILL — Deliverable A2

Produce the **cognitive audit layer** over your Week 1 capture. For each screen, a short annotation block:

```
SCREEN 04 — Payment method selection
PRE-ATTENTIVE   Promo banner wins; primary CTA loses. Bug.
GESTALT         "Save card" checkbox is proximate to the wrong field group.
MEMORY          Holds: card type from step 2 (unnecessary — not shown here). Load: 1.
FITTS           Primary CTA 44px, bottom-right. Good. "Edit" links 16px. Weak.
HICK            6 unordered payment types. Could group into saved / new.
ERROR           Slip risk: "Remove" adjacent to "Set default". No undo.
```

Then write a **one-page summary**: the five highest-cost findings, ranked, each with the named law and a one-line proposed fix.

*Time check: audit ~60 min, summary ~25 min.*

---

## Week 2 self-check

1. Which of the five laws did I already use intuitively but couldn't name until now?
2. Where in my past work did I spend the pre-attentive budget badly?
3. What's one confirm dialog in the product I work on that should be an undo?
4. Where did I default to visual craft instead of the harder thinking this week?
