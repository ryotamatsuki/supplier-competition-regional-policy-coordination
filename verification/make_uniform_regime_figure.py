from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt

out = Path(__file__).resolve().parent.parent / "figures"
out.mkdir(parents=True, exist_ok=True)

Delta = 1.0
v = 2.0
A_fixed = 5.0
N = np.arange(2, 13)

A_planner = Delta * (N + 1) / (v * (N + 1) - 1)
A_nash = Delta * (N + 1)

fig, ax = plt.subplots(figsize=(7.2, 4.6))
ax.plot(N, A_planner, marker="o", label=r"$A_N^P$ (coordinated threshold)")
ax.plot(N, A_nash, marker="s", label=r"$A_N^N$ (decentralized threshold)")
ax.axhline(A_fixed, linestyle="--", label=r"fixed $A=5$")
ax.set_xlabel("Number of suppliers, $N$")
ax.set_ylabel("Project-scale threshold, $A$")
ax.set_xticks(N)
ax.legend(frameon=False)
ax.grid(True, alpha=0.25)
fig.tight_layout()
fig.savefig(out / "uniform_regime_thresholds.pdf", bbox_inches="tight")
fig.savefig(out / "uniform_regime_thresholds.png", dpi=200, bbox_inches="tight")
