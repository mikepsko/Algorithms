# Simpson's Rule Algorithm:
- The function Simpson integrates experimental tabulated data using Simpson's 1/3 Rule. This function determines if there is an odd or even number of intervals, where if there is an odd number, the Trapezoidal Rule will be used for the last interval. If the Trapezoidal Rule is used, a warning will appear letting the user know that it will be used.

### Inputs:
- x: x-values of row matrix
- y: y-values of row matrix

### Outputs:
- I: integral

#### Limitations: 
- Must only have two inputs (x and a y)
- 'x' and 'y' must be the same length
- Spacing between the terms must be equal
- If odd number of intervals, a warning will be shown to let the user know that the Trapezoidal Rule will be used
