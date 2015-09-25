% This file demonstrates that the quantum strategy provided in
% MUB_4_3_quantum_LB.mat indeed gives a probability of about 0.660986 of
% winning the MUB monogamy of entanglement game, as claimed in the proof of
% Theorem B.1

clear all 

num_inputs = 4;
num_outputs = 3;

load('MUB_4_3_quantum_LB.mat');

quantum_lb=0;
for x = 1:num_inputs
    for a = 1:num_outputs
        quantum_lb = quantum_lb + phi'*Tensor(R{x}{a},A{x}{a},B{x}{a})*phi;
    end
end
quantum_lb = real(quantum_lb / num_inputs)