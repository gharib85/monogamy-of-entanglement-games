%--------------------------------------------------------------------------
% 	MONOGAMYGAMEVALUEUB: 	Computes the upper bound of the quantum 
%						    value of a monogamy-of-entanglement game 
%	This function has 1 required argument:
%		R: a cell array consisting of the bases for the referee.	
%
% 	UB = MONOGAMYGAMEVALUEUB(R) is the upper bound quantum value in a 
%   monogamy-of-entanglement game. This value is obtained by the hierarchy
%   of semidefinite programs as described in [3]. 
%
%	This function has two option input arguments:
%		REPS: the number of parallel repetitions performed.
%		LVL: The level of the NPAR hierarchy. 
%		
%	UB = MONOGAMYGAMEVALUEUB(R,REPS,LVL) is the 
%   lower bound quantum value as above, but now the precision may be 
%   adjusted by how many times the alternating projection algorithm is run. 
%		           
% Requires:   CVX[4], QETLAB[5]
%
% References: [1] "A convergent hierarch of semidefinite programs
%                  characterizing the set of quantum correlations" - M.
%                  Navascues, S. Pironio, A. Acin. 
%
%             [2] "A monogamy-of-entanglement game with applications to
%                  device-independent quantum cryptography - M. Tomamichel,
%                  S. Fehr, J. Kaniewski, S. Wehner.
%
%             [3] "Extended nonlocal games and monogamy-of-entanglement 
%                 games" - N. Johnston, R. Mittal, V. Russo, J. Watrous.
%
%             [4] CVX - (http://cvxr.com/cvx/)
%             
%             [5] QETLAB v 0.8 (http://qetlab.com)
%--------------------------------------------------------------------------

function ub = MonogamyGameValueUB(R,varargin)

    % set optional argument defaults: REPT=1, LVL=1
    [rept,lvl] = opt_args({ 1, 1 },varargin{:});
    
    % Get some basic values and make sure that the input vectors are column
    % vectors.
    num_bases = length(R);
    num_outcomes = length(R{1});
    [xdim,ydim] = size(R{1}{1});
    
    % Now tensor things together if we are doing more than 1 repetition
    if(rept > 1)
        i_ind = zeros(1,rept);
        j_ind = zeros(1,rept);
        
        for i = 1:num_bases^rept
            for j = 1:num_outcomes^rept
                for l = rept:-1:1
                    to_tensor{l} = R{i_ind(l)+1}{j_ind(l)+1};
                end
                newR{i}{j} = Tensor(to_tensor);
                
                j_ind = update_odometer(j_ind,num_outcomes*ones(1,rept));
            end
            i_ind = update_odometer(i_ind,num_bases*ones(1,rept));
        end
        R = newR;
        
        % Recalculate.
        num_bases = length(R);
        num_outcomes = length(R{1});
        [xdim,ydim] = size(R{1}{1});
    end
    
    % Now set up the referee game.
    p = eye(num_bases)/num_bases;
    V = zeros(num_outcomes,num_outcomes,num_bases,num_bases,xdim,ydim);
    for i = 1:num_outcomes
        for j = 1:num_bases
            V(i,i,j,j,:,:) = R{j}{i};
        end
    end

    % Now actually do the hard work; use the modified NPA hierarchy (or
    % whatever other method) to compute the value of this game.
    ub = RefereeGameValue(p,V,lvl);
end