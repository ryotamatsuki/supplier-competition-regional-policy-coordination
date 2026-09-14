import sympy as sp

Delta,A,B,R,rho,p = sp.symbols("Delta A B R rho p", positive=True)

U = Delta + (1-p)*A*B
D = p*A*rho*R
pstar = sp.solve(sp.Eq(U,D),p)[0]
assert sp.simplify(pstar-(Delta+A*B)/(A*(B+rho*R))) == 0

diff = sp.expand(U-D)
boundary = sp.factor(diff.subs(A*rho*R, Delta))
assert sp.simplify(boundary-(1-p)*(Delta+A*B)) == 0

N,v = sp.symbols("N v", positive=True)
GN = v-1/(N+1)
RN = 1/(N+1)
AP = sp.simplify(Delta/GN)
AN = sp.simplify(Delta/RN)
assert sp.simplify(AP-Delta*(N+1)/(v*(N+1)-1)) == 0
assert sp.simplify(AN-Delta*(N+1)) == 0

AP_next = Delta*(N+2)/(v*(N+2)-1)
target = -Delta/((v*(N+1)-1)*(v*(N+2)-1))
assert sp.simplify(AP_next-AP-target) == 0
assert sp.simplify(Delta*(N+2)-AN-Delta) == 0

dm,dR,sigma = sp.symbols("dm dR sigma", positive=True)
L_change = -rho*dR + sigma*(dm+dR)
critical = sigma*(1+dm/dR)
assert sp.simplify(L_change + dR*(rho-critical)) == 0

print("STAGE8 MATH REGRESSION PASS")
print("boundary difference:", boundary)
print("mixed p*:", pstar)
