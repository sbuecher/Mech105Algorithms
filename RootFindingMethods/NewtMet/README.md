** Newton's Method

newtmethod performs one iteration of Newton's method, using the tangent
line of a function at a point, extended to the x-axis, to estimate where
the root of the function is

   INPUTS
       xi- initial guess at root (Tip: if xi is near a max, min, or point
       of inflection, the the guess at the root (xr) will be inaccurate)
 
   OUTPUTS
       xr- guess at root after one iteration of Newton's method
