%----------------------------------------------------------------------------
%        MUB_4_3_GAME:     Computes the upper and lower bounds for the
%                          monogamy-of-entanglement game defined by a 
%                          mutually unbiased basis consisting of 4-inputs
%                          and 3-outputs.
%
%        This script computes the value of the mutually unbiased basis 
%        monogamy game [1] by computing the upper and lower bounds via the 
%        methods outlined in [2]. The lower bound method is based on the 
%        alternating projection algorithm from [3], while the upper bound 
%        is based on the NPA hierarchy [4].
%
% Requires: CVX[5], QETLAB[6] 
%
% References: [1] "A monogamy of entanglement game with applications to
%                  device independent cryptogtaphy" - M. Tomamichel, 
%                  S. Fehr J. Kaniewski, S. Wehner.  
%
%             [2] "Extended nonlocal games and monogamy-of-entanglement 
%                 games" - N. Johnston, R. Mittal, V. Russo, J. Watrous.
%
%             [3] "Bounds of quantum correlations in Bell inequality experiments" - 
%                  YC. Liang, A. Doherty.
%
%             [4] "A convergent hierarchy of semidefinite programs characterizing
%                  the set of quantum correlations" - M. Navascues S. Pironio, 
%                  A. Acin.
%           
%             [5] CVX - (http://cvxr.com/cvx/)
%
%             [6] QETLAB v 0.8 (http://qetlab.com)
%----------------------------------------------------------------------------
clear all 

% Create the mutually unbiased bases consisting of 4-inputs and 3-outputs.
load('MUB_4_3.mat');

% Number of repetitions of the game. 
reps = 1; 

% Level of the extended NPA hierarchy.
lvl = 1;

% Calculate the lower and upper bounds on the quantum value of
% the mutually unbiased basis game:
lb = MonogamyGameValueLB(R,reps,lvl)
ub = MonogamyGameValueUB(R,reps,lvl)