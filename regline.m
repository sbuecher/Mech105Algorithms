% Stuart Buecher
% 3-6-23
% inputs: x values, y values
%outputs: 

%Time (s)
x = [10 15 20 25 40 50 55 60 75];

%Tensile Strength (mPa)
y = [5 20 18 40 33 54 70 60 78];

%regression line
a = polyfit(x, y, 1);

%Find r^2 value
st = sum((y-mean(y)).^2);
sr = sum((y-a(2)-a(1).*x).^2);
rsq = (st-sr)/st;

% estimate tensile strength at 32 min
timeguessmin = 32;
timeguesssec = 32*60;
guess = polyval(a, timeguesssec);

%display values
fprintf('equation for line of best fit: y= %f x + %f \n', a(1), a(2))
fprintf('r squared value is %f \n',rsq)
fprintf('guess value in mins %f', guess)


