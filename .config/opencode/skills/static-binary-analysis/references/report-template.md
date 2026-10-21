# Static analysis report — <sample>

## Outcome
- Assessment and confidence:
- Coverage conclusion (not a safety guarantee):
- Known behavior:
- Most consequential unknowns:
- Static-only boundary observed / any deviations:

## Identity and scope
| Artifact | Path | Size | SHA-256 | Provenance/parent and extraction recipe |
|---|---|---:|---|---|

Format, architecture, image base, entrypoints, tool versions, analysis limits.

## Reconstructed logic
Entry → initialization → prerequisites → main loop/dispatcher → handlers → exits.
Include pseudocode or a diagram and important evidence addresses. Explain failures,
alternate entrypoints, callbacks, concurrent behavior and cleanup.

## Coverage ledger
| Component / address range | Status | Inputs → transformation → outputs | Side effects / callees | Evidence | Gaps / assumptions |
|---|---|---|---|---|---|

Allowed statuses: mapped, partially mapped, unresolved, blocked by missing input,
identified runtime, proven unreachable under stated assumptions.

## Evidence and capabilities
| Claim | Fact / proved / inference / unknown | Reachable path and evidence | Conditions / confidence | Counterevidence / limits |
|---|---|---|---|---|

Cover persistence, collection, execution, privilege, network, destructive operations
and environment checks even when the finding is “not identified within coverage.”
Record decoys separately from confirmed behavior.

## Data, protocols and external code
Endpoints (do not contact), frame layout, commands, cipher/checksum/state rules,
payload provenance, loader contract, verification and execution triggers.
Identify which computation exists only in missing runtime inputs.

## Obfuscation and validation
Transforms recovered, assumptions, proof obligations/results, unsupported semantics,
manual cross-checks and test results. Distinguish reference-code consistency from
agreement with target instructions and from actual target behavior (not measured).

## Open questions
| Priority | Unknown | Risk/logic impact | Static approaches attempted | Exact artifact/tool needed | Next static action |
|---|---|---|---|---|---|

## Dynamic-risk handoff — plan only, not authorization
| Hazard / trigger | Predicted effect | Evidence / uncertainty | Required containment | Planned observations / abort criteria |
|---|---|---|---|---|

- Decision: defer / conditional proposal / no-go in available environment.
- Expected startup, early exits and required dependencies:
- Possible file/process/network/device effects:
- External payload and privilege risks:
- Isolation, egress controls, device sharing restrictions and recovery requirements:
- Observations needed to test hypotheses (not results):
- Residual risks that cannot be eliminated by static analysis:
- Conditions that must be satisfied before separately authorized dynamic work:

## Reproduction and artifacts
Safe static commands/scripts, dependencies and hashes; locations of flow graphs,
decoded data and pure reference implementations. No automatic execution recipe
for the sample, payloads or extracted code.
