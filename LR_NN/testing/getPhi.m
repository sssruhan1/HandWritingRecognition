% CSE 574 PROJECT 1 PART2 getPhi
% Ruhan Sa 50060400
% get Phi from feature_test

function [phi] = getPhi(K, N)

phi = [];% init phi

for i = 0 : K-1
    tmp = [];
	var = sprintf('X%d',i);
    struct = load('test.mat', var);
    XT = struct.(var);
	tmp = [ ones(N,1), XT ];
    phi = [phi; tmp];
end
