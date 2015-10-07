% CSE 574 PROJECT 2 to get the nPRC of the Most Common and Most Rare cases.
% Ruhan Sa 50060400
% This function computes the nPRC for given Most Common & Rare cases using
% 10 set of different N numbers.

function [nPRCmax, nPRCmin] = nPRCMaxMin(MaxP,MinP)
% MaxP is the most common case probability
% MinP is the most rare case probability

N = [10, 50, 100, 300, 500, 1000, 1500, 3000 ];

for i = 1 : 8 
    nPRCmax(i) = 1- (1 - MaxP)^(N(i) - 1);
    nPRCmin(i) = 1 - (1 - MinP)^(N(i) - 1);
end