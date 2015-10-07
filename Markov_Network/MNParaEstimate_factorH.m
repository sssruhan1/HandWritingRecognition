% cse 574 project 2 MN parameter estimation of Handprint 'and',  MNParaEstimate_factorH(Mv)
% Ruhan Sa 50060400
% estimate the parameter using factor method
% return: 3-D matrix
%         1st D, factor number
%         2nd D, variable number
%         3rd D, parameter

function [phi, z] = MNParaEstimate_factorH(Mv)
% Mv is the data from given txt file truth Cursive

total = 1135; % the total number of data in dataset
CliqueTotal = 4; % there are 4 cliques in the MN
v1 = 5; % the number of values for variable 1
v2 = 6;
v3 = 5;
v4 = 5;
v5 = 3;
v6 = 5;
v7 = 6;
v8 = 4;
v9 = 3;
phi = ones( 5, 6 * 6 * 5 * 5 * 5);
z = 0; % the normalizer
for i = 1 : total
    % for factor w.r.t. variables 1, 2, 3, 4
    phi(1, Mv(1, i) * v2 * v3 * v4 + Mv(2, i) * v3 * v4 + Mv(3, i) * v4 + Mv(4,i)) = phi(1, Mv(1, i) * v2 * v3 * v4 + Mv(2, i) * v3 * v4 + Mv(3, i) * v4 + Mv(4,i)) + 1;
        
    % for factor w.r.t. variables 2, 3, 5, 9
    phi(2, Mv(2, i) * v3 * v5 * v9 + Mv(3, i) * v5 * v9 + Mv(5, i) * v9 + Mv(9,i) ) =   phi(2, Mv(2, i) * v3 * v5 * v9 + Mv(3, i) * v5 * v9 + Mv(5, i) * v9 + Mv(9,i) ) + 1;
    
    % for factor w.r.t. variables 1, 3, 6, 7
    phi(3, Mv(1, i) * v3 * v6 * v7 + Mv(3, i) * v6 * v7 + Mv(6, i) * v7 + Mv(7,i)) = phi(3, Mv(1, i) * v3 * v6 * v7 + Mv(3, i) * v6 * v7 + Mv(6, i) * v7 + Mv(7,i)) + 1;
    
    % for factor w.r.t. variables 3, 5, 7, 8
    phi(4, Mv(3, i) * v5 * v7 * v8 + Mv(5, i ) * v7 * v8 + Mv(7, i) * v8 + Mv(8,i)) = phi(4, Mv(3, i) * v5 * v7 * v8 + Mv(5, i ) * v7 * v8 + Mv(7, i) * v8 + Mv(8,i))  + 1;

    % for factor w.r.t. variables 1, 2, 3, 5, 7
    phi(5, Mv(1, i) * v2 * v3 * v5 * v7 + Mv(2, i) * v3 * v5 * v7 + Mv(3, i) * v5 * v7 + Mv(5, i) * v7 + Mv(7, i) )= phi(5, Mv(1, i) * v2 * v3 * v5 * v7 + Mv(2, i) * v3 * v5 * v7 + Mv(3, i) * v5 * v7 + Mv(5, i) * v7 + Mv(7, i) ) + 1;
    
end
z = prod(prod(phi)); 