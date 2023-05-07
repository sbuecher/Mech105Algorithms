** Modified Secant Method

modsecmethod performs one iteration of the modified secant method, using
a line between point xi and point xi+d, extended to the x-axis, to
estimate where the root of a function is

   INPUTS:
       xi- initial guess at root (Tip: if xi is near a max, min, or point
       of inflection, the the guess at the root (xr) will be inaccurate)

       d- distance between xi and xi+d. Defaults to 0.01
 
   OUTPUTS:
       xr- guess at root after one iteration of the modified secant method
