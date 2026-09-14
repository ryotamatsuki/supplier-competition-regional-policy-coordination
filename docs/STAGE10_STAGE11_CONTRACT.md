# Stage 10 -> Stage 11 Contract

## Stage 11 title
`IJIO Live Portal / Submission Execution Gate`

## Entry conditions
Proceed only when:
1. the official IJIO submission portal is live and no longer displays a do-not-submit development notice;
2. author-confirmed factual metadata are available;
3. the live submission-fee / publication-route screen has been checked;
4. the user explicitly instructs ChatGPT to submit or to proceed through the live submission workflow.

## Inputs
- theory freeze `P2-IO-THEORY-FREEZE-2026-09-15-v1`;
- Stage 9 scientific authorization `SUBMISSION AUTHORIZED — IJIO`;
- Stage 10 preflight packet;
- factual author metadata supplied/confirmed by the author.

## Mission
Populate the live IJIO submission workflow using the frozen package, verify every portal-generated summary/PDF, and stop before final submission unless explicit user authorization covers the final submit action.

## Required checks
- correct article type;
- exact title / abstract / keywords;
- author identity / affiliation / ORCID;
- funding and competing-interest declarations;
- preprint / exclusivity status;
- companion-manuscript disclosure;
- anonymous manuscript and title-page mapping if requested;
- AI declaration / data statement preserved;
- highlights only if requested/permitted;
- zero unexpected mandatory submission/publication charge;
- portal-generated manuscript PDF visually correct;
- no accidental author identity inside anonymized review file.

## Theory constraint
No manuscript-theory change is permitted in Stage 11. Any editor/portal request that requires substantive theoretical revision stops the submission workflow and opens a new repair stage.

## Outcomes
- `READY FOR FINAL SUBMIT CLICK`
- `SUBMITTED — IJIO` (only after explicit user authorization and successful final submission)
- `ADMINISTRATIVE INPUT REQUIRED`
- `UNEXPECTED FEE — REASSESS JOURNAL LADDER`
- `PORTAL NOT LIVE`
- `UPLOAD/PDF REPAIR REQUIRED`
