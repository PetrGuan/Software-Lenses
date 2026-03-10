# Sun Tzu Mindset

> "The supreme art of war is to subdue the enemy without fighting."

**Category:** Security | **Skill:** `/sun-tzu`

## When to Use

- A system handles user input, authentication, authorization, or sensitive data and has not been threat-modeled
- Security reviews are ad-hoc checklists rather than adversarial reasoning
- The team assumes "nobody would do that" instead of asking "what if someone did?"
- Trust boundaries are implicit or undefined — it's unclear where untrusted data enters the system
- A new feature expands the attack surface and nobody has mapped the exposure

## Core Move

Think like the attacker. For every entry point, ask: **who benefits from breaking this, what would they try, and what stops them?** Map the terrain (attack surface), identify the weakest positions (trust boundaries), and assess whether the defenses match the threats — not in theory, but in the actual code.

## Key Concepts

- **Terrain** — the attack surface: every endpoint, input field, file upload, API key, cookie, header, WebSocket, and queue message where external data enters
- **Trust boundaries** — the lines where data crosses from untrusted to trusted (or between different trust levels). Every boundary needs explicit validation
- **Asymmetry** — attackers need to find one weakness; defenders must protect everything. Design for asymmetric defense: assume breach, limit blast radius
- **Deception and intel** — what does your system reveal to an attacker? Error messages, timing, response codes, stack traces, enumeration patterns
- **Defense in depth** — no single control should be the only thing preventing compromise. Layer defenses so one failure doesn't mean total breach
- **Economy of force** — focus security effort on the highest-value targets, not uniform hardening of everything

## Diagnostic Questions

1. Where does untrusted input enter this system, and what validates it before it reaches business logic or storage?
2. What are the trust boundaries? Where does data cross from one trust level to another, and is the crossing explicitly guarded?
3. If an attacker controls [this input / this header / this parameter], what is the worst outcome? Can they escalate?
4. What does the system reveal to unauthenticated users? (Error details, user enumeration, timing differences, version info)
5. If one component is compromised, what else falls? How far does the blast radius extend?
6. Where do secrets live? (Env vars, config files, logs, URLs, client-side code) Could any of them leak?

## Output Format

```
Attack Surface Map
  [Entry points, inputs, and external interfaces — with file:line refs]

Trust Boundaries
  [Where data crosses trust levels, and whether crossings are guarded]

Threat Scenarios
  [Concrete attack paths: input → vulnerability → impact, ranked by severity]

Information Leakage
  [What the system reveals to attackers: errors, timing, enumeration]

Defense Assessment
  [Existing controls and where single points of failure exist]

Recommendations
  [Specific hardening actions, prioritized by risk and effort]
```

## Anti-Patterns This Catches

- **Implicit trust** — backend trusts frontend validation, service-to-service calls have no auth, internal APIs are "safe because they're internal"
- **Secrets in plain sight** — API keys in client bundles, tokens in URLs, passwords in logs, credentials in environment dumps
- **Verbose errors** — stack traces, SQL queries, or internal paths exposed to end users
- **Missing rate limits** — login, password reset, OTP, and API endpoints without throttling
- **Authorization gaps** — authentication exists but authorization is missing or inconsistent (IDOR, privilege escalation)
- **Single layer defense** — one check at the perimeter, nothing behind it

## Pairs Well With

- **Taleb** — Taleb maps fragility and tail risk; Sun Tzu maps adversarial exploitation of that fragility
- **Popper** — Popper falsifies claims; Sun Tzu falsifies security assumptions specifically
- **Hoare** — Hoare defines preconditions and invariants; Sun Tzu asks whether an attacker can violate them

## When Not to Over-Apply

- For internal tools with no external exposure and no sensitive data
- When the code is a pure computation with no I/O or user interaction
- When a professional security audit is already scheduled — don't substitute code review for penetration testing
