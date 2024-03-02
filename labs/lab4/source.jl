#вариант 26

using Plots
using DifferentialEquations

tspan = (0,53)

p1 = [0, 4.4]
p2 = [2.5, 4]
p3 = [2, 3.3]

du0 = [-1.5]
u0 = [0]

function harmonic_osc(du, u, p, t)
	g,w = p
	du[1] = u[2]
	du[2] = -w^2 .* u[1] - g.*u[2]
end

f(t) = 3.3*cos(2*t)

function forced_harmonic_osc(du, u, p, t)
	g,w = p
	du[1] = u[2]
	du[2] = -w^2 .* u[1] - g.*u[2].*f(t)
end

prob1 = ODEProblem(harmonic_osc, [0, -1.5], tspan, p1)
sol1 = solve(prob1, Tsit5(), saveat=0.05)

prob2 = ODEProblem(harmonic_osc, [0, -1.5], tspan, p2)
sol2 = solve(prob2, Tsit5(), saveat=0.05)

prob3 = ODEProblem(forced_harmonic_osc, [0, -1.5], tspan, p3)
sol3 = solve(prob3, Tsit5(), saveat=0.05)

plot(sol3)
savefig("C:\\Users\\anast\\work\\study\\2023-2024\\Математическое моделирование\\mathmod\\labs\\lab4\\report\\image\\withforcewithfadingjl.png")