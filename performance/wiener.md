# Wiener Mindset

> "Unstable feedback loops create oscillation, delay, and surprising failures."

**Category:** Performance | **Skill:** `/wiener`

## When to Use

- Systems oscillate under load
- Retry storms amplify incidents
- Autoscaling and queueing interact poorly

## Core Move

Map feedback loops, delays, and gain; tune for stability before peak throughput.

## Output Format

```
Control Loop Map:
  [signals, controller, actuator]

Instability Sources:
  [delay, overshoot, amplification]

Stability Fixes:
  [damping, bounds, cooldown, backpressure]
```

## Diagnostic Questions

- Where are the feedback loops in this system, and what is each one's delay?
- Can a sudden input spike cause the controller to overshoot and oscillate?
- Are retry policies amplifying failures instead of absorbing them?
- Does the autoscaler measure the right signal, or a lagging proxy?
- Is there a bounded cooldown between corrective actions?

## Anti-Patterns This Catches

- Retry storms that turn a partial outage into a full one
- Autoscalers reacting to stale metrics and overshooting capacity
- Alert-remediation loops that oscillate between over- and under-provisioning
- Missing backpressure allowing upstream load to saturate downstream services
- Gain settings tuned for average load that become unstable at the tail

## Pairs Well With

- **Taleb** — Wiener stabilizes the loop, Taleb caps the damage when stability fails
- **Meadows** — Wiener focuses on individual loops, Meadows maps how loops interact system-wide
- **Shannon** — Wiener tunes the control signal, Shannon ensures the signal carries enough information
- **Deming** — Wiener stabilizes technical feedback, Deming stabilizes organizational feedback

## When Not to Over-Apply

- The system has no meaningful feedback loop; it is a straight pipeline
- Latency is dominated by a single synchronous bottleneck, not oscillation
- The control mechanism is already well-damped and the issue lies elsewhere
