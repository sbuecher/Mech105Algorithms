function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix


%Check for errors
%check for square matrix
[M, N] = size(A);
if M ~= N
    error('matrix must be square: length and width must have same dimenstions')
end
%check for matrix values
l = length(A);
Z = zeros(l);
if A == Z
    error('matrix must contain values')
end

%Initialize Matrix
P = eye(l); %make identity matrix for P
L = eye(l); %make identity matrix for L
U = A; %Set U as A

%Forward Elimination
for index = 1: l-1
    %Find the Column of Interest to find the pivot point, exclude previous
    %row
    ColOfI= abs(U(index:end,index));
    %Find pivot point by finding the max term of the column of interest,
    %and then adding the index value and subracting 1 to scale the index of
    %the column of interest to the index of the whole A matrix
    PivPoint = find(ColOfI == max(ColOfI)) + index -1;
    %Pivot by swapping desired row with current top row
    P([index PivPoint], :) = P([PivPoint index], :);
    U([index PivPoint], :) = U([PivPoint index], :);
    %to swap the terms in L
    if index ~= 1 %keep first row of L the same
        %swap only the lower diagonal elements of L
        L([index PivPoint], 1:index-1) = L([PivPoint index], 1:index-1);
    end

    %Back substitution
    for index2 = index +1:length(A)
        f = (U(index2, index)/U(index, index)); % a21/a11
        %set L terms based on multiplication factors (AKA S21/a11)
        L(index2, index) = f;
        %take new equation 2 and subtract from old equation 1 and replace
        U(index2, :) = U(index2, :) - (f*(U(index, :)));
    end
end
end