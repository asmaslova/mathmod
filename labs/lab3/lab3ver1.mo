model baboon

Real x(start = 80000);
Real y(start = 115000);

Real p;
Real q;

parameter Real a = 0.31;
parameter Real b = 0.77;
parameter Real c = 0.67;
parameter Real h = 0.51;

equation
  p = sin(time+10);
  q = cos(time+10);
  der(x) = - a*x - b*y + p;
  der(y) = - c*x*y - h*y + q;
  
  


end baboon;
