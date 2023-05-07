function [xr] = modsecmethod(xi, d)
%modsecmethod performs one iteration of the modified secant method, using
%a line between point xi and point xi+d, extended to the x-axis, to
%estimate where the root of a function is
%   INPUTS:
%       xi- initial guess at root (Tip: if xi is near a max, min, or point
%       of inflection, the the guess at the root (xr) will be inaccurate)
%       d- distance between xi and xi+d. Defaults to 0.01
% 
%   OUTPUTS:
%       xr- guess at root after one iteration of the modified secant method

if nargin > 2
d = 0.01;
end

syms x
f(x) = input('input function f in terms of x here');

xr = xi-(d*(xi)*f(xi))/(f(xi+d*xi)-f(xi));

format long
disp(xr)

end