
f = @(t,y) (sin(2*t) - (2*t*y))/(t^2);
N1 = 10 ;
N2 = 10^2;
N3 = 10^3;
N = [N1, N2, N3];
a = 1;
b = 5;
alpha = 2;

[y0, t0] = euler_method(f,a,b,alpha,N1);
[y1, t1] = euler_method(f,a,b,alpha,N2);
[y2, t2] = euler_method(f,a,b,alpha,N3);

%the plot
figure(1);
plot(t0, y0, 'r', t1, y1, 'g', t2, y2, 'b');
legend('y1','y2','y3')
xlabel('t')
ylabel('y(t)')

%error graph 
syms y(t)
ode = diff(y,t) == (sin(2*t) - (2*t*y))/(t^2);
cond = y(1) ==2;
ySol(t) = dsolve(ode, cond);
exact = double(ySol(b));
Err = abs(exact - [y0(end), y1(end), y2(end)]);
figure(2);
loglog(N, Err);

function [y,t] = euler_method(f,a,b,alpha,N)
    h = (b-a)/N;
    t = zeros(N+1,1);
    y = zeros(N+1,1);
    
    y(1) = alpha;
    t(1) = a;
    
    for i = 1:N
        y(i+1) = y(i) + h * f(t(i), y(i));
        t(i+1) = t(i) + h;
    end
end


