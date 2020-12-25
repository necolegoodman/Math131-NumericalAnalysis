clc
%initialization
fp = @(t,y) -12*y;
a = 0;
b = 1;
alpha = 1;

y6 = AB4(fp,a,b,alpha,20);
y7 = AB4(fp,a,b,alpha,50);
y8 = AB4(fp,a,b,alpha,100);

t6 = AB4(fp,a,b,alpha,20);
t7 = AB4(fp,a,b,alpha,50);
t8 = AB4(fp,a,b,alpha,100);

%plots
figure(1);
plot(t6,y6);
hold on
plot(t7,y7);
plot(t8,y8);
hold off

figure(2);
exact = double(exp(-12 * b));
Err2 = abs (exact - [y6(end), y7(end),y8(end)]);
loglog([20,50,100], Err2);

%main function
function [y,t] = AB4(f,a,b,alpha,N)
    h = (b-a)/N;
    y(1) = alpha;
    y = zeros(N+1,1);
    t = linspace(a,b,N+1);
    
    for i = 1:3
        k1 = h * f(t(i), y(i));
        k2 = h * f(t(i) + h/2, y(i) + k1/2);
        k3 = h * f(t(i) + h/2, y(i) + k2/2);
        k4 = h * f(t(i) + h, y(i) + k3);
        y(i+1) = y(i) + 1/6 * (k1 + 2*(k2 + k3) + k4);
    end
    s = f(t(1:3), y(1:3);
    coef = h/24 * [-9,37,-59,55];
    for i = 4:N;
        s(4) = f(t(i), y(i));
        y(i+1) = y(i) + dot(coef,s);
        s(1:3) = s(2:4); %shifting slope down
end
end

    