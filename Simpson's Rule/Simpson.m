function [I] = Simpson(x,y)
%{
Michael Skotynsky
Mech. 105
Dr. B
4/19/2019
Homework 21
---------------------------------------------------------------------------
Function that integrates experimental data using Simpson's 1/3 rule. If
there is an odd number of intevals, then the trapezoidal rule is
implimented to fill the extra area.
---------------------------------------------------------------------------
Simpson's 1/3 Rule: I = h/3*(y(initial)+2*y(sum of Evens))+4*y(sum of Odds)+y(final)
Trapezoidal Rule: I = (h/2)*(y(initial)+y(final))
---------------------------------------------------------------------------
Input:
x - x values row matrix
y - y values row matrix

Outputs:
I - Integral
%}

%% Setting Values
n = numel(x); %Number of elements
mins = min(x); %Finds minimum value
maxs = max(x); %Finds maximum value
sizex = length(x); %Finds size of x matrix
sizey = length(y); %Finds size of y matrix
delta = diff(x); %Determines the difference between each term
h = delta(1); %Spacing between elements

%% Error and Warnings:
    if nargin ~= 2 %Making sure that there is only two inputs
        error('Must have only an x and y input')
    elseif sizex ~= sizey %Making sure that both inputs are the same length
        error('Inputs must be same length')
    elseif range(delta) ~= 0 %making sure that there is equal spacing between terms
        error('Must be equal spacing between terms')
    end

    if rem(length(n), 2) ~= 1 %Letting user know if the trapeziodal rule will be used
        warning('Trapezoidal Rule will be used because of odd number of segments')
        iseven = 0; %Determining if there is an even amount of terms
    else
        iseven = 1; %Determining if there is an even amount of terms
    end
    
%% Simpson's 1/3 Rule and Trapezoidal Rule
    if iseven == 1 %if there is an even number of terms | Simpson's and Trapeziodal Rule
        I = y(1) + y(length(y));
        for odd = 2:2:length(y)-2
            I = I + y(odd)*4;
        end
        for even = 3:2:length(y)-2
            I = I + y(even)*2;
        end
        I = I*(h/3);
        I = I + (h/2)*(y(length(y))+y(length(y)-1)); %Adding Simpson's to Trapezoidal
    else %If there is an odd number of terms | only Simpson's Rule
        I = y(1);
        for odd = 2:2:length(y)-1
            I = I + y(odd)*4;
        end
        for even = 3:2:length(y)-1
            I = I + y(even)*2;
        end
        I = I + y(length(y));
        I = I*(h/3); %Finalizing Simpson's
    end
end