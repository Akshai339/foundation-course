---
tags: [product-design, course, week, phase/foundations]
week: 1
phase: Foundations
---

# Week 01 — The Discipline and the Machine in the Head

> **The week's thesis:** A user is not looking at your interface. They are running a loop — form a goal, guess what to do, do it, look at what happened, decide if it worked. Every good interface decision is a decision about that loop. Every bad one ignores it.

**Studio:** [[03 The Studios|Studio A]] kicks off on Day 6.
← [[01 The Curriculum]] · next → [[Week 02 — Human Capabilities and the Laws]]

---

## Day 1 — What product design actually is, and the four things it isn't

### CONCEPT

Most definitions of product design are useless because they list activities. Here's a better one:

> **Product design is deciding what should exist, for whom, at what cost — and then making it comprehensible.**

Two clauses. The first is a *judgment* problem. The second is a *craft* problem. You are currently strong at the second clause and untrained in the first. That asymmetry is the entire reason this course is structured the way it is.

**The four things it isn't, and why the distinction matters:**

**It isn't UI design.** UI design is the visual and interactive surface. It's a *component* of product design, roughly the way typesetting is a component of publishing. A UI designer receives a spec and makes it good. A product designer questions whether the spec should exist. When people say "AI has made design easy," they mean AI has made *UI* easy. They are right, and it's exactly why the value has moved upstream.

**It isn't UX design**, at least not as the term is used. "UX" as a job title usually means research and flows without visual execution. Product design is the integrated role: you frame, you research, you structure, *and* you ship pixels. Your generalist background is an advantage here, not a compromise.

**It isn't user advocacy.** This is the one that trips up thoughtful people. Your job is not to be the user's lawyer in a room of businesspeople. Your job is to find designs where the user's interest and the business's interest are *the same thing*, and to be honest when they're not. A designer who only ever argues for the user gets quietly routed around. Your marketing background is a genuine asset here — you already understand that a product has to be *sold*, not just used.

**It isn't problem-solving.** It's problem-*selecting*. Anyone can solve a well-defined problem, and increasingly a model can too. Choosing which problem is worth solving, in what order, with how much effort — that's the job. Everything in Phase 2 of this course is about this.

**The thing to hold onto this week:** for the next three weeks you're building a *mechanical* model of the user. Not an empathetic one — a mechanical one. Empathy tells you to care. Mechanism tells you what to do.

### SOURCE
[MIT 6.831 Lecture 1 — Usability](https://ocw.mit.edu/courses/6-831-user-interface-design-and-implementation-spring-2011/) (lecture notes PDF). Read for the definition of usability as *learnability, efficiency, safety* — three dimensions that usually trade off against each other. Note where each of your favourite tools sits.

### DRILL
Write, in your own words, 200 words on: **"the last time I designed something that looked right and worked badly."** Be specific and unkind to yourself. Name what you optimised for instead of the user's loop. Keep this — you'll re-read it in Week 12.

---

## Day 2 — Norman's Action Cycle and the two Gulfs

### CONCEPT

This is the single most useful model in the field. Learn it properly and you will diagnose interfaces for the rest of your career.

A person using anything runs seven stages:

```
                    GOAL
                  ("I want X")
                      |
      ┌───────────────┴───────────────┐
      │                               │
  EXECUTION                       EVALUATION
      │                               │
  1. Plan       (what can I do?)   7. Compare  (did I get X?)
  2. Specify    (how do I do it?)  6. Interpret (what does that mean?)
  3. Perform    (do it)            5. Perceive  (what happened?)
      │                               │
      └──────────► THE WORLD ◄────────┘
```

Between the person's intentions and the system's controls there is a **Gulf of Execution**: *can I figure out how to do what I want?* Between the system's output and the person's understanding there is a **Gulf of Evaluation**: *can I tell what happened and whether it worked?*

**Every usability problem is one of these two gulfs.** Not most. All.

This is not a metaphor — it's a diagnostic. When something feels bad, don't say "it's confusing." Ask *which gulf, which stage*:

| Symptom | Stage | The fix is about |
|---|---|---|
| "I don't know what I can do here" | 1. Plan | Visibility of options, affordances |
| "I know what I want but not how" | 2. Specify | Labelling, mapping, discoverability |
| "I tried and it didn't take" | 3. Perform | Hit targets, gestures, physical constraints |
| "Did that work?" | 5. Perceive | Feedback — the most common failure |
| "It did *something*, I don't know what" | 6. Interpret | Legible system state |
| "It worked but not how I wanted" | 7. Compare | Mismatched conceptual model |

Run this on the last interface that annoyed you. Nine times out of ten it's stage 5 or 6 — the system did something and told you nothing useful. Feedback is cheap to build and chronically under-designed, which makes it the highest-leverage thing a new product designer can fix.

**Why this matters for AI products specifically:** the Gulf of Evaluation is *enormous* in AI interfaces. The model did something. Was it right? You often cannot tell by looking. This is the defining design problem of your industry, and we'll spend all of Week 11 on it. Notice now that it's not a new problem — it's Norman's stage 6, at maximum difficulty.

### SOURCE
Norman, *The Design of Everyday Things*, **Chapter 2: The Psychology of Everyday Actions**. If you don't have the book yet, the [Georgia Tech CS6750 reading list](https://omscs6750.gatech.edu/spring-2022/required-reading-list/) confirms the chapter mapping, and Norman's 1986 "Cognitive Engineering" chapter is the primary source.

### DRILL
Take one flow you used today — anything, bank app, Figma, Slack. Diagram all seven stages for **one specific goal** in it. Mark where each gulf is widest. Write one sentence per gulf on what the designer could have done. This is the exact method you'll use for Studio A.

---

## Day 3 — Affordances, signifiers, constraints, mappings

### CONCEPT

Four words that get used loosely and mean precise things. Getting them precise upgrades your vocabulary from "designer" to "designer people listen to."

**Affordance** — a *relationship* between an object's properties and an agent's capabilities. A chair affords sitting to an adult, not to a toddler. Critically: **affordances are not visual properties.** A button on screen doesn't "have" an affordance; the relationship between it and a mouse-wielding human affords clicking. Norman spent years correcting the design industry's misuse of this word, and getting it right marks you as someone who read the source.

**Signifier** — the *perceptible signal* that communicates where the action should happen. This is what designers usually mean when they misuse "affordance." A shadow under a button is a signifier. A "PUSH" plate on a door is a signifier. Underlined blue text is a signifier.

The distinction is load-bearing: **the affordance exists whether or not you can perceive it.** A flat, unadorned div can be clickable — it *affords* clicking — but with no signifier, nobody knows. Every flat-design usability disaster of the 2010s was a signifier problem, not an affordance problem, and the industry's inability to name it correctly is why it took a decade to fix.

**Constraint** — a limitation that reduces the space of possible actions. Four kinds:
- *Physical* — the plug only fits one way; you can't drag a card outside its container
- *Cultural* — red means stop; a bin icon means delete
- *Semantic* — a motorcycle rider must face forward, so the windscreen goes in front
- *Logical* — one piece left, one hole left, so they go together; a disabled "Next" until the form's valid

Constraints are the most underused tool in interface design. Junior designers add explanation; senior designers **remove possibility**. If a user can't do the wrong thing, you don't need to explain the right thing.

**Mapping** — the relationship between controls and their effects. Good mapping is *spatial and natural*: the stove knob arranged like the burner it controls. Bad mapping is arbitrary and requires memorisation. Every time a user has to remember which control does what, you have a mapping failure, and you've spent their working memory — a resource you'll learn to budget in Week 2.

**The synthesis, and the actual takeaway:**

> Affordances determine what's *possible*. Signifiers communicate what's *available*. Constraints eliminate what's *wrong*. Mappings make relationships *obvious*.

Four separate levers. Most designers only reach for signifiers — adding labels, icons, tooltips, onboarding. Reach for constraints and mappings first. They're structural, and structural fixes don't need explaining.

### SOURCE
Norman, *DOET*, **Chapter 1: The Psychopathology of Everyday Things**. The teapot, the doors, the light switches. It's charming and it's also the intellectual foundation of the whole discipline.

### DRILL
Photograph or screenshot **five** interfaces (mix physical and digital). For each, label: one affordance, one signifier, one constraint, one mapping. Then find one where the signifier is doing work that a constraint should be doing — and redesign that one thing.

---

## Day 4 — Conceptual models vs mental models: your real product

### CONCEPT

Here's the reframe that changes what you think you're making.

**You are not designing screens. You are designing a model in someone's head.** The screens are just the delivery mechanism.

Three models are always in play:

1. **The system model** — how the thing actually works. Databases, sync, API calls, model weights. Almost always too complex and too weird to expose.
2. **The conceptual model** — the deliberately simplified story the *design* tells about how it works. This is your actual output.
3. **The user's mental model** — the story that ends up in the user's head after using it.

Your job: design a conceptual model that is **simpler than the system, accurate enough to predict from, and easy to absorb.** Then get it into the user's head using interface, language and behaviour.

**Worked examples:**

- **Files and folders** are a conceptual model. The disk has no folders. It has blocks and an index. "Folders" is a lie — a load-bearing, forty-year, extraordinarily successful lie, because it lets people predict correctly. That's the only test a conceptual model has to pass: *does it let the user predict what will happen?*
- **Gmail's labels vs Apple Mail's folders.** Same underlying storage, two conceptual models. Labels are more powerful and more accurate to the system; folders match people's existing mental model from physical offices. Gmail spent years fighting the fact that its *better* model was the *harder* one. Accuracy is not the same as fit.
- **Undo** is a conceptual model claim: "the system has a history and you can move backwards through it." It's expensive to build and it's a promise. Break it once — one action that can't be undone, unmarked — and the model shatters and the user becomes cautious. Cautious users explore less, and users who explore less learn your product more slowly.

**Where mental models come from:** people don't build them from documentation. They build them from three sources — **the interface itself**, **prior products they've used**, and **the words you use**. That third one is why naming is a structural decision, not a copywriting one. Calling something a "workspace" versus a "project" versus a "board" imports an entire set of expectations about permanence, ownership and nesting before the user clicks anything.

**The failure mode to watch for:** *model leakage*. The system model bleeds through the conceptual model at the edges — usually in error messages, loading behaviour, or sync conflicts. The user gets a coherent story for 95% of use and then hits "409: version conflict on resource" and their model collapses. **Error states are where conceptual models go to die**, which is why Week 10 exists.

**And for your industry:** what conceptual model does a chat interface give someone about an LLM? Mostly: "it's a person who knows things." That model predicts wrongly about hallucination, context limits, and statelessness — and almost every AI product's usability problem downstream is a consequence of that one inherited, incorrect model. Hold that thought until Week 11.

### SOURCE
Norman, *DOET*, **Chapter 1 section on conceptual models**, plus Week 6 of [CS6750](https://omscs6750.gatech.edu/spring-2022/required-reading-list/) — MacKenzie's "Mental Models & Metaphor" and Norman's Chapter 5.

### DRILL
Pick a product you know deeply. Write out (a) its conceptual model in **three sentences a non-user would understand**, (b) two things a user would predict correctly from it, (c) **one place the system model leaks through**. Then do the same for a product you find confusing — the leak will be easier to find and it will tell you what's wrong.

---

## Day 5 — Direct manipulation and why things feel good

### CONCEPT

"It feels good" is a real property with real causes. Here they are.

Shneiderman named *direct manipulation* in 1983; Hutchins, Hollan and Norman explained the mechanism in 1985 in the paper that's still the best thing written on the subject. Their argument: direct manipulation reduces the two gulfs by making the interface's objects behave like objects in the world.

Three properties:

1. **Continuous representation of the objects of interest** — the thing is on screen, always, not hidden behind a command.
2. **Physical actions instead of complex syntax** — you drag, not type `mv file /dest`.
3. **Rapid, incremental, reversible operations with immediately visible effects** — you see the result as you act, and you can back out.

Hutchins et al. added the crucial idea of **directness as a felt property with two components**:

- **Distance** — the gap between your intention and the actions the system requires. Short distance = feels direct. Every translation step you have to do in your head widens it.
- **Engagement** — the feeling of operating on the objects *themselves* rather than sending instructions to an intermediary who operates on them for you.

Engagement is the subtle one and it's where your motion background gives you an edge. The difference between a slider that updates live and one that updates on release is not efficiency — it's *engagement*. In the first, you are moving the value. In the second, you are asking a system to change it. Same information, completely different feel.

**Why this is worth knowing in 2026:** we're in a hard swing *away* from direct manipulation. Chat interfaces are the opposite of direct: you describe an intention in words to an intermediary, wait, and receive a result. Maximum distance, minimum engagement. That's why AI-generated design work often feels remote to work with even when the output is good.

The design frontier right now — and this is genuinely where the interesting jobs are — is **hybrid**: use language for expressing *intent* (which language is superb at), and direct manipulation for *refinement* (which language is terrible at). Describe the layout you want; then drag the thing two pixels left. Any AI product that only offers the chat half is leaving enormous usability on the table, and being able to articulate *why*, with this vocabulary, is a genuinely valuable thing to be able to do in a product review.

**A caution.** Direct manipulation isn't universally superior. It's poor at: operating on things you can't see, repetition across many objects, abstraction and conditionals, and precision. This is why professional tools keep command palettes and why `find -exec` still exists. The rule: **direct manipulation for the concrete and visible; language for the abstract, absent, and repeated.**

### SOURCE
★ **Hutchins, Hollan & Norman (1985), "Direct Manipulation Interfaces."** Findable via Google Scholar; also on the [MIT 6.831 readings list](https://groups.csail.mit.edu/graphics/classes/6.831/readings.html). Read at minimum the sections on distance and engagement.

### DRILL
Find **three** interactions in products you use: one maximally direct, one maximally indirect, one hybrid. For each, write what it costs and what it buys. Then take one indirect interaction and sketch a direct version — and honestly name what the direct version makes *worse*.

---

## Day 6 — Studio A kickoff: choose your target and diagnose

### CONCEPT

Time to make something. Read the [[03 The Studios|Studio A brief]] in full before starting.

Today you're doing **flow capture and first-pass diagnosis**. Three notes on doing it well:

**Capture before you judge.** Go through the whole flow once, screenshotting every screen and every state, doing nothing else. The instinct to start critiquing at screen two will make you miss the structure. You cannot diagnose a system you've only seen in fragments.

**Capture the states, not just the screens.** The same screen with an empty list, a loading spinner, a validation error and a full list is four artifacts. This is the habit that most separates product designers from UI designers, and it's the one that will feel most tedious today and most valuable in Week 10.

**Diagnose with the week's vocabulary only.** No "this feels clunky." Every observation must use: gulf of execution/evaluation, one of the seven stages, affordance, signifier, constraint, mapping, conceptual model, directness. Constraining your vocabulary forces precision — and if you can't express a problem in these terms, you probably haven't understood it yet.

### DRILL — Deliverable A1

1. **Choose your flow** against the criteria in the brief. Write one paragraph on why you chose it and what you *think* is wrong — you'll check this prediction in Week 3.
2. **Capture** every screen and state, sequenced, in FigJam or Figma. Number them.
3. **Annotate** 10–15 observations using only this week's vocabulary. Tag each: `[GULF-EXEC]` `[GULF-EVAL]` `[SIGNIFIER]` `[CONSTRAINT]` `[MAPPING]` `[MODEL]` `[DIRECTNESS]`.
4. **Write the conceptual model** the product is trying to give you, in three sentences. Then note where it leaks.

*Time check: capture ~25 min, annotation ~35 min, model ~15 min.*

---

## Week 1 self-check

Answer in your daily log (see [[04 Rubrics and Self-Critique]]):

1. Which of the seven action stages do I now think I've been ignoring in my own work?
2. Where in my past work did I use a signifier where a constraint would have been better?
3. What conceptual model does the product I work on actually give people — and is it the one my team thinks it gives?
4. Where did I default to visual craft instead of the harder thinking this week?
