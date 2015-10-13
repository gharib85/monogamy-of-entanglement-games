# MoE
## Version 0.0.1 - 25 September 2015

MoE is a set of MATLAB scripts that supplement the results of the article [2]. 

To run in MATLAB, add the ```/src/``` directory (including all sub-directories) to your current working directory. 

---
MoE is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

MoE is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

---

## Dependencies
In order to run these scripts in MATLAB, you must also have CVX [3] and QETLAB [4] downloaded and added to your ```/src/``` directory. 

## Description

This set of scripts allows one to bound the quantum game values for monogamy of entanglement games.  

## Use

The purpose of these scripts are to provide a way to compute upper and lower bounds on a specific type of extended nonlocal game called 
monogamy-of-entanglement games. These games are defined in terms of a set of measurements for the referee to be performed on its system. 

Let's take an example (which is baed on the BB84MonogamyGame in ```src/examples/BB84MonogamyGame.m```. Our choice of basis for this example
will be the BB84 basis, i.e. {|0><0|, |1><1|} and {|+><+|, |-><-|}. 

``` 
e0 = [1;0]; e1 = [0;1]; ep = [1;1]/sqrt(2); em = [1;-1]/sqrt(2); 
psi0 = e0*e0'; psi1 = e1*e1'; psip = ep*ep'; psim = em*em'; 
``` 

So we have that ```psi0``` = |0><0|, ```psi1``` = |1><1|, ```psip``` = |+><+|, and ```psim``` = |-><-|. We store these elements into a cell array
that represents the measurements of the referee as 

```
R{1} = {psi0,psi1}; R{2} = {psip,psim}; 
```

We may then put this into our functions that compute upper and lower bounds on a monogamy-of-entanglement game defined by these measurements:

```
ub = MonogamyGameValueUB(R,1,1); 
lb = MonogamyGameValueLB(R,1,1); 
```

More information on the BB84 game can be found in references [1] and [2], and more information on our bounding techniques can be found in [2]. 

## Examples

### BB84 Monogamy Game

Running the script: ```examples/BB84MonogamyGame.m``` computes the upper and lower bounds for the BB84 monogamy game [1] using the techniques from [2].

### Mutually Unbiased Basis Monogamy Game

Running the script: ```examples/MUB_4_3_MonogamyGame.m``` illustrates a monogamy game defined by a set of mutually unbiased bases consisting of 4-inputs and 3-outputs 
where the players benefit from using entanglement as described in [2].

### References:

[1] "A monogamy of entanglement game with applications to device independent
      quantum cryptography" - M. Tomamichel, S. Fehr, J. Kaniewski, S. Wehner.
	  (arxiv:1210.4359)

[2] "Extended nonlocal games and monogamy-of-entanglement games" - N. Johnston,
     R. Mittal, V. Russo, J. Watrous. (arxiv:1510.02083)
	 	 
[3] CVX - (http://cvxr.com/cvx/)

[4] QETLAB v0.8 - (http://qetlab.com)	 