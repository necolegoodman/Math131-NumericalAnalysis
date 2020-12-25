tol = 10^(-8);
f = @(x) atan(x) - 1;
ax = @(x) 1;
x0 = 2;
N = 1000;
fp = @(x) 1./(x^2 + 1);
x = [-2,2];
y = 1*x;

[c,n,err] = Newtons_method(f,fp,x0,tol,N)
fplot(f,x)
hold on 
plot(x,y)

function [c,n,err] = Newtons_method(f,fp,x0,tol,N)
n = 0;
c = 0;
err = abs (c - x0)
while err > tol && n < N
    c = x0 - f(x0)/fp(x0)
    err = abs (c - x0)
    if err < tol
        n = n + 1
        break 
    end
    x0 = c;
    n = n + 1;  
end
end
    