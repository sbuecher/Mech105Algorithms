function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%set basic starting info
xl = length(x);
yl = length(y);

n = xl-1;
a = x(1);
b = x(xl);


%check that x is equally spaced
xder = diff(x); %take derivative of x (should all be 1 if equal space)
xderavg = mean(xder); %take avg of derivative (should be 1)
if xderavg ~= 1 %if derivative of x is not equal to 1, throw error
    error('x must be an equally spaced vector')
end

%check for valid input sizes
if xl ~= yl
    error('x and y must be vectors of the same size')
end

%Determine if even or odd number of segments and do each method accordingly
if n == 1
    I = (b-a)*(y(xl-1)+y(xl))/2; 
    fprintf('The integral of the given data is %4.4f', I)
elseif n ~= 1 && mod(n,2) ==0 %if the number of segments is even, do integral
    I = (b-a)*(y(1)+2*sum(y(3:2:yl-1))+4*sum(y(2:2:yl))+y(yl))/(3*n);
    fprintf('The integral of the given data is %4.4f', I)
else %if the number of segments is odd
    disp(['WARNING: the number of segments is odd and the trapezoidal' ...
        ' rule will be used on the last segment'])
   %Rewrite new a and b
    a = x(1);
    b = x(xl-1);
   %Create a1 and b1 for trapezoidal last segment
    a1 = x(xl-1);
    b1 = x(xl);
   %Calculate I1 using Simpson's ending at the second to last point
    I1 = (b-a)*(y(1)+2*sum(y(3:2:yl-2))+4*sum(y(2:2:yl-2))+y(yl-1))/(3*(n-1));
   %Calculate I2 using Trapezoidal with the last two segments
    I2 = (b1-a1)*(y(xl-1)+y(xl))/2;
   %Calculate the total
    I = I1+I2;
    fprintf('The integral of the given data is %4.4f', I)
end



end