%----------------------------------------------------------------------------
%   BB84MONOGAMYGAME: Computes the upper and lower bounds for the
%                     BB84 monogamy game.
%
%        This script computes the value of the BB84 monogamy game [1] by 
%        computing the upper and lower bounds via the methods outlined in
%        [2]. The lower bound method is based on the alternating projection
%        algorithm from [3], while the upper bound is based on the NPA
%        hierarchy [4].
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

% Create the BB84 basis.
e0 = [1;0]; e1 = [0;1];
ep = [1;1]/sqrt(2); em = [1;-1]/sqrt(2); 

psi0 = e0*e0'; psi1 = e1*e1';
psip = ep*ep'; psim = em*em'; 

% Referee's first basis: {|0><0|, |1><1|}
R{1} = {psi0,psi1};

% Referee's second basis: {|+><+|, |-><-|}
R{2} = {psip,psim };

% BB84 game for a single repetition.
reps = 1; 

% Level of the extended NPA hierarchy 
lvl = 1;

% Calculate the lower and upper bounds on the BB84 game:
%   cos^2(pi/8) \approx 0.8536
lb = MonogamyGameValueLB(R,reps,lvl)
ub = MonogamyGameValueUB(R,reps,lvl)