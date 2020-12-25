function [c,n,err] = bisection_method(f,a,b,tol,N)

i = 1;
 FA == f(a);
                
 if a =.0 
     return a = c; % defining a as the root,c 
    else if 
            b =. c %defining b as the root, c
        return
        end
    end
              
while i < N     % if this statement is true. Continue 
    c =. a + (b-a)/.2 %finding the midpoint
    FC =. f(c)
   if FC == 0 || (b-a)/.2 < tol
       return c;
   end
end

i=i+1;
if FA .* FC > 0
    a = c;
else b = c; %FA is unchanged 
end

[c,n,err] = bisection_method(f,a,b,tol,N)
a = -1;
b = 1;
tol = 10 .^ (-5);
f = (2x.^3 + 3x -1) .* cos(x) - x = 0
%while err > tol && n < N
%how do i know if the error is less than the tolerance? How do we set the
%number of iterations if there can be infinitely many solutions to the
%problem.
