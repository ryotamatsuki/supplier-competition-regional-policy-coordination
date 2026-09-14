from pathlib import Path

root = Path(__file__).resolve().parent.parent
main = (root / "paper" / "main.tex").read_text(encoding="utf-8")
intro = (root / "paper" / "sections" / "introduction.tex").read_text(encoding="utf-8")
refs = (root / "paper" / "references.tex").read_text(encoding="utf-8")
highlights = [x.strip() for x in (root / "submission" / "HIGHLIGHTS.txt").read_text(encoding="utf-8").splitlines() if x.strip()]
title_page = (root / "submission" / "title_page.tex").read_text(encoding="utf-8")
cover = (root / "submission" / "COVER_LETTER_IJIO.md").read_text(encoding="utf-8")
metadata = (root / "submission" / "EDITORIAL_MANAGER_METADATA.md").read_text(encoding="utf-8")

TITLE = "When Supplier Competition Worsens Policy Coordination"
FREEZE = "P2-IO-THEORY-FREEZE-2026-09-15-v1"

assert TITLE in main
assert "\\author{Anonymous manuscript}" in main
assert "Declaration of generative AI and AI-assisted technologies" in main
assert "No data were used for the research described in this article" in main
assert "AI-assisted code" in main
assert "Companion2026" in intro
assert "Anonymous (2026)" in refs
assert "Industrial Policy Composition and Regional Value Chains" in cover
assert len(highlights) in range(3, 6)
assert all(len(x) <= 85 for x in highlights), [(len(x), x) for x in highlights]
assert "[FULL AUTHOR NAME]" in title_page
assert "[AUTHOR-CONFIRMED" in metadata
assert "[FULL AUTHOR NAME]" not in main
assert "[AFFILIATION]" not in main

# The title page is intentionally unresolved until factual author input is confirmed.
# The anonymous manuscript must remain free of those administrative placeholders.

print("STAGE10 SUBMISSION PREFLIGHT PASS")
print("highlight lengths:", [len(x) for x in highlights])
print("theory freeze expected:", FREEZE)
