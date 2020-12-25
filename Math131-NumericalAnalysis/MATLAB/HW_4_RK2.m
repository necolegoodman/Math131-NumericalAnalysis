fp = @(t,y)-12*y;
a = 0;
b = 1;
alpha = 1;

y0 = RK2(fp,a,b,alpha,20);
y1 = RK2(fp,a,b,alpha,50);
y2 = RK2(fp,a,b,alpha,100);

t0 = RK2(fp,a,b,alpha,20);
t1 = RK2(fp,a,b,alpha,50);
t2 = RK2(fp,a,b,alpha,100);

figure(1);
plot(t0,y0);
hold on
plot(t1,y1);
plot(t2,y2);
hold off

syms y(t)
ode = diff(y,t) == -12*y;
cond = y(0) == 1;
ySol(t) = dsolve(ode,cond);

figure(2);
exact = double(ySol(b));
Err = abs(exact - [y0(end), y1(end), y2(end)]);
loglog([20,50,100], Err);

function [y,t] = RK2(f,a,b,alpha,N)
  h = (b-a)/N;
    t = linspace(a,b,N+1);
    y = zeros(N+1,1);
    
    y(1) = alpha;
   
    
    for i = 1:N
        s = f(t(i) + h/2, y(i) + h/2 * f(t(i), y(i)));
        y(i+1) = y(i) + h *s
        
    end
end