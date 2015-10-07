% cse 574 project 2 MN parameter estimation of cursive 'and',  MNParaEstimate_factorH(Mv)
% Ruhan Sa 50060400
% estimate the parameter using factor method
% return: 3-D matrix
%         1st D, factor number
%         2nd D, variable number
%         3rd D, parameter

function [phi, z] = MNParaEstimate_factorC(Mv)
% Mv is the data from given txt file truth Cursive

total = 3075; % the total number of data in dataset
CliqueTotal = 4; % there are 4 cliques in the MN
v1 = 4; % the number of values for variable 1
v2 = 5;
v3 = 3;
v4 = 5;
v5 = 4;
v6 = 4;
v7 = 4;
v8 = 4;
v9 = 3;
phi = ones( 7, 6 * 6 * 5 * 5);
z = 0; % the normalizer
for i = 1 : total
    % for factor w.r.t. variables 1, 3, 5, 6
    phi(1, Mv(1, i) * v3 * v5 * v6 + Mv(3, i) * v5 * v6 + Mv(5, i) *  v6 + Mv(6,i) + 1) = phi(1, Mv(1, i) * v3 * v5 * v6 + Mv(3, i) * v5 * v6 + Mv(5, i) *  v6 + Mv(6,i) + 1) + 1;
        
    % for factor w.r.t. variables 3, 4, 5, 6
    phi(2, Mv(3, i) * v4 * v5 * v6 + Mv(4, i) * v5 * v6  + Mv(5, i) * v6 + Mv(6,i) + 1) =   phi(2, Mv(3, i) * v4 * v5 * v6 + Mv(4, i) * v5 * v6  + Mv(5, i) * v6 + Mv(6,i) + 1 ) + 1;
    
    % for factor w.r.t. variables 3, 4, 5, 8
    phi(3, Mv(3, i) * v4 * v5 * v8 + Mv(4, i) * v5 * v8  + Mv(5, i) * v8 + Mv(8,i) + 1 ) = phi(3, Mv(3, i) * v4 * v5 * v8 + Mv(4, i) * v5 * v8  + Mv(5, i) * v8 + Mv(8,i) + 1 ) + 1;
    
    % for factor w.r.t. variables 5, 7, 8
    phi(4, Mv(5, i) * v7 * v8  + Mv(7, i) * v8 + Mv(8,i) + 1) = phi(4, Mv(5, i) * v7 * v8  + Mv(7, i) * v8 + Mv(8,i) + 1)  + 1;

    % for factor w.r.t. variables  2, 3, 5
    phi(5, Mv(2, i) * v3 * v5 + Mv(3, i)  * v5 + Mv(5, i) +1 )= phi(5, Mv(2, i) * v3 * v5 + Mv(3, i)  * v5 + Mv(5, i) + 1 ) + 1;
       
    % for factor w.r.t. variables  4, 7, 8
    
    phi(6, Mv(4, i) * v7 * v8 + Mv(7, i)  * v8 + Mv(8, i) +1 )= phi(6, Mv(4, i) * v7 * v8 + Mv(7, i)  * v8 + Mv(8, i) +1 ) + 1;

    % for factor w.r.t. variables  9
    phi(7, Mv(9,i) + 1) = phi(7, Mv(9,i) + 1) + 1;
    
end
z = prod(prod(phi)); 