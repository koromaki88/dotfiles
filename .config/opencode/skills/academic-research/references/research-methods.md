# Research methods reference

## Search planning

Turn the question into a small concept table: concept, synonyms, controlled
vocabulary where applicable, and inclusion/exclusion criteria. For clinical
questions consider PICO; for exploratory questions consider population, concept,
and context. Do not force a biomedical framework onto unrelated disciplines.

Choose tools by field and availability, for example:
- Broad discovery: OpenAlex, Semantic Scholar, Crossref, Google Scholar.
- Biomedical: PubMed/PMC and relevant trial registries.
- Computing: ACM Digital Library, IEEE Xplore, DBLP, arXiv.
- Other fields: suitable disciplinary indexes and institutional repositories.

These are examples, not guaranteed integrations. Use browser/search tools,
documented APIs, or available MCP tools; respect rate limits and access rules.
Avoid scraping blocked services or implying subscription-database coverage
without access. General web search can locate papers but is not equivalent to
searching a bibliographic database directly.

Use several complementary query forms:
1. Broad concepts and synonyms.
2. Specific method, population, outcome, or competing theory.
3. Review/survey terms to map terminology and find seed papers.
4. Backward references and forward citations from key verified papers, when
   available. Verify each newly found record independently.
5. Negative/null results, replications, critiques, and alternative approaches.

Use date filters intentionally. Log the date, engine/database, exact query,
filters, inspected result count, useful IDs, and limitations. Distinguish the
reported total hits from the number actually screened. Never invent counts.
For reproducible searches, capture the interface/API and query syntax used.

For a focused search, stop at the requested budget or when successive query
families and citation trails add little relevant material. Report that stopping
rule and unresolved gaps. This is not proof of exhaustive coverage.

## Screening and deduplication

Set scope before ranking: topic, population/data, study type, time window,
language, and outcomes as relevant. Apply consistent criteria. Record reasons
for exclusion, and preserve ambiguous cases for clarification.

Prefer DOI matching; otherwise use repository IDs and normalized title/authors/
year. Do not automatically merge companion papers, extended studies, or
substantially different versions. Prefer the relevant corrected published
version when available, but retain version links and document differences.

Keep candidate/included/excluded status separate from metadata verification
and access/read status. “Included” does not mean “high quality” or “fully read.”

## Critical appraisal prompts

General:
- Is the design suitable for the claim? Are assumptions explicit?
- What selection, measurement, confounding, and reporting biases are plausible?
- Are sample size, missing data, uncertainty, and analysis choices reported?
- Do conclusions exceed the observed population, setting, or time frame?
- Are preregistration, protocol deviations, funding, and conflicts disclosed?

Quantitative/clinical:
- Randomization, allocation concealment, blinding, attrition, comparator quality.
- Absolute versus relative effects, confidence intervals, multiplicity,
  power/precision, and clinically meaningful differences.

Computing/ML:
- Dataset provenance, train/test leakage, contamination, split independence.
- Competitive and fairly tuned baselines, ablations, compute budget, seeds,
  variance, code/data availability, benchmark validity, external generalization.

Qualitative:
- Sampling rationale, context, reflexivity, analytic process, triangulation,
  and whether interpretations are grounded in participants' evidence.

Theoretical:
- Definitions, assumptions, proof dependencies, applicability, and whether
  claimed results follow under the stated conditions.

Reviews:
- Search coverage, screening transparency, inclusion criteria, appraisal,
  publication bias, heterogeneity, and double-counting overlapping primary work.

Use discipline-appropriate criteria. Do not treat every absent reporting item
as demonstrated bias; distinguish “not reported” from “methodologically flawed.”

## Synthesis pattern

1. State the question and corpus boundary.
2. Summarize strongest directly relevant evidence with citations.
3. Compare results using a theme-by-study evidence matrix.
4. Explain conflicting findings using design and context, where supported.
5. State confidence and reasons, alternative explanations, and gaps.
6. Conclude with what the evidence does and does not justify.

For systematic work, agree on protocol, database coverage, deduplication rules,
screening procedure, extraction fields, and appraisal before proceeding. If
independent screening or other required resources are unavailable, document
that limitation rather than simulating reviewers or claiming compliance.
