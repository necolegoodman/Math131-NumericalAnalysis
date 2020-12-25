fp = @(t,y) -12*y;
a = 0;
b = 1;
alpha = 1;

y3 = RK4(fp,a,b,alpha,20);
y4 = RK4(fp,a,b,alpha,50);
y5 = RK4(fp,a,b,alpha,100);

t3 = RK4(fp,a,b,alpha,20);
t4 = RK4(fp,a,b,alpha,50);
t5 = RK4(fp,a,b,alpha,100);

figure(1);
plot(t3,y3);
hold on
plot(t4,y4);
plot(t5,y5);
hold off

figure(2);
exact = double(exp(-12*b));
Err1 = abs(exact - [y3(end),y4(end), y5(end)]);
loglog([20,50,100], Err1);

function [y,t] = RK4(f,a,b,alpha,N)
    y(1) = alpha; 
    h = (b - a) / N;  
    t = linspace(a,b,N+1);
    y = zeros(N+1,1);
   
    for i = 1:N
        k1 = h * f(t(i), y(i));
        k2 = h * f(t(i) + h/2, y(i) + k1/2);
        k3 = h * f(t(i) + h/2, y(i) + k2/2);
        k4 = h * f(t(i) + h, y(i) + k3);
        y(i+1) = y(i) + 1/6 * (k1 + 2*(k2 + k3) + k4);
    end
end