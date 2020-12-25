a = -1;%given interval
b = 1;
tol = 10^-5;
N = 1000; %not sure how big this value should be
f = @(x)((2.*(x^3) + 3.*x - 1) * cos(x) - x);
ax = @(x) 0; 

x = [a,b];
y = 0*x;

fplot(f,x)
hold on % retains current plot so graphing commands add to existing graph
plot (x,y)

[c,n,err] = bisection_method1(f,a,b,tol,N)

function [c,n,err] = bisection_method1(f,a,b,tol, N)
n = 0;
c = 0;
if f(a) * f(b) > 0 
    disp('wrong method. Choose another one!')
else
 err = tol + 1;
while err > tol && n < N
    c = (a+b)/2;
    if f(c) == 0 %if one of the two guess is equal to the root, then done
        return
    end
    if f(a)*f(c) < 0 % comparing the value of a to 
        b = c;
    else
        a = c;
    end
    p = (b-a);
    err = abs(p)/2;
    n = n + 1; %next iteration
    end
end
end