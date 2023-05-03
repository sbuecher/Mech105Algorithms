function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

%check to see if x and y are the same size
sizex = size(x);
sizey = size(y);
if sizex ~= sizey
    error('Size of array x must be the same as the size of array y')
end
%sort the values
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

%save number of data points to n
n = size(sortedY);

%Find the index values for Q1 and Q3
Q1indx = floor((n(2)+1)/4); %Index of Q1 is the number of points plus 1 divided by 4
Q3indx = floor((3*n(2)+3)/4); %Index of Q3 is 3 times number of data points plus 3 divided by 4
%Find the y-values associated with those indexes
Q1 = sortedY(Q1indx); %the value of Q1 is the value at sortedY of the index
Q3 = sortedY(Q3indx); %the value of Q3 is the value of sortedY of the index
%Find IQR
IQR = Q3-Q1;

%Eliminate outliers
%initialize
fX = sortedX;
fY = sortedY;
%go through each data point
for index = 1:n(2)
    %if the y value for the data point is less than or greater than the
    %specified criteria, then throw out the value as an outlier
    if sortedY(index) < Q1-1.5*IQR || sortedY(index) > Q3+1.5*IQR
            fX(index) = [];
            fy(index) = [];
   %if not, include the data point
    else
        fy(index) = sortedY(index);
        fX(index) = sortedX(index);
    end
end

%reassign number of data points to n 
n = size(fy);

%calculate linear regression line
%find average y and x values
avgy = mean(fy);
avgx = mean(fX);
%find necessary values
sxy  = sum(fX.*fy); %sum of (x times y)
sx = sum(fX); %sum of x
sy = sum(fy); %sum of y
sx2 = sum(fX.^2); %sum of (x squared)
%solve for a1(slope) and a0(y-int)
slope = ((n(2)*sxy)-(sx*sy))/((n(2)*sx2)-((sx)^2));
intercept = avgy-slope*avgx;
%write equation of line
regline = @(z) z*slope + intercept;

%find coefficient of determination
%calculate total sum of squares
sstot = sum((fy-avgy).^2);
%calculate sum of sq of res
ssres = sum((fy-regline(fX)).^2);
%calculate coefficient of deremination (Rsquared)
Rsquared = (1-(ssres/sstot));

end