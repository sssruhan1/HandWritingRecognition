% CSE 574 project1 p2 getY(K, N, W, phi)
% Ruhan Sa 50060400
% get the Y matrix
% K : NUM. OF CLASS
% N : NUM. OF TRAINING DATA for One class
% W : Current W
% phi : Current phi

function [Y] = getY( K, N, W, phi)

Y = [];

for i  = 1 : N*K
    
    denominator = 0;
    for j = 1 : K
        denominator = denominator + exp(W(:, j)' * phi(i, :)');
    end
    for j = 1: K
        numerator = exp(W(:, j)' * phi(i, :)');
        Y(i, j) = numerator/denominator;
    end
end