f = @(x) ((x.^2- 3*x +2) * atan(x));
h1 = 10^-1;
h3 = 10^-3;
h6 = 10^-6;
x0 = 0;


% Forward Difference
FD1 = Forward_Difference(f,x0,h1);
FD3 = Forward_Difference(f,x0,h3);
FD6 = Forward_Difference(f,x0,h6);

% 3 point centered difference
CD31 = Centered_Difference3(f,x0,h1);
CD33 = Centered_Difference3(f,x0,h3);
CD36 = Centered_Difference3(f,x0,h6);

% 5 point centered difference
CD51 = Centered_Difference5(f,x0,h1);
CD53 = Centered_Difference5(f,x0,h3);
CD56 = Centered_Difference5(f,x0,h6);


% Plotting the Error
Err1 = abs(2-FD1);
Err2 = abs(2-CD31);
Err3 = abs(2-CD51);
loglog([h1,h3,h6], [Err1,Err2,Err3], '-s')
hold on
grid on
Err1 = abs(2-FD3);
Err2 = abs(2-CD33);
Err3 = abs(2-CD53);
loglog ([h1,h3,h6], [Err1,Err2,Err3], '-s')
hold on 
grid on
Err1 = abs(2-FD6);
Err2 = abs(2-CD36);
Err3 = abs(2-CD56);
loglog ([h1,h3,h6], [Err1,Err2,Err3], '-s')


% writing out the main functions
function fdiff = Forward_Difference(f,x0,h)
    fdiff = (f(x0 + h) - f(x0))/h;
end

function fdiff = Centered_Difference3(f,x0,h)
    fdiff = (f(x0 + h) - f(x0-h))/(2*h);
end

 function fdiff = Centered_Difference5(f,x0,h)
     fdiff = (-f(x0+(2*h)) + 8*(f(x0+h)) - 8*(f(x0-h)) + f(x0 - 2*h))/(12*h);
 end
 
 %
