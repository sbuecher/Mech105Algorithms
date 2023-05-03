% Root finding problem
% Stuart Buecher
% 2-24-23

% Define problem constants
g = 9.81;
mu = 0.55;
F = 150;
m = 25;

%Switch format to long
format long

% Define the function to be solved for. Is the angle specified in radians or degrees?
syms f(theta)
f(theta) = (mu*m*g)/(cosd(theta)+mu*sind(theta))-F;

% THINK, what makes range sense for angle?
lower_bound = 0;
upper_bound = 90;

% Plot your function. Does plotting give you an idea about where the root is?
fplot(f,[0 90])

% Finaly solve for the root using the bisection script given to you, which can be called as:
%[root, fx, ea, iter] = bisect(func, lower_bound, upper_bound);
[root, fx, ea, iter] = bisectionMethod(f, lower_bound, upper_bound);

angle = root;

fprintf('the angle is %.4f degrees\n', angle)
fprintf('the function value at my solved angle is %.8f\n', fx)
fprintf('the bisection error estimate is %.4f\n', ea)
fprintf('the number of iterations is %d\n', iter)
% These variables will be checked for your final answer:
%angle =  % the angle in degree that solves this problem
%fx =     % the function value at your solved angle
%ea =     % the bisection error estimate
%iter =   % the number of bisection iterations