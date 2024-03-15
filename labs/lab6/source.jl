#вариант 26

using Plots
using DifferentialEquations

N = 11200 # общая численность популяции
tspan = (0.0,200.0)
I = 230 # количество инфицированных особей в начальный момент времени
R = 45 #  количество здоровых особей с иммунитетом в начальный момент времени
S = N - I - R # количество восприимчивых к болезни, но пока здоровых особей в начальный момент времени
u0 = [S, I, R]
p = [0.01, 0.02] # коэффициенты заболеваемости и выздоровления соответственно

function sir!(du,u,p,t) # при I(0)>I*
    a,b = p
	S, I, R = u
    du[1] = -a*u[1] #dS
    du[2] = a*u[1] - b*u[2] #dI
    du[3] = b*u[2] #dR
end

function sir1!(du,u,p,t) # при I(0)<I*
    a,b = p
    du[1] = 0
    du[2] = - b*u[2]
    du[3] = b*u[2]
end

prob1 = ODEProblem(sir!,u0,tspan,p)
sol1 = solve(prob1, Tsit5())

prob2 = ODEProblem(sir1!,u0,tspan,p)
sol2 = solve(prob2, Tsit5())

plot(sol2, title="SIR model", label = ["S" "I" "R"])
#savefig("C:\\Users\\anast\\work\\study\\2023-2024\\Математическое моделирование\\mathmod\\labs\\lab6\\report\\image\\lessthanjulia.png")