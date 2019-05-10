# False Position Algorithm
This function was named falsePosition where it estimates the root of a given function.

### Inputs:
- func: the funciton being evaluated
- xl: the lower guess
- xu: the upper guess
- es: the desired relative error (defaults to 0.0001%)
- maxiter: the number of iterations desired (defaults to 200)

### Outputs:
- root: the estimated root location
- fx: the function evaluated at the root location
- ea: the approximate relative error (%)
- iter: how many iterations were performed

#### Limitations:
- must have at least three inputs but also must have less than 5 inputs
- 'xl' must be lower than 'xu'
- the signs of the function at 'xl' and 'xu' must have opposite signs

#### Possible errors:
- I cam across the error, where if you wanted to enter 'maxiter' but not 'es,' you couldn't.
