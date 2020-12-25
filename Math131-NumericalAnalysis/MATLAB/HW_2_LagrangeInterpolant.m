datx = -3:1:3;
datx1 = -3:0.5:3;


x = -3:0.01:3;
f1 = @(x) exp(-(x.^2));
f2 = @(x) 1./(1+(x.^2));
fp1 = exp(-(x.^2));
fp2 = 1./(1+(x.^2));

daty1 = f1(datx);
daty2 = f2(datx);
daty3 = f1(datx1);
daty4 = f2(datx1);

P1 = Lagrange_poly(x,datx,daty1);
P2 = Lagrange_poly(x,datx,daty2);
P3 = Lagrange_poly(x,datx1,daty3);
P4 = Lagrange_poly(x,datx1,daty4);

plot(x, fp1, x, fp2)
hold on
scatter(x,P1)
scatter(x,P2)
scatter(x,P3)
scatter(x,P4)
hold off

legend('Function 1','Function 2', 'p1','p2','p3','p4')

function y = Lagrange_poly(x,datx,daty)
y = 0;
s= numel(datx);
n = ones(numel(x),s);

for i = 1:s
    for j = 1:s;
    if (i ~= j)
        
        n(:,i) = n(:,i).*(x'-datx(j))/ (datx(i)-datx(j));
    end
end

end
for i = 1:n %Interpolation Part
    y = y + daty(i)*n(:,i);
end
end

%Results
%datx = [-3,-2,1,0,1,2,3], daty = [1.2341e-04];
