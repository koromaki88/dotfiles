# Persistent research notebook

Create only the files needed for the task; add structure as the collection
grows. The notebook is ordinary Markdown/TSV, not a hidden database. Resolve
these paths relative to the chosen notebook root, not the skill directory.

```text
research/<topic>/
  README.md
  sources.tsv
  search-log.md
  evidence-matrix.md
  references.bib        # Optional; verified metadata only
  documents/            # Optional authorized source copies
  extracted/            # Optional extracted text, preserving page boundaries
  notes/
    S001.md
  outputs/
```

## README.md

```markdown
# <Research topic>

## Question and intended output
<Question, audience, and requested depth>

## Scope
- Mode: notebook / discover / expand / synthesize
- Inclusion and exclusion criteria:
- Date/language constraints and their rationale:
- Selected source IDs:
- Search/access/tool limitations:

## Source index
| ID | Short title | Keywords/themes | Note path |
| --- | --- | --- | --- |

## Progress
- <Date>: <Completed work, outputs, changed inclusion decisions>

## Open questions and next retrievals
- <Question and relevant source IDs/sections to inspect>
```

## sources.tsv

One row per distinct work/version as appropriate. Use real tab separators;
escape embedded tabs/newlines. Empty fields mean unknown, not verified absence.
IDs are permanent. Use relative local paths where possible.

```text
id	title	authors	year	venue	identifier	canonical_url	version	related_ids	verified_date	access_date	screening_status	screening_reason	access_status	read_coverage	local_path	note_path
```

- `screening_status`: candidate / included / excluded.
- `access_status`: metadata-only / abstract-only / partial-text / full-text.
- `read_coverage`: not-read, abstract, named sections/pages, or full paper;
  mention supplementary material separately.
- `verified_date`: date metadata was checked against an identified record;
  leave empty for unverified candidates, which are not usable evidence.
- `identifier`: verified DOI or repository/index identifier, not a guessed DOI.

## search-log.md

```markdown
## <Date> — <Search objective>
- Tool/database/interface:
- Exact query and filters:
- Results reported by service, if available:
- Results actually inspected:
- Candidates/decisions: <IDs and reasons>
- Citation-chaining seed(s) and direction, if used:
- Access/coverage limitations:
- Stopping rule or next query:
```

## notes/S001.md

```markdown
# S001 — <Verified title>

## Provenance
- Citation, stable URL/identifier, version:
- Access/read coverage and date:
- Local original/extracted paths, if any:
- Correction/retraction notices checked and result, if checked:

## Research question and relevance

## Design and methods
- Population/setting/data/sample:
- Intervention/method/comparator:
- Outcomes/analysis/assumptions:

## Findings and evidence
| Claim ID | Finding or exact short quote | Locator | Context/uncertainty |
| --- | --- | --- | --- |
| S001-C01 | ... | ... | ... |

## Critical appraisal
- Strengths:
- Limitations and possible biases:
- Funding/conflicts, if reported:
- Missing information:

## Interpretation
<Clearly labeled inference; distinguish from authors' findings>

## Links to other sources and unresolved questions
```

## evidence-matrix.md

```markdown
| Theme/question | Source + locator | Design/population | Finding | Limitations | Agreement/conflict |
| --- | --- | --- | --- | --- | --- |
```

## Outputs

Save requested artifacts under descriptive filenames in `outputs/`. Include a
scope/date statement and source key in standalone reports. Preserve existing
outputs or revise explicitly; do not silently replace user edits. Bibliography
exports must match verified registry metadata and selected source versions.
