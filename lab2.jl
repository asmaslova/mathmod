using OrdinaryDiffEq
using Plots
#вариант 26

s = 15.5 #начальное расстояние от лодки до катера
fi = 3*pi/4

#функция, описывающая движение катера береговой охраны
f(u,p,t) = u/sqrt(19.25)

#начальные условия в случае 1 и 2 соответственно

r0_1 = s/5.5
r0_2 = s/3.5

tetha1 = (0.0, 2*pi)
tetha2 = (-pi, pi)

#определение и решение задачи Коши в обоих случаях

r1 = ODEProblem(f, r0_1, tetha1)
r2 = ODEProblem(f, r0_2, tetha2)

sol1 = solve(r1, Tsit5(), saveat=0.01)
sol2 = solve(r2, Tsit5(), saveat=0.01)

#функция, описывающая движение лодки браконьеров
f2(t) = tan(fi)*t
t = 0:0.01:15

#движение катера

plot(sol1.t, sol1.u,
proj=:polar,
lims=(0,13)
)

#движение лодки

plot!(fill(fi,length(t)), f2.(t))

solution1(t) = (r0_1)*exp(1/sqrt(19.25)*t) 

solution2(t) = (r0_2*5)*exp(5*pi*sqrt(299)/299)*exp(1/sqrt(19.25)*t) 

intersection_r1 = solution1(7*pi/4)
intersection_r2 = solution2(-pi/4)

println(intersection_r1)
println(intersection_r2)

#точка пересечения для первого случая - 9.866586187954175
#точка пересечения для второго случая - 45.920933646372056
