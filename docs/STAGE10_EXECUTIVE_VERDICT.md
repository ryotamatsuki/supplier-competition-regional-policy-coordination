# Stage 10 — IJIO Submission Package / Editorial Manager Preflight

Date: 2026-09-15
Theory freeze: `P2-IO-THEORY-FREEZE-2026-09-15-v1`
Stage 9 scientific verdict: `SUBMISSION AUTHORIZED — IJIO`

# Final Stage 10 outcome

## `PORTAL/FEE REASSESSMENT REQUIRED`

This outcome is administrative, not scientific.

## Completed
- Anonymous canonical manuscript: prepared.
- Separate title-page template: prepared.
- Cover letter with companion-manuscript disclosure: prepared.
- Editorial Manager metadata sheet: prepared.
- Highlights: prepared as 5 bullets; every bullet is <=85 characters.
- AI declaration / AI-assisted-code disclosure: consistent with Stage 9.
- Data-availability statement: present.
- Reproducibility / algebraic verification: retained.
- Stage 10 automated submission preflight: added to CI.
- CI builds anonymous manuscript and administrative templates.
- CI creates an `IJIO-preflight-packet` artifact containing the manuscript PDF, administrative templates, highlights, metadata sheet and editable source archive.
- Theory drift: none.

## Blocking item 1 — official submission portal
The official Elsevier IJIO page currently links to `https://www.editorialmanager.com/ijio/default.aspx`, whose public landing page states:

`Site under development. Do not use for live manuscript submission.`

Therefore the live journal workflow and payment screen cannot be treated as available for final submission in this Stage 10 run.

## Blocking item 2 — factual author inputs
The following must be supplied from author-confirmed facts and are intentionally not inferred:
- full author name;
- institutional affiliation;
- postal address;
- corresponding email;
- ORCID if used;
- funding statement;
- competing-interest declaration;
- exclusive-submission confirmation;
- preprint / working-paper status.

The package isolates these fields so they can be inserted without touching the anonymous manuscript or theory.

## Fee status
The live fee screen could not be checked because of the current portal status. Prior evidence supports a zero-cost standard subscription route and likely zero submission fee, but the Stage 10 contract requires a live confirmation immediately before submission. That gate remains open.

## Scientific status
`SUBMISSION AUTHORIZED — IJIO` remains unchanged. No Stage 10 finding reopens theory or manuscript science.

## Next action
When the official IJIO submission workflow is live, complete the factual metadata, replace all title-page / cover-letter placeholders, verify the fee screen, rerun the final package CI, and proceed to Stage 11 submission execution only on explicit user instruction.
