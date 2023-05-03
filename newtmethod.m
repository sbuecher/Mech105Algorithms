function [xr] = newtmethod(xi)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


syms f(x)
f(x) = tanh(x^2-9);
dx(x) = diff(f);

xr = xi-(f(xi)/dx(xi));

disp(xr)



end