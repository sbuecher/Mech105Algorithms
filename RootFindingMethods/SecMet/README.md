**Secant Method

secmethod performs one iteration of the secant method, using a line
between point x1 and x2, extended to the x-axis, to estimate where the
root of a function is

   INPUTS
       x1- x-value of a point on f(x)
 	
       x2- x-value of a point on f(x)
 
       (Tip: if x1 and x2 are near a max, min, or point of inflection, the 
       guess at the root (xr) will be inaccurate)
 
   OUTPUTS
       xr- guess at root after one iteration of the secant method
