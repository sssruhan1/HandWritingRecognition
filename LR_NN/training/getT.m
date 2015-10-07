% cse 574 project1 p2 getT(K, N)
% Ruhan Sa 50060400
% get the target matrix
% K : NUM. OF CLASS
% N : NUM. OF TRAINING DATA for One class

function [target] = getT(K, N)

target = []; 
for i = 1 : K
    temp = zeros( 1, K);
    temp(i) = 1;
    for j = 1 : N
        target = [target; temp];
    end
end


