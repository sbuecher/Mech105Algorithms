% Linearization of non-linear functions
%Takes data set, scales it by log10 or natural log, and plots data and fits
%a linear regression line to it
clc
clear

%data set
t = 4:4:24;
c = [1600 1320 1000 890 650 560];

%linearizing to log10
logc = log10(c);
logregline = polyfit(t, logc, 1);
w = @(x) x*logregline +logregline(2);
figure 
plot(t, logc, 'r*')
hold on
fplot(w)
title ('LOG E coli concentration')
xlabel('time(hr)')
ylabel('log concentration')
grid
legend('log','logregline', 'oddity') %idk where the yellow line comes from
hold off


%linearlizing to natural log
lnc = log(c);
lnregline = polyfit(t, lnc, 1);
w = @(x) x*lnregline +lnregline(2);
figure 
plot(t, lnc, 'r*')
hold on
fplot(w)
title ('LN E coli concentration')
xlabel('time(hr)')
ylabel('ln concentration')
grid
legend('ln','lnregline', 'oddity') %idk where the yellow line comes from
hold off