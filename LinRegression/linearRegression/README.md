*** Linear Regression

linearRegression Computes the linear regression of a data set

This could be used to either interpolate or extrapolate a data set, for example it could be used to
predict rainfall during certain times of the year based on previous years

   Compute the linear regression based on inputs:

     1. x: x-values for our data set
     2. y: y-values for our data set

   Outputs:

     1. fX: x-values with outliers removed
     2. fY: y-values with outliers removed
     3. slope: slope from the linear regression y=mx+b
     4. intercept: intercept from the linear regression y=mx+b
     5. Rsquared: R^2, a.k.a. coefficient of determination
