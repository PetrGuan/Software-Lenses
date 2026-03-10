# Wittgenstein Mindset

> "The limits of my language mean the limits of my world."

**Category:** Debugging | **Skill:** `/wittgenstein`

## When to Use

- Variable names, function names, or module names mislead readers about what the code actually does
- The same concept has different names in different parts of the system (or different concepts share the same name)
- Domain experts and developers talk past each other because the code uses different vocabulary than the business
- Refactoring feels impossible because nobody agrees on what things are called
- Bug reports are hard to trace because the terminology in logs, errors, and code don't match

## Core Move

Treat naming as a design decision with the same weight as architecture. Audit the **language games** in the code: what words are used, what they mean *in context*, whether those meanings are consistent, and where mismatched vocabulary creates real confusion that causes bugs or blocks understanding.

## Key Concepts

- **Language game** — a word's meaning is its use in a specific context. `user` in auth code, billing code, and analytics code may mean three different things
- **Family resemblance** — concepts that share a name but have no single common definition (e.g., `handle`, `process`, `manager`, `service`)
- **Private language problem** — names that only make sense to the original author, variable names like `tmp2`, `data`, `result`, `val`
- **Meaning drift** — when a name was accurate at creation but the code has changed while the name stayed
- **Ubiquitous language** — the shared vocabulary between domain and code that eliminates translation errors

## Diagnostic Questions

1. Can a new team member read this function name and correctly predict what it does without reading the implementation?
2. Where does the same word mean different things in different modules? (e.g., `user`, `account`, `event`, `item`)
3. Where do different words refer to the same concept? (e.g., `client`/`customer`/`user`/`account` all meaning the same entity)
4. Do the names in the code match what domain experts call things in conversation?
5. Which names have drifted — they were accurate once but the code has changed and the name no longer fits?
6. Are there "private language" names that only make sense with tribal knowledge? (abbreviated, inside-joke, or historical names)

## Output Format

```
Vocabulary Map
  [Key terms in the code and what they actually mean in context]

Naming Collisions
  [Same word, different meanings across modules — with file:line refs]

Naming Synonyms
  [Different words for the same concept — with file:line refs]

Meaning Drift
  [Names that no longer match their implementation — with file:line refs]

Private Language
  [Names requiring tribal knowledge to understand — with file:line refs]

Recommendations
  [Specific renames, glossary entries, or ubiquitous language proposals]
```

## Anti-Patterns This Catches

- **Homonyms** — `Event` means a DOM event in the frontend, a domain event in the backend, and a calendar event in the data model
- **Synonyms** — `customer`, `client`, `user`, `account` all refer to the same entity across different services
- **Meaningless generics** — `data`, `info`, `result`, `item`, `thing`, `obj`, `val`, `tmp`, `handler`, `manager`, `service`, `utils`
- **Abbreviation hell** — `usrAcctMgr`, `txnProcSvc`, `cmpCalcHlpr` — inscrutable without a decoder ring
- **Stale names** — function called `validateEmail` that now validates phone numbers too
- **Domain-code gap** — business says "subscription" but code says "recurring_payment_plan"

## Pairs Well With

- **Feynman** — Feynman strips jargon to expose confusion; Wittgenstein rebuilds vocabulary to prevent future confusion
- **Grothendieck** — Grothendieck lifts structure into abstractions; Wittgenstein ensures the abstractions are named in a way that carries meaning
- **Liskov** — Liskov audits behavioral contracts; Wittgenstein audits whether the names of those contracts promise what they deliver

## When Not to Over-Apply

- For throwaway scripts or prototypes where naming polish wastes time
- When the existing names are well-understood by the team and renaming would create churn without benefit
- When the real problem is structural, not linguistic — bad names are sometimes a symptom, not the root cause
