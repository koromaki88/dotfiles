# Academic Research skill

A tool-agnostic, NotebookLM-inspired workflow for an OpenCode terminal agent:
paper discovery, source-grounded Q&A, critical reading, literature synthesis,
and persistent local research notebooks.

## Install and use

The global installation is `~/.config/opencode/skills/academic-research/`.
This folder is a portable copy; to use it elsewhere, copy the whole folder to
that machine's OpenCode skills directory. No configuration edits or additional
dependencies are required for the skill itself. Search and document access
depend on the agent's available tools and permissions.

Invoke it by mentioning `@academic-research` in a prompt. If it is not listed
in an already-running client, start a new session or restart the client.

Examples:

```text
@academic-research Find 8 strong papers on retrieval-augmented generation
evaluation, including foundational work and recent critiques. Verify the
citations and distinguish papers you read from recommendations.
```

```text
@academic-research Create a notebook in ./research/sleep using these PDFs.
Compare their findings on memory consolidation, citing pages. Use only these
sources and flag questions they cannot answer.
```

```text
@academic-research Resume ./research/sleep. Find primary studies addressing
the open questions, keep external candidates separate, and update the matrix.
```

```text
@academic-research Using ./research/sleep, make a cited FAQ, study guide,
and two-person audio-overview script. Do not search outside the notebook.
```

## What it is not

This is an instruction-based workflow, not a NotebookLM client or a standalone
retrieval engine. It does not add browsing tools, semantic indexing, paywall
access, or audio generation. It works best with web search/fetch and PDF reading
available; without them it works with accessible local text and clearly states
coverage limitations. Keep sensitive material local unless you explicitly
authorize external processing. Normal model/provider data handling still
applies; local files do not imply offline model inference.

## Files

- `SKILL.md`: agent workflow and safeguards.
- `references/research-methods.md`: search and appraisal guidance.
- `templates/notebook.md`: notebook layout and evidence templates.

The portable and global copies are independent files, not synchronized links.
