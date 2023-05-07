function [root, fx, ea, iter] = bisectionMethod(func, xl, xu, es, maxit)
%bisectionMethod uses the bisection method to determine the root of a
%function
%
%Inputs:
%   func: name of function
%   xl, xu: lower and upper bounds
%   es: desired absolute error (default = 0.05)
%   maxit: max no of iterations (default = 50)
%Outputs:
%   root: root estimate
%   fx: function value at root estimate
%   ea: approx absolute error
%   iter: number of iterations

if nargin < 3 %need at least 3 inputs
    error('at least 3 arguments required')
end
%test to make sure there is a sign change and the root
% lies within the bounds given
test = func(xl)*func(xu);
if test > 0
    error(['no sign change within these bounds. Make sure root ' ...
        'lies within starting bounds'])
end

if nargin < 4 || isempty(es)
    es = 0.05;
end
if nargin < 5 || isempty(maxit)
    maxit = 200;
end

%initialize the function
iter = 0;
xr = xl;
ea = 100;

%Find the root
while(1)
    xrold = xr;
    xr = (xl+xu)/2; %xr is point bisecting xl and xu
    iter = iter+1; %change iteration
    %find relative error between last guess and current guess
    if xr ~= 0
        ea = abs((xr-xrold)/xr)*100; 
    end
    %if xl or xu has same sign as xr, change old xl or xu to xr
    test = func(xl)*func(xr);
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end
    % go until error condition is met or max iterations is reached
    if ea <= es || iter >= maxit
        break
    end
end
root = xr;
fx = func(xr);
disp(iter)
