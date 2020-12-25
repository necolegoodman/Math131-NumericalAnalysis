f1=  @(x) exp(-(x.^2)) %function definition
f1p = exp(-x.^2); % to help with the plot of the function above
datx = -3:1:3;
x = -3:0.01:3;
daty = f1(datx);

P5 = Newtons_Divided_Differences(x, datx, daty);

plot(x, f1p) %plot of the function
hold on
scatter(x, P5)

function y = Newtons_Divided_Differences(x, datx, daty);

s = numel(datx); %number of things in datx

for i = 1:s
    R(i,1) = daty(i);
end

for k = 2: s %upper matrix
    for j = 1:s-k+1
        R(j,k) = (R(j+1, k-1) - R(j, k-1)) / (datx(j+k-1) - datx(j));
    end
end

y = daty(1); % the initialization
for i = 2:s
    product = 1;
    for k = 1: i-1
        product = product .*(x'- datx(k));
    end
    y = y + (product .* R(1,j));
end
end
