---
tags: [product-design, course, week, phase/product]
week: 4
phase: Product Layer
---

# Week 04 — Problem Framing and Product Sense

> **The week's thesis:** The highest-leverage work in product design happens before any screen exists. A well-framed problem makes the design obvious; a badly-framed one makes brilliant execution worthless. This is the week you stop receiving problems and start defining them.

**Studio:** [[03 The Studios|Studio A]] closes and [[03 The Studios|Studio B]] begins on Day 6.
← [[Week 03 — Interaction, State and Evaluation]] · next → [[Week 05 — Research That Changes Decisions]]

---

## Day 1 — Problem, symptom, solution: telling them apart

### CONCEPT

Almost every design request you will ever receive is **a solution in disguise**. "Add a dashboard." "Can we make the onboarding shorter?" "Users want dark mode." "We need an AI assistant."

Each of these is someone's *proposed answer* to a problem they haven't articulated — often haven't consciously identified. Your first job, every single time, is to reverse-engineer the question.

**The three levels, and how to tell them apart:**

| | What it is | How it sounds | What to do |
|---|---|---|---|
| **Solution** | A proposed implementation | "Add a filter dropdown" | Ask what it would fix |
| **Symptom** | An observed effect | "Support tickets about finding old orders are up 40%" | Ask why it's happening |
| **Problem** | The underlying cause | "Users can't recall order dates, and date is the only retrieval key we provide" | Design against this |

Notice the third one already contains most of the design. That's the tell for a well-framed problem: **once it's stated properly, the solution space is small and obvious.** If you're staring at a framing and feeling like anything could solve it, it isn't framed yet.

**The technique: laddering.** Take any request and ask "what would that fix?" repeatedly.

> "We need a dashboard."
> — What would it fix? *"Managers don't know how their team is doing."*
> — Why don't they? *"They'd have to check five different pages."*
> — When do they need to know? *"Mostly before the Monday standup, and when something's gone wrong."*
> — What do they do now? *"Ask people on Slack."*

You've moved from "build a dashboard" to *"managers need a periodic and an exception-triggered read on team state, and currently pay for it in social cost by interrupting people."* Notice that this framing suggests things a dashboard doesn't: a Monday morning digest, an anomaly alert, a Slack integration. **The dashboard might still be right — but now it's a choice, not an inheritance.**

**Why this matters more now than five years ago.** When execution was expensive, framing errors were caught by cost — you couldn't afford to build the wrong thing so someone asked hard questions. Now you *can* generate ten polished variants of the wrong thing in an afternoon. The economic brake on bad framing is gone. **Framing is now the only remaining brake**, and it lives with you.

**The political reality.** Laddering can read as obstruction. The move that keeps you employed: never refuse the request, *widen* it. "Yes — and before I design it, let me make sure I understand what it's fixing, because there might be a cheaper way to get the same outcome." Nobody objects to cheaper. Your marketing background is useful here; you already know how to sell an idea rather than just be right about it, and most designers are terrible at this.

### SOURCE
[Shape Up, Chapter 2: Principles of Shaping](https://basecamp.com/shapeup) — read the section on setting boundaries and finding the right level of abstraction. Free online.

### DRILL
Take **three** real design requests you've received in your career. For each: write it as stated, ladder it down at least three "what would that fix?" levels, and write the reframed problem. Then note whether the original request would still be the right solution. At least one of them won't be.

---

## Day 2 — Jobs to be Done, and its honest limits

### CONCEPT

JTBD's core claim: **people don't buy products, they hire them to make progress in a particular circumstance.** The famous example is Clayton Christensen's milkshakes — a fast-food chain discovered a large share of milkshakes were bought before 9am by lone commuters, who were "hiring" the shake for a job that had nothing to do with dessert: *make my boring commute less boring, one-handed, and keep me full until lunch.* Competitors weren't other milkshakes. They were bagels, bananas, and boredom.

**The job statement format:**

> When \_\_\_\_ [situation], I want to \_\_\_\_ [motivation], so I can \_\_\_\_ [expected outcome].

The **situation** clause is the part that does the work, and the part most people drop. "I want to share files easily" is not a job. *"When I've just finished a shoot and the client is waiting, I want to get 40GB to them without either of us installing anything, so I can invoice today"* — that's a job, and it immediately rules out half the file-sharing design space.

**Why it's genuinely useful for you:**
- It kills demographic thinking. Jobs are situational, not personal. The same person hires different products for the same nominal task in different circumstances.
- It reveals **real competition**. Your competitor is whatever they do instead — usually a spreadsheet, a WhatsApp message, or nothing.
- It surfaces the **forces of progress**: push (dissatisfaction with current), pull (attraction of new), habit (inertia), anxiety (fear of the new). Adoption failures are almost always habit and anxiety, not insufficient pull — which is why adding features rarely fixes them. Your GTM background should find this familiar; it's the same structure as a switching-cost analysis.

**Now the honest limits, because JTBD is oversold:**

1. **It's a lens, not a method.** There's no reliable procedure that takes you from interviews to correct job statements. Two competent people will produce different jobs from the same transcripts. Treat it as a way of *framing* what you learned, not a way of learning it.
2. **The abstraction level is arbitrary and unresolvable.** "Get files to a client" / "look professional to a client" / "get paid faster" are all defensible jobs for the same behaviour. Pick too high and everything is "save time"; too low and you've just described a feature. Judgment, not method.
3. **It underweights the social and emotional.** Purists insist jobs include emotional and social dimensions, but in practice teams reduce them to functional tasks and then wonder why the well-optimised product feels lifeless.
4. **It's retrospective.** JTBD explains adoption beautifully after the fact. It's much weaker as a generative tool — it's better at telling you why the milkshake sold than at telling you what to build tomorrow.

**Use it for:** understanding *why* people adopted or didn't, finding non-obvious competition, keeping the situation in view.
**Don't use it for:** as a substitute for research, or as a magic phrase in a room.

### SOURCE
Christensen et al., *Competing Against Luck* — or, faster and free, [the "Know Your Customers' Jobs to Be Done" HBR article](https://hbr.org/2016/09/know-your-customers-jobs-to-be-done). Read Bob Moesta's interviewing work if you want the practical version.

### DRILL
Write **three job statements** in full format for a product you know deeply — one functional, one emotional, one social, all for the *same* product. Then for each, name what it competes with. If any competitor is "a spreadsheet," "a WhatsApp group," or "doing nothing," you've probably got it right.

---

## Day 3 — Point of View statements and How Might We

### CONCEPT

These are the two artifacts that convert research into design direction. They come out of the Stanford d.school tradition and they're used badly almost everywhere, which is a shame because used well they are extremely sharp.

**The POV statement** — the compressed statement of what you learned and what it means:

> **[User]** needs **[need]** because **[surprising insight]**.

Three rules that make the difference between a POV and a platitude:

1. **The need is a verb, not a noun.** "Needs a faster upload" is a solution. "Needs to *reassure the client that the files arrived*" is a need. Nouns smuggle in solutions; verbs stay open.
2. **The insight must be surprising.** If the "because" clause is something everyone on the team already believed, you have a summary, not a POV. The insight is the part that earns the statement.
3. **It must be falsifiable.** You should be able to say what evidence would prove it wrong.

Compare:
> ✗ "Freelance photographers need an easier way to share files because current tools are complicated."
> ✓ "Freelance photographers need to *prove* delivery happened, because the real anxiety isn't the transfer — it's the two days of silence afterwards where they can't tell if the client is unhappy or just hasn't looked."

The second one immediately generates designs the first never would: read receipts, view analytics, a nudge, a delivery page that feels like a handover rather than a link. **A good POV makes the design cheap.**

**How Might We** — turning the POV into a design prompt. `How might we [do something] so that [outcome]?`

The whole skill is **altitude**. Too narrow and you've smuggled the solution in; too broad and it's useless.

> ✗ Too narrow: "How might we add read receipts to the download page?"
> ✗ Too broad: "How might we improve client communication?"
> ✓ Right: "How might we make the moment of delivery feel like a completed handover rather than a sent link?"

A useful check: **a good HMW should have at least five genuinely different answers, and you should not already know which is best.** If you can only think of one answer, it's too narrow. If you can think of fifty unrelated ones, it's too broad.

**Generate several HMWs from one POV, at different altitudes.** Amplify the good ("how might we make the anxious wait *pleasant*"), remove the bad ("how might we eliminate the wait entirely"), question the assumption ("how might we make delivery something the client initiates"). Then choose.

### SOURCE
[Stanford CS147 assignment briefs](https://hci.stanford.edu/courses/cs147/) — the needfinding → POV sequence is one of the assignments, and the briefs are public and excellent. Also the d.school's Design Thinking Bootleg (free PDF).

### DRILL
From your Studio A evaluation findings, write **one POV statement** about the users of that flow. Force yourself to make the "because" clause something your evaluation actually revealed rather than something you assumed. Then generate **five HMWs** from it at different altitudes and mark which one you'd actually design against, with a sentence on why.

---

## Day 4 — Appetite over estimates: Shape Up's core move

### CONCEPT

This is the most immediately practical idea in the week, and the one most likely to change how you operate at work next Monday.

**The standard process:** define the solution, then estimate how long it takes, then negotiate. This fails predictably, because estimates are unreliable, because scope expands to fill them, and because the conversation happens *after* the solution is chosen, when it's too late to trade.

**Shape Up inverts it:** decide *how much the problem is worth* first. That's the **appetite**.

> Not "how long will this take?"
> But **"how much time are we willing to spend on this?"**

Appetite is a *constraint you design inside*, exactly like a canvas size. "This is a two-week problem" or "this is a six-week problem" is a statement about the problem's value, made before any solution exists. Then the design work becomes: *what's the best thing we can do within this?*

**Why this is transformative for a designer:**

1. **It makes scope a design material.** You stop presenting one solution and asking for time. You start presenting "here's the two-week version and here's the six-week version, and here's what the extra four weeks buys." That's a conversation a business person can actually have with you, and it makes you a partner rather than a supplicant.
2. **It kills the estimate trap.** You will always be wrong about how long design takes. You can be reliably right about what fits in a fixed time.
3. **It gives you a principled way to cut.** With a fixed appetite, cutting isn't failure — it's the mechanism. Shape Up calls the fixed-time/variable-scope arrangement exactly that: fixed time, variable scope.

**Three connected concepts worth stealing:**

- **Shaping** — work at the right level of abstraction. Concrete enough that the team knows what to build; abstract enough that they have room to solve problems. Shape Up's phrase for the artifact is a *pitch*: the problem, the appetite, a rough solution (deliberately drawn crudely, at "fat marker" fidelity so nobody mistakes it for a spec), rabbit holes to avoid, and explicit no-gos.
- **Rabbit holes** — the parts of a problem that could silently consume all the time. Identifying and *pre-solving* them is the highest-value part of shaping. "We'll use the existing permissions model rather than building granular sharing" is a rabbit hole patched.
- **The circuit breaker** — if it doesn't ship in the cycle, it doesn't get an extension; it goes back to be re-shaped. Brutal, and it's the only thing that makes appetites real.

**The "fat marker sketch" is the bit most relevant to you.** Shape Up deliberately draws solutions at a fidelity so low they *can't* be over-specified. For a designer with strong visual chops this is uncomfortable — you can make it beautiful, so you do, and then the beautiful thing becomes the spec and the engineering team's judgment is squeezed out. **Deliberately under-rendering early work is a professional skill.** Practice it.

### SOURCE
★ [Shape Up — Ryan Singer](https://basecamp.com/shapeup), free online. Read **Chapter 3 (Set Boundaries)**, **Chapter 4 (Find the Elements)** and **Chapter 5 (Risks and Rabbit Holes)**. About 45 minutes.

### DRILL
Take the HMW you selected yesterday. Write **two pitches** for it — a two-week appetite and a six-week appetite. Each: problem, appetite, fat-marker solution sketch (deliberately crude — use an actual thick marker or a 20px brush), rabbit holes, no-gos. Then write one paragraph on what the extra four weeks buys and whether it's worth it.

---

## Day 5 — Product sense: building the intuition deliberately

### CONCEPT

"Product sense" is what people call it when a designer consistently makes good calls about what to build without needing data for every decision. It gets talked about as innate taste. It isn't. It's a **trained pattern library plus a habit of prediction and correction**, and it can be built deliberately.

Julie Zhuo's definition is the useful one: having good instincts about what makes a product useful and well-loved, and the ability to design toward that outcome.

**The mechanism, stated plainly:** product sense is a large, indexed store of *product decision → outcome* pairs. Experts have seen thousands. You currently have hundreds, mostly from marketing. The way to acquire more, faster than by shipping, is to **predict outcomes and then check**.

**The deliberate practice protocol.** Weekly, and it takes about 40 minutes:

1. **Use one product you've never used.** Not skim — complete a real task in it.
2. **Reverse-engineer the decisions.** For three specific choices they made, ask: *what were they optimising for?* Not "was this good" — what *goal* makes this choice correct? Assume competence; find the goal that makes the decision rational.
3. **Find the tradeoff.** Every decision cost something. Name what they gave up. If you can't, you haven't understood the decision.
4. **Predict.** Write down: "I think this will/won't work because ___." Date it.
5. **Check back.** Revisit predictions monthly. The correction loop is where the sense actually forms — steps 1–4 without step 5 is just opinions with extra steps.

**Compare products in pairs.** Single-product analysis tells you what a team did; paired analysis tells you what was *optional*. Notion vs Linear. Cash App vs Venmo — same function, wildly different opinions about whether payment is social. Superhuman vs Gmail. Every difference between two competent products in the same category is a *decision*, and the differences are where the learning is.

**Your specific advantage, and use it consciously:** you have run GTM and performance marketing. That means you already have intuitions most designers lack — about acquisition cost, about what makes someone activate, about how positioning constrains product, about which features are actually *messaging* rather than utility. Most designers cannot tell the difference between a feature that helps users and a feature that helps the sales team explain the product, and consequently they argue against the second one and lose. You can name it, which means you can design *for* it honestly. That's a genuinely differentiated skill and it's worth being explicit about it in interviews.

**Your specific risk:** marketing trains you to find the compelling story. Product sense requires being able to say "this story is compelling and the underlying thing doesn't work." Watch for the moment you're persuaded by a narrative rather than a mechanism.

### SOURCE
★ [Jules Walter — How to develop product sense](https://www.lennysnewsletter.com/p/product-sense) (Lenny's Newsletter). The most concrete published method. Then [Julie Zhuo — What Designers Can Learn from PMs](https://medium.com/the-year-of-the-looking-glass/what-designers-can-learn-from-pms-3aa285f511bc).

### DRILL
Start the practice, today, properly. Pick one product you've never used, complete a real task, and write the full four-step analysis plus a dated prediction. **Create a note called `Product Sense Log`** in this vault and put it there. Add one entry every week for the rest of the course — that's eight more, and it's the single habit from this course most likely to still be paying you in five years.

---

## Day 6 — Studio A close, Studio B kickoff

### CONCEPT

Two things today. Close the loop on the teardown, and open the ambiguity.

**Closing Studio A.** Your evaluation report told you what's wrong. The rebuild brief says what you'd *do about it*, under an appetite. This is the artifact that shows you can prioritise — which is what the whole studio was actually testing.

The brief is one page. Not screens. **A one-page brief with no visuals is deliberately harder for you than a set of beautiful mockups**, and that's the point.

**Opening Studio B.** Read the [[03 The Studios|Studio B brief]] in full. Choosing your problem is today's real work, and the constraint that should drive it is: **can you reach three people who have this problem, this week?** Everything else is secondary. A perfect problem you can't research is worse than a mediocre problem you can.

Do not pick a problem where you can already picture the screens. If you can, you'll spend four weeks confirming what you already thought, and learn nothing.

### DRILL — Deliverables A4 + B0

**A4 — The rebuild brief.** One page, no visuals:
- The three problems worth fixing, in order, each with its severity and the principle involved
- The appetite you're assuming, and what fits inside it
- What you are explicitly **not** fixing, and why
- What your proposed changes make **worse** — at least two things, honestly
- One fat-marker sketch, deliberately crude, of the single most important change

**B0 — Studio B problem selection.** Half a page:
- The problem, stated as a problem and not a solution (use the laddering from Day 1)
- The three people you will interview, by name, and how you'll reach them
- Your current hypothesis about what they need — **written down and dated**, so Week 5 can prove you wrong
- What would make you abandon this problem

*Time check: A4 ~50 min, B0 ~35 min, plus outreach messages to your three interviewees — send them today.*

---

## Week 4 self-check

1. Which of my three real design requests turned out to be a solution masquerading as a problem?
2. What's my honest appetite instinct — do I over- or under-scope? Which direction do I need to correct?
3. Where does my marketing intuition help my product sense, and where does it mislead me?
4. Where did I default to visual craft instead of the harder thinking this week?
