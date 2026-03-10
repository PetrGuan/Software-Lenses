# Heisenberg Mindset

> "What we observe is not nature itself, but nature exposed to our method of questioning."

**Category:** Performance | **Skill:** `/heisenberg`

## When to Use

- Production incidents take too long to diagnose because logs, metrics, or traces are missing or misleading
- Instrumentation has been added ad-hoc and nobody has a coherent observability strategy
- Monitoring overhead is high enough to affect the system it's measuring
- Teams confuse metrics presence with actual understanding — dashboards exist but don't answer real questions
- Debug logging in production creates performance or storage problems
- Sampling, aggregation, or caching in the telemetry pipeline hides real issues

## Core Move

Apply the observer effect to software: **every measurement changes what you measure.** Audit what you can actually know about the system in production, what your instrumentation hides or distorts, and where the cost of observing exceeds the value of the observation. Then design instrumentation that answers the questions you'll actually ask during an incident.

## Key Concepts

- **Observer effect** — adding logging, tracing, or metrics changes performance characteristics, memory usage, and timing behavior. Instrumentation is never free
- **Uncertainty trade-offs** — you can measure request rate precisely or trace individual requests in detail, but doing both at full fidelity creates prohibitive overhead. Choose what matters
- **Measurement collapse** — aggregation destroys information. A p50/p99 summary hides the individual requests that matter. Averages lie. Histograms lose outlier detail
- **Instrumentation debt** — stale alerts, orphaned dashboards, metrics nobody checks, log lines nobody reads. Observability rots just like code
- **Heisenbug** — bugs that disappear when you try to observe them (timing-sensitive races masked by debugger overhead, log-statement side effects)
- **Dark state** — system state that exists but has no observability path to the outside. If you can't see it, you can't debug it

## Diagnostic Questions

1. If this system fails at 3 AM, what would the on-call engineer see first? Is it enough to start diagnosis without reading source code?
2. What is the overhead of current instrumentation? (CPU, memory, I/O, latency added by logging/tracing/metrics)
3. Where does aggregation destroy the signal you'd need during an incident? (e.g., averages hiding bimodal latency, sampled traces missing the slow path)
4. Which parts of the system are "dark" — state transitions, queues, caches, or background jobs with no observability?
5. Are there Heisenbugs — issues that only appear without debug logging, or races that a debugger's timing masks?
6. How much of the existing instrumentation is stale? (Dashboards nobody opens, alerts nobody responds to, log lines nobody greps for)

## Output Format

```
Observability Map
  [What is currently instrumented: logs, metrics, traces — with file:line refs]

Dark State
  [System state with no observability path — queues, caches, background jobs, internal buffers]

Observer Effect Costs
  [Performance and resource overhead of current instrumentation]

Measurement Collapse
  [Where aggregation, sampling, or summarization hides critical detail]

Instrumentation Debt
  [Stale alerts, orphaned dashboards, unused log lines, misleading metrics]

Recommendations
  [What to add, remove, or restructure — with incident-diagnosis scenarios]
```

## Anti-Patterns This Catches

- **Dashboard theater** — dozens of panels that look impressive but don't answer "why is this broken?"
- **Log spam** — every function logs entry/exit at INFO level, burying errors in noise and costing storage
- **Aggregation blindness** — reporting p50 latency when the problem is a bimodal distribution with a hidden slow path
- **Orphaned alerts** — alerts that fire so often they're ignored, or that monitor conditions no longer relevant
- **Expensive tracing** — full distributed tracing on every request in production, adding 10-20% latency overhead
- **Dark queues** — background job queues with no visibility into depth, processing time, or failure rate

## Pairs Well With

- **Shannon** — Shannon traces information flow; Heisenberg asks whether your observability captures that flow without distorting it
- **Wiener** — Wiener designs feedback loops; Heisenberg ensures the measurement feeding those loops is accurate and affordable
- **Taleb** — Taleb identifies tail risks; Heisenberg asks whether you'd actually detect them with current monitoring

## When Not to Over-Apply

- For development environments where full logging overhead is acceptable
- When the system is simple enough that a few log lines provide complete visibility
- When optimizing observability costs before the system has meaningful production traffic
