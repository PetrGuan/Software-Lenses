# Lamport Mindset

> "Distributed correctness depends on ordering assumptions you can prove."

**Category:** Architecture | **Skill:** `/lamport`

## When to Use

- Cross-service events arrive out of order
- Idempotency and retries are inconsistent
- Concurrency bugs are hard to reproduce

## Core Move

Model event order explicitly and validate safety under reordering, retries, and partial failure.

## Output Format

```
Ordering Model:
  [happens-before assumptions]

Race Conditions:
  [where assumptions fail]

Safety Mechanisms:
  [idempotency keys, sequence checks, versioning]
```

## Diagnostic Questions

- What ordering assumptions does this flow depend on, and are any of them implicit?
- What happens if the same message is delivered twice, or never delivered at all?
- Can two concurrent operations on the same resource produce an inconsistent final state?
- Are there clock-dependent comparisons that would fail under skew or drift?
- If a downstream service is slow or partitioned, does the caller block, retry, or proceed with stale data?

## Anti-Patterns This Catches

- Flows that assume network calls arrive in the order they were sent
- Retry logic without idempotency keys, causing duplicate side effects
- Read-modify-write cycles with no concurrency guard (optimistic or pessimistic)
- Distributed transactions that silently lose writes under partial failure
- Timestamp-based ordering that breaks across machines or time zones

## Pairs Well With

- **Hoare** — Lamport models ordering across nodes, Hoare specifies the contract each node must satisfy locally
- **Taleb** — Lamport identifies where ordering assumptions fail, Taleb stress-tests what happens when they do
- **Shannon** — Lamport tracks event order, Shannon tracks where information is lost or corrupted in transit
- **Heisenberg** — Lamport exposes hidden concurrency assumptions, Heisenberg flags where observation changes system behavior

## When Not to Over-Apply

- The system is single-threaded and single-process with no external I/O
- The concurrency model is already well-proven and the task is a local change within it
- Over-modeling ordering for simple CRUD operations adds complexity without safety
- The team is not yet ready to reason about distributed invariants and simpler patterns suffice
