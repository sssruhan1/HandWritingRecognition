% cse 574 project1 p2 gettPhi(K, N)
% Ruhan Sa 50060400
% get the phi for training
% K : NUM. OF CLASS
% N : NUM. OF TRAINING DATA for one class
% output : (N*K), (D+1) phi matrix


function [phi] = gettPhi(K, N)

phi = [];% init phi

for i = 0 : K-1
    tmp = [];
	var = sprintf('XT_%d',i);
    struct = load('train.mat', var);
    XT = struct.(var);
	tmp = [ ones(N,1), XT ];
    phi = [phi; tmp];
end
