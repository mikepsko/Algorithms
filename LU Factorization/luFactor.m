function [L, U, P] = luFactor(A)
%{
Michael Skotynsky
Mech. 105
Dr. B
4/3/2019
Homework 16

Function that performes LU Factorization of a square matrix by using
partial pivoting to find a lower and upper triangular matrix along with a
pivoting matrix.

Input:
A - Coefficient matrix

Outputs:
A - Coefficient matrix
L - Lower triangular matrix
U - Upper triangular matrix
P - The pivot matrix
%}
%%
format short
%Setting the matrix to be a n (row) by m (column) matrix
[n,m]=size(A);
%To make sure that there are a proper amount of input arguments
    if nargin ~= 1
        error('You can only have one input: luFactor(A)')
    elseif n~=m
        error('Matrix must be a square')
    end
%%
%Setting L and P to the identity matrix (ones along the diagonal)
    L = eye(n);
    U = A;
    P = eye(n);
 %%
 %Finding the highest coefficient to pivot to the top 
    for i = 1:n-1
        pivot = max(abs(U(i:n,i)));
        for x = i:n
            if abs(U(x,i)) == pivot %Uses absolute value to find maximum coefficient
                piv = x;
            end
        end
%Pivoting the U,L and P matrix to get the highest coefficient to the top of matrix
        L([i,piv],1:i-1) = L([piv,i],1:i-1);
        U([i,piv],i:m) = U([piv,i],i:m);
        P([i,piv],:) = P([piv,i],:);
%Creating the new L and U matrix
        for x = i+1:n
            L(x,i) = U(x,i)/U(i,i);
            U(x,i:n) = U(x,i:n)-L(x,i)*U(i,i:n);
        end
    end
%%
%Displaying answers neatly
disp('Origional Matrix:')
A
disp('Lower Triangular Matrix:')
L
disp('Upper Triangular Matrix:')
U
disp('Pivot Matrix:')
P
%{
%This checks to make sure that L*U = A
disp('L*U = A Matrix')
A1 = L*U
%}
end