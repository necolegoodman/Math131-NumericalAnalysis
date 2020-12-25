g = @(x) exp(-x);
tol = 10^(-10);
N = 1000;
x0 = 4; %intial guess based on graph of e^-x
g1 =@(x) 1./(1+x);
x = [-1,1];
y = x;
x01 = 20;
N1 = 1000;

[c,n,err] = fixed_point_iteration(g,x0,tol,N)
fplot(g,x)
hold on
plot(x,y)

[c1,n1,err1] = fixed_point_iteration(g1,x01,tol,N1)
fplot(g1,x)
hold on;
plot(x,y);

function [c,n,err] = fixed_point_iteration(g,x0,tol,N)
c = g(x0);
n = 0;
err = tol + 1;
while (err > tol && n < N)
    x0 = g(c);
    c = g(x0)
    err = abs (c - x0);
    n = n + 1;
    

end
end
function [c1,n1,err1] = fixed_point_iteration1(g1,x01,tol,N1)
c1 = g1(x01);
n1 = 0;
err1 = tol + 1;
while (err1 > tol && n1 < N1)
    x01 = g1(c1);
    c1 = g1(x01)
    err1 = abs (c1 - x01);
    n1 = n1 + 1;
end
end
% maximum number of iternations, N
%root, c of f interval [a,b]
%error tolerance, tol
%initial guess, x0


