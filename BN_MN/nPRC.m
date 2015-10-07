% cse574 PROJECT 2 nPRC for Cursive and Handprint 'and', nPRC(PRC);
% Ruhan Sa 50060400
% This function computes the nPRC(s) for 10 different n values.
% PRC: the PRC of Cursive/Handprint 'and' as a input.
% Return: 10 different nPRCs.

function [nPRC] = nPRC(PRC)
% PRC is computed using function PRC();

N = [10, 50, 100, 300, 500, 1000, 1500, 3000 ];

for i = 1 : 8
    combineN = N(i) * ( N(i) - 1 ) / 2;
    nPRC(i) = 1 - (1 - PRC)^ combineN;
end
