# Lovelace Mindset

> "The Analytical Engine weaves algebraic patterns just as the Jacquard loom weaves flowers and leaves."

**Category:** Architecture | **Skill:** `/lovelace`

## When to Use

- An API or interface is technically correct but painful to use — callers struggle despite good documentation
- Error messages are written for the developer who threw them, not the user who receives them
- The gap between what users think the system does and what it actually does causes repeated misuse
- Configuration requires reading source code because the config surface doesn't express intent clearly
- Developer experience (DX) is an afterthought — onboarding is slow, debugging is painful, common tasks require obscure incantations

## Core Move

Bridge the gap between **human intent** and **machine execution.** Lovelace saw that computing is fundamentally about *translation* — turning what humans want into what machines can do. Audit every interface (API, CLI, config, UI, error message) for how well it translates between human mental models and system behavior. Where the translation is lossy, confusing, or requires insider knowledge, fix the interface — not the human.

## Key Concepts

- **Translation fidelity** — how well does the interface translate human intent into correct system behavior? Low fidelity means users must learn the machine's model instead of expressing their own
- **Affordance** — does the interface suggest how to use it correctly? Good APIs make the right thing easy and the wrong thing hard
- **Error as conversation** — error messages are not just diagnostics; they're the system's side of a dialogue. They should say what went wrong, why, and what to do next
- **Progressive disclosure** — simple things should be simple; complex things should be possible. Don't front-load every option
- **Cognitive load budget** — every parameter, flag, mode, and option costs the user attention. Spend that budget on what matters
- **Pit of success** — design interfaces so that the most natural usage path leads to correct behavior

## Diagnostic Questions

1. Can a new user accomplish the most common task without reading documentation? What's the minimum path?
2. When this interface returns an error, does the message tell the user what to do next — or just what went wrong internally?
3. How many concepts must a user understand before they can use this API correctly? Could any of them be hidden behind defaults?
4. Where do users consistently misuse this interface? Is the interface at fault, or the documentation?
5. Does the configuration surface express *intent* (what do you want?) or *mechanism* (how should the system do it)?
6. If you watch someone use this interface for the first time, where do they hesitate, backtrack, or ask for help?

## Output Format

```
Interface Inventory
  [APIs, CLIs, config surfaces, error messages — with file:line refs]

Translation Gaps
  [Where human intent maps poorly to system behavior — specific mismatches]

Error Quality Audit
  [Error messages that fail to guide the user toward resolution]

Cognitive Load Assessment
  [Unnecessary parameters, confusing defaults, missing progressive disclosure]

Pit of Success Analysis
  [Whether the easiest usage path leads to correct or incorrect behavior]

Recommendations
  [Specific changes to improve translation fidelity — defaults, naming, errors, examples]
```

## Anti-Patterns This Catches

- **Expert-only APIs** — every call requires 5 parameters, 3 of which have non-obvious correct values
- **Cryptic errors** — `Error: EINVAL`, `null is not an object`, `unexpected token at position 0` — with no context or recovery guidance
- **Configuration sprawl** — 200 config keys, most of which should be invisible defaults
- **Inverted mental model** — the user thinks in terms of "send a message" but the API requires "create a channel, acquire a lock, enqueue a payload, flush the buffer"
- **Documentation as crutch** — the interface is broken but the docs explain the workarounds
- **Hostile defaults** — default behavior that surprises, deletes data, or silently drops input

## Pairs Well With

- **Feynman** — Feynman explains the system clearly; Lovelace ensures the system explains *itself* clearly to its users
- **Wittgenstein** — Wittgenstein audits naming and language; Lovelace audits whether that language bridges the human-machine translation gap
- **Liskov** — Liskov checks behavioral contracts between components; Lovelace checks behavioral contracts between humans and machines

## When Not to Over-Apply

- For internal implementation details not exposed as interfaces
- When the interface is a low-level building block intentionally designed for expert users
- When the users are machines (internal service-to-service APIs where DX is less relevant than correctness)
