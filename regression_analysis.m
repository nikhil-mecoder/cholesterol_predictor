clear all;
close all;
clc;
model = importdata("data.xlsx");
train_data = model.data;
cholesterol = train_data(:,1);   %label
correlation = train_data(:,2);   %input

%% Regression model Y = a+bX
x = correlation;
y = cholesterol;
n = numel(correlation);
b = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-sum(x)^2);
a = (sum(y)-b*sum(x))/n;

scatter(x,y,"o","linewidth",1.5);
hold on
iter = linspace(0.5,1,100);
for i = 1:length(iter)
    X(i) = iter(i);
    Y(i) = a+b*X(i);
    plot(X,Y,"linewidth",2.5);
end
title("Regression Plot");
xlabel("Correlation");
ylabel("Cholesterol");
hold off

%% Errors
for i = 1:n
    Y_i(i) = a + b*x(i);
end
sse = sum((y'-Y_i).^2);  %Error sum of square 
sst = sum((y'-mean(y)).^2);     %Total sum of squares
ssr = sst-sse;     %Regression sum of square
Rsq = ssr/sst;    %coefficient of determination
mse = sse/(n-2);   %Mean square error
see = sqrt(mse);   %Standard error estimate
