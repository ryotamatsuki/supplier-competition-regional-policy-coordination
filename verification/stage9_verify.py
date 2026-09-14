import math
import sympy as sp

# Independent reconstruction of the induced 2x2 government game.
Delta,A,B,R,rho,p = sp.symbols("Delta A B R rho p", positive=True)

uU = Delta + (1-p)*A*B
uD = p*A*rho*R
best_response_gap = sp.factor(uU-uD)

# Boundary A*rho*R = Delta: U strictly dominates against every p<1,
# while U and D tie at p=1. Hence the full boundary correspondence is
# {(p1,p2): p1=1 or p2=1}.
boundary_gap = sp.factor(best_response_gap.subs(A*rho*R, Delta))
assert sp.simplify(boundary_gap-(1-p)*(Delta+A*B)) == 0

# High-regime completely mixed equilibrium.
pstar = sp.solve(sp.Eq(uU,uD),p)[0]
assert sp.simplify(pstar-(Delta+A*B)/(A*(B+rho*R))) == 0
assert sp.simplify(1-pstar-(A*rho*R-Delta)/(A*(B+rho*R))) == 0

# Coordinated benchmark and threshold ordering.
G = sp.symbols("G", positive=True)
planner_gain = A*G-Delta
local_gain = A*rho*R-Delta
assert sp.diff(planner_gain,A) == G
assert sp.diff(local_gain,A) == rho*R

# Uniform illustration reproduces exact thresholds and opposite movements.
N,v = sp.symbols("N v", integer=True, positive=True)
GN = v-sp.Rational(1,1)/(N+1)
RN = sp.Rational(1,1)/(N+1)
APu = sp.simplify(Delta/GN)
ANu = sp.simplify(Delta/RN)
assert sp.simplify(APu-Delta*(N+1)/(v*(N+1)-1)) == 0
assert sp.simplify(ANu-Delta*(N+1)) == 0
assert sp.simplify(APu.subs(N,N+1)-APu + Delta/((v*(N+1)-1)*(v*(N+2)-1))) == 0
assert sp.simplify(ANu.subs(N,N+1)-ANu-Delta) == 0

# General-incidence algebra.
dm,dR,sigma = sp.symbols("dm dR sigma", positive=True)
L_change = -rho*dR + sigma*(dm+dR)
critical = sigma*(1+dm/dR)
assert sp.simplify(L_change + dR*(rho-critical)) == 0

# Numerical regime reconstruction for the manuscript illustration.
def uniform_thresholds(n, delta=1.0, value=2.0):
    ap = delta*(n+1)/(value*(n+1)-1)
    an = delta*(n+1)
    return ap, an

A_fixed = 5.0
for n in range(2,13):
    ap, an = uniform_thresholds(n)
    assert ap < A_fixed  # coordinated differentiation throughout the plotted range
    if n <= 3:
        assert A_fixed > an
    elif n == 4:
        assert math.isclose(A_fixed, an)
    else:
        assert A_fixed < an

# Reserve-limit sanity check for Uniform[0,1]. Exact formulas avoid
# high-degree floating-point polynomial integration.
def reserve_total_surplus_uniform(n, reserve):
    return reserve - (1-(1-reserve)**(n+1))/(n+1)

def reserve_supplier_rent_uniform(n, reserve):
    # E[(min{C_(2),v}-C_(1)) 1{C_(1)<v}]
    return (1-(1-reserve)**n*(1+n*reserve))/(n+1)

for n in (2,5,20,100):
    g = reserve_total_surplus_uniform(n, 0.4)
    r = reserve_supplier_rent_uniform(n, 0.4)
    assert 0 <= g <= 0.4
    assert r >= 0
assert reserve_total_surplus_uniform(100,0.4) > reserve_total_surplus_uniform(20,0.4)
assert abs(reserve_total_surplus_uniform(100,0.4)-0.4) < 0.011
assert reserve_supplier_rent_uniform(100,0.4) < reserve_supplier_rent_uniform(20,0.4)
assert reserve_supplier_rent_uniform(100,0.4) < 0.011

print("STAGE9 INDEPENDENT FINAL REFEREE REGRESSION PASS")
print("boundary gap:", boundary_gap)
print("mixed p*:", pstar)
