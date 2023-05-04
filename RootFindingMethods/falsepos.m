function [root, fx, ea, iter] = falsepos(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
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
    error('no sign change within these bounds. Make sure root lies within starting bounds')
end

if nargin < 4 || isempty(es)
    es = 0.0001;
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
    xr = xu-func(xu)*(xl-xu)/(func(xl)-func(xu)); %the new xr is the rise over run beteween the two points
    iter = iter+1; %change iteration
    if xr ~= 0 %error is new minus old over new times 100
        ea = abs((xr-xrold)/xr)*100;
    end
    test = func(xl)*func(xr);
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end
    if ea <= es || iter >= maxit
        break
    end
end
root = xr;
fx = func(xr);
end