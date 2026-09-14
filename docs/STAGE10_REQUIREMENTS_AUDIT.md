# Stage 10 — IJIO Requirements / Editorial Manager Audit

Date: 2026-09-15

## Official journal ownership
The official Elsevier IJIO page states that the journal covers theoretical and empirical industrial organization, including strategic behavior and market structure, and explicitly encourages theoretical submissions.

Official journal page:
`https://shop.elsevier.com/journals/international-journal-of-industrial-organization/0167-7187`

## Official submission link
The official IJIO page points to:
`https://www.editorialmanager.com/ijio/default.aspx`

The latest public Editorial Manager snapshot accessible to this Stage 10 audit displayed:

`Site under development. Do not use for live manuscript submission.`

The web source available to this audit was crawled roughly two months earlier, so Stage 10 does **not** infer that the notice necessarily remains live on 2026-09-15. Instead, the live portal status is treated as unverified. The Stage 10 contract requires a live check immediately before submission, and that requirement cannot be satisfied from the available snapshot alone.

This is an administrative verification blocker, not a scientific/manuscript defect.

## Guide for Authors
The Editorial Manager page links to the ScienceDirect IJIO Guide for Authors. The guide endpoint returned an access/cache failure to the automated audit, so Stage 10 does not invent journal-specific peer-review or file-upload requirements that could not be confirmed live.

Accordingly, the package is conservatively prepared with:
- anonymous manuscript;
- separate title-page template;
- cover letter;
- 5 highlights bullets (all <=85 characters), to be uploaded only if the live workflow requests/permitted;
- editable LaTeX source;
- reproducibility code and figure source.

This structure supports an anonymized-review workflow if IJIO requests it, while the separate title page can simply be ignored if the live workflow does not.

## Fees
The live Editorial Manager payment/fee step could not be checked in this audit, so Stage 10 cannot make a new live fee confirmation.

The prior Stage 9 classification remains provisional:
- standard Elsevier subscription publication route: no publication charge;
- IJIO submission fee: previously classified `LIKELY FREE`, but the live portal fee screen must be checked before final submission.

## Administrative author facts
Stage 10 intentionally does not infer:
- author name;
- affiliation;
- postal address;
- email;
- ORCID;
- funding;
- competing interests;
- exclusivity;
- preprint status.

These fields are isolated in `submission/title_page.tex` and `submission/EDITORIAL_MANAGER_METADATA.md` and must be completed from author-confirmed facts.

## Requirements verdict
Scientific/manuscript package: PASS.
Live portal / live fee confirmation: NOT VERIFIED; mandatory recheck immediately before submission.
