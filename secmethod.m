function [xr] = modsecmethod(xi1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
d = 0.01;

syms f(x)
f(x) = x^3-6*x^2+11*x-6.1;

xr = xi1-(d*(xi1)*f(xi1))/(f(xi1+d*xi1)-f(xi1));

format long
disp(xr)



end