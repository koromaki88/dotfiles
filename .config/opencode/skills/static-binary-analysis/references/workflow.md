# Deep static workflow

## 1. Scope, environment and evidence hygiene

- Locate applicable workspace instructions. Confirm requested sample(s), intended
  depth and static-only scope; ask only when ambiguity blocks safe progress.
- Record original path, size, SHA-256, provenance if supplied, and collection
  context. Hash derived files separately and track their source offsets and
  decoding steps. Never overwrite the original or unrelated analyst work.
- Inventory available tools before installing anything. Prefer existing trusted
  tools; if dependencies are missing, explain their purpose and installation
  scope. Respect network/approval policy, pin/report versions, and use an isolated
  environment rather than globally modifying the host.
- Suitable tools include file identification, bounded strings/hex extraction,
  PE/ELF/Mach-O parsers, objdump/readelf, Capstone and Ghidra static analysis.
  Use only static features; inspect tool scripts and disable risky auto-loading.
  Tool installation is distinct from contacting sample infrastructure.
- Store tool commands, assumptions and evidence locally. Do not invent addresses,
  outputs, signature validity or hashes. Separate VA/RVA/file offsets and record
  image base and endianness. Use bounded parsing and extraction to avoid bombs.

## 2. Structural inventory

Identify actual format rather than trusting the extension. For containers and
embedded objects, recurse with explicit depth, total-size and object-count caps.

Inspect applicable structures:

- Architecture, ABI, subsystem, loader/interpreter, dependencies and relocations.
- Entrypoint, constructors, TLS callbacks, exported entrypoints, exception handlers,
  lifecycle hooks, destructors and alternative startup routes.
- Section/segment permissions, executable data, gaps, overlaps, overlays, resources,
  debug information, symbols, manifests, certificate data and unusual headers.
- Imports, delay imports, exports, API hash tables, runtime resolution, syscalls.
- Packing/obfuscation indicators and entropy as leads, not verdicts. Identify how
  unpacked/generated code would be produced without executing the unpacker.
- Signature presence versus cryptographically validated status versus trust.
  Timestamps and compiler fingerprints are clues, not reliable attribution.

## 3. Reachability and logic reconstruction

Build a component-level call graph and an entry-to-exit narrative. For each
component record purpose, callers/callees, inputs, outputs, mutable state, side
effects, error handling and evidence addresses.

Trace:

- Initialization order and all early-exit/environment prerequisites.
- Main loops, state transitions, command dispatchers, parsers, handlers and cleanup.
- Indirect calls, function-pointer tables, callbacks, virtual methods, dynamically
  loaded exports and hidden API resolution. Mark unknown targets explicitly.
- Threads, synchronization, asynchronous work, exception-triggered branches and
  signal/event handlers. Do not infer a single-threaded model without evidence.
- Success/failure exit codes, retries, timeouts, partial reads/writes and length
  validation. A silent exit may be an unmet environment gate, not benign behavior.

Do not trust decompiler types or function boundaries blindly. Recheck instruction
alignment, calling convention, register widths, sign/zero extension, truncation,
pointer arithmetic, stack aliases, globals, volatile/MMIO reads and call clobbers.
Retain memory effects conservatively: address-taken buffers and callback writes
can be externally observable even when scalar-variable liveness says otherwise.

## 4. Inputs, outputs and capability tracing

Enumerate inputs from argv, environment, files, registry, network, IPC, devices,
embedded config, clocks/randomness and downloaded components. Follow them to:

- Filesystem changes/deletion/encryption and removable/network locations.
- Registry, startup folders, services, scheduled tasks and other persistence.
- Processes, shells, script engines, injection and executable-memory changes.
- Credential sources, user data, screenshots, keyboard hooks and collection.
- Privilege changes, drivers, kernel interfaces and security-setting changes.
- Network and IPC endpoints, listeners, peer authentication and exfiltration.
- CPU/GPU/accelerator programs and their source/provenance and launch contracts.

For each claim, trace a reachable path and relevant arguments; a suspicious string
or imported API is not proof. Also search for capabilities hidden behind dynamic
resolution instead of assuming the import table is exhaustive.

For protocols, recover field offsets, widths, endianness, framing, maxima,
checksums/authentication, compression/encryption order, key/nonce derivation,
directional state, reset rules, command types and response/error behavior. Distinguish
TCP stream framing from packets. Do not label custom crypto as a standard algorithm
because of a familiar constant. Do not implement a live client as part of this work.

For payloads, distinguish embedded, locally read, generated and peer-supplied code.
Determine format, verification, loader, permissions and execution trigger. If an
external input is missing, document the host contract, size limits and trust boundary;
request a captured artifact rather than fetching or loading it.

## 5. Obfuscation and analyst automation

- Decode strings/configs into inert files with offset/address provenance.
- Identify arithmetic-noise state, opaque predicates, flattened dispatchers,
  dead branches, decoy strings, packing and generated/self-modifying code.
- For every constant-state assumption, inspect initializers, constructors,
  potential indirect/aliased writes, threads and callbacks. “No direct writes”
  alone does not prove immutable state. Retain alternatives when not established.
- Lift narrowly scoped instruction subsets. Fail closed on unknown semantics;
  preserve widths, aliasing, flags, ABI clobbers and memory effects. Mark artifacts
  provisional when the lifter does not model these soundly.
- Prove arithmetic rewrites with bit-vector SMT where useful. Record widths,
  constraints and timeout results: `unknown` is not a proof. Local equivalence
  does not establish reachability or whole-program correctness.
- Cross-check summaries against raw disassembly and preferably an independent
  decompiler/static view. Check critical predicates, callback arguments, escaped
  buffers, dispatch transitions and return values manually.
- Pure reference tests should cover boundaries, malformed lengths, overflow,
  direction/chunk state, serialization, known vectors and failure cases. Mark
  invented models and unknown kernels explicitly; never replace them with a
  guessed implementation and then claim the behavior has been recovered.

## 6. Coverage and stopping responsibly

Maintain a ledger with statuses: **mapped**, **partially mapped**, **unresolved**,
**blocked by missing input**, **identified runtime**, or **proven unreachable
under stated assumptions**. Do not confuse unvisited with unreachable.

Audit for orphan executable regions, hidden entrypoints, indirect edges, secondary
formats, payloads, environment-triggered code and unsupported instruction paths.
Account for meaningful component relationships, not just function counts.

Try complementary static approaches when stuck. When genuinely blocked, give an
exact request: e.g. full-session capture including nonce, extracted module, original
argv, configuration, parent process or architecture-specific analysis tool. Explain
what that artifact could resolve and what it would not establish.

## 7. Dynamic-risk handoff (planning only)

Predict startup, environment gates, contacted endpoints, writes, child processes,
privilege requirements, destructive triggers, delayed actions and escape/exposure
surfaces. Include worst plausible consequences supported by unresolved code, with
confidence and evidence—not just the most likely happy path.

Recommend containment proportionate to those findings:

- Disposable, isolated guest on a segregated analysis system; no production
  credentials, files, mounts, shared folders, clipboard or device auto-sharing.
- Default-deny egress, no route to host/LAN/Internet; controlled simulated services
  only in a separately approved experiment. Do not propose contacting live C2.
- Patched hypervisor/toolchain, snapshots/recovery and explicit resource limits.
  Snapshots alone do not prevent host compromise or network propagation.
- Plan observation, collection and abort criteria before any execution. Clearly
  distinguish predicted observations from measurements not yet performed.
- Drivers, kernel code, firmware, malformed parsers and GPU/device passthrough
  enlarge the trust boundary. A normal VM may be insufficient; recommend dedicated
  sacrificial hardware when necessary, or no execution until a safe setup exists.
- No-go if containment cannot block a plausible harmful effect, required payloads
  remain unaudited, or the experiment needs uncontrolled privileged host access.

Assign **defer**, **conditional proposal**, or **no-go in available environment**.
Explicitly require separate authorization. This skill never performs that experiment.
