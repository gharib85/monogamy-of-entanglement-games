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

You should have received a copy of the GNU General Public License along with MoE. If not, see <http://www.gnu.org/licenses/>.
---

## Dependencies
In order to run these scripts in MATLAB, you must also have CVX [3] and QETLAB [4] downloaded and added to your ```/src/``` directory. 

## Description

This set of scripts allows one to bound the quantum game values for monogamy of entanglement games.  

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

[2] "Upper bounding the quantum value of extended-nonlocal games" - N. Johnston,
     R. Mittal, V. Russo, J. Watrous. (arxiv:)
	 
[3] CVX - (http://cvxr.com/cvx/)

[4] QETLAB v0.8 - (http://qetlab.com)	 