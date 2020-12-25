format long

f = @(x) cos((pi *(x^2))/2);
n1 = 10^3;
n2 = 10^5;
a = 0;
b = pi;

I3 = composite_simpsons(f,a,b,n1) %initializing function
I4 = composite_simpsons(f,a,b,n2)

ext = fresnelc(pi) % calculating the error
Err3 = abs(I3 - 0.523698543726229);
Err4 = abs(I4 - 0.523698543726229);
loglog([n1,n2], [Err3,Err4], '-s');
grid on

function I = composite_simpsons(f,a,b,n)

h = (b-a)/n;
sum_even = 0;
sum_odd = 0;
I = f(a) + f(b);

for i = 1:n/2-1 % for the even 
    x(i) = a +2*i*h;
    sum_even = sum_even + f(x(i));
end
for i = 1:n/2-1 %for the odd
x(i) = a + (2*i-1)*h;
    sum_odd = sum_odd + f(x(i));
end

I = (h/3) * (I + 2*sum_even + 4* sum_odd);
end
