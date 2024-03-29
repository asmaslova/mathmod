# вариант 26 | 祝大家幸福发财

using Plots
using DifferentialEquations

p_cr = 40
tau1 = 30
tau2 = 27
p1 = 11.5
p2 = 9.5
N = 95
q = 1
tspan = (0, 20)
const1 = 0
const2 = 0.00016
u0 = [7.5, 8.5]

a1 = p_cr/(tau1*tau1*p1*p1*N*q)
a2 = p_cr/(tau2*tau2*p2*p2*N*q)
b = p_cr/(tau1*tau1*p1*p1*tau2*tau2*p2*p2*N*q)
c1 = (p_cr - p1)/(tau1*p1)
c2 = (p_cr - p2)/(tau2*p2)

p1 = [a1, a2, b, c1, c2, const1]
p2 = [a1, a2, b, c1, c2, const2]

function syst(du,u,p,t)
    a1, a2, b, c1, c2, constant = p
    du[1] = u[1] - ((b/c1) + constant)*u[1]*u[2] - (a1/c1)*u[1]*u[1]
    du[2] = (c2/c1)*u[2] - (b/c1)*u[1]*u[2] - (a2/c1)*u[2]*u[2]
end

problem1 = ODEProblem(syst, u0, tspan, p1)
solution1 = solve(problem1, Tsit5())

problem2 = ODEProblem(syst, u0, tspan, p2)
solution2 = solve(problem2, Tsit5())

plot(solution2)
#savefig("C:\\Users\\anast\\work\\study\\2023-2024\\Математическое моделирование\\mathmod\\labs\\lab8\\report\\image\\julia2.png")

