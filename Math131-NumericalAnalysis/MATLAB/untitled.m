clc
%functions
f1 = @(x) exp(-(x.^2));
f2 = @(x) 1./(1+(x.^2));

x =-3:0.01:3;
%function to use plot, same as above but couldn't use the above fucntion
fp1 = exp(-(x.^2));
fp2 = 1./(1+(x.^2));

%x values
datx = -3:1:3;
datx1 = -3:0.5:3;

%fucntiong calls fucntiong 1 & 2 for y values
daty = f1(datx);
daty1 = f2(datx);
daty2 = f1(datx1);
daty3 = f2(datx1);

%function calls
P1= Lagrange_poly(x,datx,daty);
P2 = Lagrange_poly(x,datx,daty1);
P3 = Lagrange_poly(x,datx1,daty2);
P4 = Lagrange_poly(x,datx1,daty3);

%plot of the functions
plot(x, fp1, x, fp2)
hold on
%scatter plot
scatter(x,P1)
scatter(x,P2)
scatter(x,P3)
scatter(x,P4)
hold off


%lables for graphs
legend('Function 1', 'Function 2', 'p1', 'p2', 'p3', 'p4' )

%main function
function y = Lagrange_poly(x,datx,daty)
y = 0;
n = numel(datx); %num of element in datx
L = ones(numel(x), n);

for i=1:n
    for j=1:n
        if (i~=j)
            L(:,i)=L(:,i).*(x'-datx(j))/(datx(i)-datx(j));
        end
    end
end
%Interpolation
for i=1:n
    y=y+daty(i)*L(:,i);
end
end