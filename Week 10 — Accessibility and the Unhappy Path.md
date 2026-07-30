---
tags: [product-design, course, week, phase/professional]
week: 10
phase: Professional Layer
---

# Week 10 — Accessibility and the Unhappy Path

> **The week's thesis:** The difference between a design that demos well and a design that ships is entirely in the parts nobody screenshots — the error, the empty, the offline, the keyboard, the screen reader, the null field. This week is about the 80% of a real product that lives outside the happy path.

**Studio:** [[03 The Studios|Studio C]] — state and edge-case matrix on Day 6.
← [[Week 09 — Motion, Latency and Time]] · next → [[Week 11 — Designing AI Products]]

---

## Day 1 — Accessibility as a design constraint, not a compliance task

### CONCEPT

The framing most teams use — accessibility as a checklist applied at the end, owned by engineering, driven by legal risk — produces bad, expensive, retrofitted results. The framing that works is:

> **Accessibility is a set of design constraints, like performance or screen size, that make the product better for everyone when handled early and worse for everyone when handled late.**

**Why "for everyone" is literal, not rhetorical.** Every accessibility accommodation has a large temporary and situational population:

| Permanent | Temporary | Situational |
|---|---|---|
| Blind | Eye surgery recovery | Bright sunlight on a phone screen |
| Deaf | Ear infection | Loud train, or watching without sound |
| One arm | Broken arm | Carrying a coffee, holding a baby |
| Motor tremor | Medication side effect | On a bus, walking, cold hands |
| Cognitive disability | Concussion | Exhausted, stressed, distracted, drunk |

The situational column is *everyone, frequently*. Captions were built for deaf users and are now used by a large majority of viewers. Curb cuts were built for wheelchairs and are used by anyone with a suitcase, a pram, or a bike. **This is the argument that wins in a meeting**, and it happens to also be true.

**The four principles (POUR), which is the structure of WCAG:**

- **Perceivable** — can they sense it? (Contrast, text alternatives, captions, not-colour-alone)
- **Operable** — can they use it? (Keyboard, target size, time limits, no seizure triggers)
- **Understandable** — can they comprehend it? (Clear language, predictable behaviour, helpful errors)
- **Robust** — does it work with their tools? (Semantic markup, assistive technology compatibility)

**What's genuinely the designer's job**, as opposed to engineering's:

1. **Contrast and non-colour encoding** — entirely yours, decided at design time
2. **Focus order and focus states** — yours, and almost always missing from design files
3. **Target sizes** — yours (44×44pt is the common minimum; WCAG 2.2 sets 24×24 CSS px as a floor with exceptions)
4. **Content and error language** — yours
5. **Heading structure and semantics** — yours to specify, engineering's to implement. If you don't specify it, it will be wrong.
6. **Alternative text intent** — yours to write, because it depends on the *purpose* of the image in context, which only you know
7. **Reduced motion variants** — yours (Week 9)

**The cost argument, which you should have ready:** retrofitting accessibility is estimated to cost many times more than building it in, because it frequently requires structural change — a colour system that fails contrast has to be rebuilt, not tweaked. Designing accessibly costs approximately nothing extra *if the constraints are present from the first colour decision*.

**A specific note for you:** your visual craft training optimises for aesthetic subtlety — low-contrast secondary text, thin weights, delicate greys. Nearly all of this fails WCAG. That tension is real and it isn't resolved by ignoring it: it's resolved by finding the design that is *both*, which is a genuinely more interesting constraint problem than designing without the constraint. The best accessible interfaces are not visually compromised; they're visually *disciplined*.

### SOURCE
[WCAG 2.2 at a Glance](https://www.w3.org/WAI/standards-guidelines/wcag/glance/) for the structure, then the [W3C's Accessibility Fundamentals](https://www.w3.org/WAI/fundamentals/). Microsoft's Inclusive Design toolkit is the source of the permanent/temporary/situational framing.

### DRILL
Take your Studio B screens. Run a contrast check on every text and UI element (Stark, or Figma's built-in checks). Count the failures. Then fix them **without** abandoning your visual intent — find the version that's both. Note which ones forced a genuine compromise and which were just laziness.

---

## Day 2 — WCAG in practice: contrast, focus, target size, semantics

### CONCEPT

The specific, checkable things. Learn these numbers; they come up constantly.

**Contrast ratios (WCAG 2.x AA — the standard almost everyone is held to):**

| Element | Minimum ratio |
|---|---|
| Body text | **4.5:1** |
| Large text (≥18pt, or ≥14pt bold) | **3:1** |
| UI components and graphical objects (icons, borders, focus rings, chart elements) | **3:1** |
| AAA body text (higher bar, rarely required) | 7:1 |

The third row is the one designers most often miss: **a button's border, an input's outline, an icon carrying meaning, and a chart's series colours all need 3:1 against their background.** A beautiful 1px hairline border at 1.8:1 is a failure, and it's everywhere.

**Focus indicators.** Every interactive element needs a visible focus state, and it must have 3:1 contrast against the adjacent background. Rules:
- **Never `outline: none` without a replacement.** This is the single most common accessibility crime on the web.
- The indicator must be visible against *every* background it can appear on — including your dark mode, and including when the element is on a coloured surface.
- **Design focus states explicitly in your component library.** If they're not in the Figma file, they will be browser-default or absent.
- Focus and hover are *different states* and should look different. Hover is "you could click this"; focus is "this is where keyboard input goes."

**Target size.** WCAG 2.2 sets a minimum of 24×24 CSS px (with exceptions for inline links and spacing-based alternatives). Platform guidance is more generous and more useful: **44×44pt (iOS) / 48×48dp (Android)**. Design to the platform numbers. Remember from Week 2: the target is the *hit area*, not the visual — a 16px icon with a 44px hit area is compliant and looks right.

**Text and zoom.** Text must reflow at 200% zoom without horizontal scrolling. Never disable pinch-zoom on mobile. Avoid text in images.

**Semantics — what you must specify:**
- **Heading hierarchy** — one h1, properly nested, no level-skipping. Headings are how screen reader users navigate a page; a page with visually-styled divs instead of headings is unnavigable.
- **Landmark regions** — nav, main, header, footer, aside
- **Labels on every input** — a placeholder is not a label. Placeholders disappear on focus, fail contrast, and aren't read reliably. This is worth being firm about.
- **Buttons vs links** — buttons *do* things, links *go* places. Getting this wrong breaks keyboard expectations (space vs enter) and screen reader announcements.
- **Error association** — the error message must be programmatically tied to its field, not just visually near it.

**Non-colour encoding**, again because it's the most-violated: every status, every chart series, every required field, every validation state needs a second channel — icon, text, pattern, position, weight.

### SOURCE
[WCAG 2.2 quick reference](https://www.w3.org/WAI/WCAG22/quickref/) — filter to Level AA. Dense but it's the actual standard. Then [Inclusive Components](https://inclusive-components.design/) for how these constraints shape real component design.

### DRILL
Take three components from your Studio B system. For each, add: a designed focus state meeting 3:1, verified target sizes, non-colour encoding for any status, and the specified semantics (element type, label association, error association). Document these in the component's spec — they are part of the API.

---

## Day 3 — Keyboard, screen readers and the invisible interface

### CONCEPT

There's a second interface to everything you design, and you almost certainly haven't experienced it.

**Keyboard operability.** Every interactive element must be reachable and operable by keyboard alone. What you design:

- **Focus order** — follows visual/logical reading order. Breaks when DOM order diverges from visual order (very common with CSS grid and absolute positioning), which is why *you* must specify intended order rather than assuming.
- **Focus management on state change** — this is the subtle, important one. When a modal opens, focus must move *into* it, be *trapped* inside it, and return to the trigger on close. When content loads, focus must go somewhere sensible. When an item is deleted, focus must not be orphaned. **Nobody designs this, and it's the difference between a keyboard-usable product and an unusable one.**
- **Skip links** — "skip to main content," so keyboard users don't tab through 40 nav items on every page.
- **Escape closes things.** Universally expected. Free to implement. Frequently missing.
- **No keyboard traps** — you must be able to tab *out* of everything.

**Screen readers — what you need to understand as a designer.** You don't need to be an expert. You need to know that:

- A screen reader user experiences your page **linearly and by structure** — they jump by heading, landmark, link, and form control. Visual layout is invisible to them; *structure* is everything, which is why heading hierarchy is a design decision.
- **Everything meaningful must be announced.** An icon-only button with no accessible name is announced as "button." A status change that appears visually with no live region is silent.
- **Order of announcement matters.** A label after its input is announced after it, which is useless.
- **Visual grouping is not announced.** Your beautifully grouped card means nothing unless the grouping is semantic.

**Alt text, properly.** The rule is *purpose*, not description:
- **Informative image** → describe the information it carries, concisely
- **Decorative image** → empty alt (`alt=""`), so it's skipped entirely. Marking decorative images as decorative is as important as describing informative ones.
- **Functional image** (an icon that's a button) → describe the *action*, not the picture. "Delete," not "trash can icon."
- **Complex image** (a chart) → short alt plus a longer description or a data table nearby

Writing alt text is a *design* task because only you know what the image is doing in context. The same photograph needs different alt text on a product page and in an article.

**The exercise that actually changes people.** Turn on VoiceOver (Cmd+F5 on Mac) or NVDA (free, Windows) and try to use a product you designed. Fifteen minutes of this teaches more than any amount of reading. It will be frustrating and slow, and the frustration is the information — that's the product you shipped.

### SOURCE
[WebAIM's screen reader guide](https://webaim.org/articles/screenreader_testing/) and their keyboard accessibility material. Then actually turn one on.

### DRILL
**Two parts, both required.**
1. Unplug your mouse. Use a product you designed, keyboard only, for 15 minutes. Note every place you get stuck, lose focus, or can't tell where you are.
2. Turn on a screen reader. Try one flow. 15 minutes. Note what's silent, what's announced wrongly, what's out of order.

Then specify focus order and focus management for your Studio B modal or overlay.

---

## Day 4 — Empty, loading, error, partial, offline: the five states you forget

### CONCEPT

Week 6 introduced the state matrix. This day is about designing the cells well, because designing them badly is worse than the matrix suggests.

**Empty states — the highest-leverage screen in your product.** Three genuinely different kinds, and shipping one message for all three is the most common mistake in software:

| Kind | The user's situation | What the screen must do |
|---|---|---|
| **First-run** | Has nothing, doesn't know how it works | **Teach the conceptual model** and offer the first action. Show what a filled state looks like. This is your best teaching moment and it's almost always wasted on "No items yet." |
| **User-emptied** | Had things, cleared them | Acknowledge the achievement or the action. "Inbox zero" not "No messages." Offer the undo if recent. |
| **Filtered to nothing** | Has things, the filter excludes them | Say what filter is excluding them, and offer to clear it. Never suggest creating something. |

If you design nothing else well this week, design first-run empty states. They carry the entire onboarding burden in most products and they're usually an afterthought.

**Error states.** Three requirements, and most errors meet zero:
1. **Say what happened**, in plain language, from the user's perspective — not the system's
2. **Say why**, if it helps them fix it
3. **Say what to do next**, with the action available right there

> ✗ "Error: request failed (500)"
> ✗ "Something went wrong. Please try again."
> ✓ "We couldn't save your changes — the connection dropped. Your work is stored locally. **[Retry]**"

Also: **never lose the user's input.** A form that clears on error is a hostile act. And place errors **inline, at the field**, not in a summary at the top — a summary requires the user to map from message to field, which is a working-memory task you've created for no reason.

**Partial states.** Some data loaded, some failed. Increasingly common with multiple data sources. The design question is: **show partial data with a clear marker of what's missing, or show nothing?** Usually the former, but *only if the incompleteness is unmistakable* — partial data that looks complete is worse than an error, because the user makes decisions on it.

**Offline and degraded.** What still works? What's queued? What's lost? The best offline designs make the boundary *visible and predictable* rather than pretending nothing changed, because a product that silently fails to save is a product that loses trust permanently in a single incident.

**Success states.** The forgotten one. Did it work? Users need confirmation proportionate to the stakes (Week 3, Day 3). A saved draft needs a whisper; a submitted tax return needs a receipt.

**A useful stance for a design review:** ask "what does this look like when it's empty, and when it's broken?" It's the fastest way to find out whether a design is finished, and it works on other people's work as well as your own.

### SOURCE
[Shopify Polaris](https://polaris.shopify.com/) on empty states and error messaging — best-in-class. Then NN/g's error message guidelines.

### DRILL
Design **all three empty states** and **three error states** for Studio C, properly. Each error must meet all three requirements. Then take one error state from a product you use, judge it against the three requirements, and rewrite it.

---

## Day 5 — Content design: writing as an interface material

### CONCEPT

Interface text is not decoration applied to a design — **it is the design**. A button's label does more work than its colour. A confirmation dialog is 90% words. An empty state is entirely words. And yet most designers treat copy as something to fill in later, or hand to marketing.

**Given your background this is a genuine advantage.** You've written marketing copy, which means you can write. The transfer problem is that **marketing copy persuades and interface copy clarifies**, and the register is completely different. Marketing copy earns attention; interface copy respects that attention has already been given and should be spent on the task.

**The principles:**

**1. Clear over clever, always.** A pun in a button label costs comprehension on every use. Marketing rewards distinctiveness; interfaces reward predictability (Jakob's Law again).

**2. Use the user's words.** From your interviews. Grep your transcripts. Internal vocabulary ("entities," "workspaces," "assets") should be translated at the boundary.

**3. Front-load the meaningful words.** People scan; they read the first 2–3 words of a line and decide. "Delete project" not "Are you sure you want to delete this project?" — as a *heading*.

**4. Buttons state the action, not the response.** ✗ "OK / Cancel." ✓ "Delete project / Keep it." Users click without reading dialogs (Week 2 — slips). A verb-labelled button is the last line of defence.

**5. Second person, active voice, present tense.** "You'll get a receipt" not "A receipt will be sent to the user."

**6. Sentence case for UI.** Easier to scan than Title Case, and doesn't shout. Nearly every major system has converged on this.

**7. Numbers as numerals.** "3 items" not "three items" — numerals are pre-attentively distinct from text and scan faster.

**8. Say what happens, not what the system does.** "Your file is saved" (user's world) not "Save operation completed successfully" (system's world). This is heuristic 2 from Week 3.

**The microcopy that carries the most weight**, in order:
- **Button labels** — the highest-stakes words in your product
- **Error messages** — see yesterday
- **Empty states** — where the conceptual model is taught
- **Field labels and helper text** — where errors are prevented
- **Confirmation dialogs** — where irreversible things happen
- **Permission requests** — where trust is won or lost

**The exercise that improves copy fastest: read it aloud.** Interface text that sounds strange spoken is text that reads as strange. This catches passive voice, jargon, and false politeness immediately.

**Using AI for interface copy**, since it's directly relevant: models are very good at generating twenty label variations, at flagging inconsistent terminology across a product, and at rewriting system-voice into user-voice. They're weak at knowing your users' actual vocabulary — which is why the transcripts from Week 5 are the input that makes the output good. Feed the model your users' words, not just your intent.

### SOURCE
Torrey Podmajersky, *Strategic Writing for UX*. Free: [Polaris content guidelines](https://polaris.shopify.com/content) — genuinely the best public writing on this, and the [Material writing guidance](https://m3.material.io/).

### DRILL
Take every piece of text in one Studio C screen — every label, button, heading, helper, error. Rewrite all of it against the eight principles. Read it aloud. Then do the same for a confirmation dialog in a product you use, and note how much better the verb-labelled version is.

---

## Day 6 — Studio C: state and edge-case matrix

### DRILL — Deliverable C3

Build the **complete state and edge-case matrix** for your AI feature. This is more demanding than Week 6's, because AI features have states conventional software doesn't.

**The AI-specific state dimensions to include, alongside the standard ones:**

```
idle · prompted · thinking · streaming · complete
stopped-by-user · refused · errored · timed-out
low-confidence · partially-wrong · out-of-scope · stale-context
rate-limited · degraded-model
```

**Requirements:**

- [ ] Full matrix: every screen × every state, standard and AI-specific
- [ ] Every `—` justified in one line
- [ ] **All three empty states designed** (first-run, user-emptied, filtered)
- [ ] **Three error states designed** meeting all three requirements from Day 4
- [ ] **The "confidently wrong" screen designed** — this is the most important artifact in the whole studio
- [ ] Accessibility spec for every designed screen: contrast verified, focus order specified, focus management on state change, non-colour encoding, target sizes
- [ ] All interface copy written and read aloud
- [ ] Reduced-motion variants noted

*Time check: matrix ~40 min, screens ~80 min. This is a long day.*

> `/product-design-course critique C3` — ask me to specifically attack the "confidently wrong" case and the focus management. Those are where AI design work is usually thinnest.

---

## Week 10 self-check

1. What broke when I used my own work with a keyboard only?
2. How many contrast failures did I have, and how many were laziness rather than genuine tension?
3. Which of my three empty states was I about to ship as one generic message?
4. Where did I default to visual craft instead of the harder thinking this week?
