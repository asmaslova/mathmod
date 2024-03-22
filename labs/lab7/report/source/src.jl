#вариант 26

using Plots
using DifferentialEquations

n0 = 16
p1 = [0.84, 0.00002, 910]
p2 = [0.000084, 0.6, 910]
p3 = [0.3, 0.3, 910]
tspan = (0, 20)
tspan1 = (0.015, 0.025)
tspan2 = (0, 0.6)

f12(n,p,t) = (p[1] + p[2]*n)*(p[3]-n) 

f3(n,p,t) = (p[1]*sin(3*t) + p[2]*t*n)*(p[3]-n) 

problem1 = ODEProblem(f12, n0, tspan, p1)
problem2 = ODEProblem(f12, n0, tspan1, p2)
problem3 = ODEProblem(f3, n0, tspan2, p3)

solution1 = solve(problem1, Tsit5())
solution2 = solve(problem2, Tsit5())
solution3 = solve(problem3, Tsit5())

plot(solution2)
#savefig("C:\\Users\\anast\\work\\study\\2023-2024\\Математическое моделирование\\mathmod\\labs\\lab7\\report\\image\\julia3.png")