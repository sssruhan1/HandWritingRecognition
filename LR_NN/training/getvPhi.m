% cse 574 project1 p2 getvPhi(K, N)
% Ruhan Sa 50060400
% get the phi for validating
% K : NUM. OF CLASS
% N : NUM. OF TRAINING DATA for one class


function [phi] = getvPhi(K, N)

phi = [];% init phi

for i = 0 : K-1
    tmp = [];
	var = sprintf('XV_%d',i);
    struct = load('train.mat', var);
    XT = struct.(var);
	tmp = [ ones(N,1), XT ];
    phi = [phi; tmp];
end
