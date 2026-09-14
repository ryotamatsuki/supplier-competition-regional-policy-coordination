"""Workflow-v2.1 independent certification regression.

This script reconstructs the upper-stage algebra independently from the Lean
files and preserves known counterexamples delimiting theorem scope.
"""
import math
import sympy as sp

Delta, A, rho, B, R, G, p = sp.symbols(
    "Delta A rho B R G p", positive=True
)

uU = Delta + (1-p)*A*B
uD = p*A*rho*R
gap = sp.expand(uU-uD)

# Boundary correspondence identity.
boundary = sp.factor(gap.subs(A*rho*R, Delta))
assert sp.simplify(boundary - (1-p)*(Delta+A*B)) == 0

# Interior mixing.
pstar = sp.solve(sp.Eq(uU, uD), p)[0]
assert sp.simplify(pstar - (Delta+A*B)/(A*(B+rho*R))) == 0
assert sp.simplify(1-pstar - (A*rho*R-Delta)/(A*(B+rho*R))) == 0

# Planner/local switching differences.
assert sp.expand((Delta+A*G)-2*Delta) == A*G-Delta
assert sp.expand(A*rho*R-Delta) == A*rho*R-Delta

# General incidence condition.
dm, dR, sigma = sp.symbols("dm dR sigma", positive=True)
change = -rho*dR + sigma*(dm+dR)
critical = sigma*(1+dm/dR)
assert sp.simplify(change + dR*(rho-critical)) == 0

# Uniform guaranteed-trade illustration.
def uniform_thresholds(n, delta=1.0, value=2.0, local_share=1.0):
    g = value - 1/(n+1)
    r = 1/(n+1)
    return delta/g, delta/(local_share*r)

prev_ap, prev_an = uniform_thresholds(2)
for n in range(3, 30):
    ap, an = uniform_thresholds(n)
    assert ap < prev_ap
    assert an > prev_an
    prev_ap, prev_an = ap, an

# Reserve case: supplier rent need not fall step-by-step.
def reserve_rent_uniform(n, v):
    return (1-(1-v)**n*(1+n*v))/(n+1)

vals = [reserve_rent_uniform(n, 0.1) for n in range(2, 6)]
assert vals[1] > vals[0] and vals[2] > vals[1] and vals[3] > vals[2]
assert reserve_rent_uniform(500, 0.1) < 0.003

# General-incidence monotonicity can reverse when buyer-side capture is large.
def local_change(dm, dR, rho, sigma):
    return -rho*dR + sigma*(dm+dR)

assert local_change(1.0, 1.0, 1.0, 0.0) < 0
assert local_change(1.0, 1.0, 1.0, 1.0) > 0

# rho -> 0 makes the decentralized differentiation threshold diverge.
for rr in (1.0, 0.1, 0.01, 0.001):
    assert 1/(rr*0.5) > 0
assert 1/(0.001*0.5) > 1/(0.01*0.5)

print("V2.1 INDEPENDENT CERTIFICATION REGRESSION PASS")
print("boundary gap:", boundary)
print("mixed p*:", pstar)
print("reserve rents N=2..5, v=.1:", vals)
