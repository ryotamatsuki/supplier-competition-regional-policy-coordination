# Stage 8 — PDF Visual QA

Local repaired manuscript: 22 pages after final synchronization with the GitHub branch.

Workflow: three `pdflatex` passes with `-halt-on-error`; log scan for unresolved references/citations and box warnings; all 22 pages rendered to PNG; targeted reinspection of the title/abstract, exact boundary Nash statement, Uniform regime figure, reserve/trade-failure section and proof, data/AI declarations, and references.

Results: no unresolved references/citations; no material LaTeX warnings; no overfull/underfull box warnings; no clipped text/equations or overlapping objects; boundary formula renders correctly; Figure 1 is legible and correctly captioned; the AI declaration appears immediately before references; references continue cleanly to the final page.

Verdict: `PASS`.
