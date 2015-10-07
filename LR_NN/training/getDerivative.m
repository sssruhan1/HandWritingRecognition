% CSE 574 Project 1 Part 2 getDerivative( K, N, D, Y, target, phi)
% Ruhan Sa 50060400
% get the derivative of Error function
% K: NUM. OF CLASSES
% N: NUM. OF TRAINING DATA PER CLASS
% Y: PROBABILITY 
% target: TARGET MATRIX
% phi: FEATURE MATRIX
% D: DIMENSION

function [dE] = getDerivative( K, N, D, Y, target, phi)

dE = zeros(D+1, K);
for i = 1 : K
    for j = 1 : N*K
        dE(:, i) = dE( :, i) + (Y(j, i)-target(j, i))* phi(j, :)'; 
    end
end
