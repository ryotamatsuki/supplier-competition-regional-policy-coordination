# Stage 8 — PDF Visual QA

Local repaired manuscript: 21 pages.

Workflow: three `pdflatex` passes with `-halt-on-error`; log scan for unresolved references/citations and box warnings; all pages rendered to PNG at 150 dpi; targeted inspection of title/abstract, exact boundary Nash statement, regime figure, reserve proof, declarations, and references.

Results: no unresolved references/citations; no material LaTeX warnings; no clipped text/equations or overlapping objects; boundary formula renders correctly; Figure 1 is legible; the AI declaration appears immediately before references.

Verdict: `PASS`.
