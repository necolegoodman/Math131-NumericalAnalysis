f1 =@(x) exp(-(x.^2)); 

x=[-3 :0.01 :3];

f1p = exp(-x.^2); %need it for the plot function

datx=[-3: 1 :3];
daty=f1(datx);

%function call
P5 = Newtons_divided_differences(x,datx,daty);

%plot of function and p1 
plot(x,f1p)
hold on
scatter(x,P5)

%legend for graph
legend('Function', 'f1')

function y = Newtons_divided_differences(x,datx,daty);

n = numel(datx);%number of element in datx
%filling in fist  col of the matrix
for i=1: n %From the lecture notes
    F(i, 1) = daty(i);
end

% upper tri matrix
for k = 2:n 
for j = 1: n-k+1
   F(j,k)= (F(j+ 1, k-1) - F(j, k-1))/ (datx(j+k-1) - datx(j));
end
end

%The above two for loops are from the lecture notes

y = daty(1); %initialize
for i=2:n
    product = 1; %each iteration product is set to 1
   for k = 1: i-1
    product = product .*(x'-datx(k)); %worked with Charlie to figure this out
   end
   y = y + (product .* F(1,i));   
end
end