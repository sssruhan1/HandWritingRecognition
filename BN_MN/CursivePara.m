% CSE 574 PROJECT 2 PARAMETER ESTIMATION for Cursive 'and'.  CursivePara()
% Ruhan Sa 50060400
% Functionality: 
%             (1) Estimate the parameters of Cursive 'and' based on BN given.
%             (2) Estimate the paramters of Cursive 'and' under assumption that the variables are all independent.
% Methodology: 
%             Bayesian Estimation
% Return:
%             (1) theta1: parameters for BN.
%             (2) theta2: parameters when variables are independent.
% Assumption: 
%             The parameter's prior distribution is Dirichlet.
%   	      The hyper parameters for Dirichlet is denoted as alpha.
%             The hyperparameter is determined by Laplace estimation, i.e. alpha = k, alpha(i) = 1
% Expression: 
%             The baysian estimation of the parameter should be theta = (M[i] + alpha(i))/(M + alpha);


function [theta1, theta2] = CursivePara(Mv)
% Mv is the feature valued of data truthCursive
% Mvis derived from code [~, ~, Mv] = file2matrix('truthCursive.txt');

total = 3075; % total number of data

%[~, ~, Mv] = file2matrix('truthCursive.txt'); % read the truth of the cursive into matrix

% Calculate the histogram of each variable within given data.
% hist is for parameters under the assumption that all variables are
% independent.
hist = zeros(9, 5); 

% the following hist is for parameters of variable 2, 4, 7, 9 in BN.

% x1 ( the parent) has 4 values. 
% X2 takes 5 values for each of the x1 value.
hist2 = zeros( 4, 5);
% x3 ( the parent) has 3 values.
% x5 ( the parent) has 4 values.
% x4 takes 5 values for each of the above 12 combination.
hist4 = zeros( 3, 4, 5);
% x6 ( the parent) has 4 values.
% x8 ( the parent) has 5 values.
% x7 takes 4 values for each of the above 20 combination.
hist7 = zeros(4, 5, 4);
% x2 ( the parent) has 5 values.
% x4 ( the parent) has 5 values.
% x7 ( the parent) has 4 values.
% x9 takes 3 values for each of the above 100 combination.
hist9 = zeros(5, 5, 4, 3);

for i = 1 : total % accumulate the number of variable values
    for j = 1 : 9 % start from 3 because the 1st and 2nd is writer # and document.
        hist( j , Mv(j, i) + 1 ) = hist( j , Mv(j, i) + 1) + 1;
        % For BN, X2, X4, X7 AND X9 is depend on their parent's value
        % So the histogram should be calculated seperately.
        if ( j == 2 )
            hist2( Mv(1, i) + 1, Mv(2, i) + 1) = hist2( Mv(1, i) + 1, Mv(2, i) + 1) + 1;
        elseif( j == 4 )
            hist4( Mv(3, i) + 1, Mv( 5, i) + 1, Mv( 4, i) + 1) = hist4( Mv(3, i) + 1, Mv( 5, i) + 1, Mv( 4, i) + 1) + 1;
        elseif( j == 7 )
            hist7( Mv( 6, i) + 1, Mv( 8, i) + 1, Mv(7, i) + 1) = hist7 ( Mv( 6, i) + 1, Mv( 8, i) + 1, Mv(7, i) + 1) + 1;
        elseif( j == 9 )
            hist9( Mv( 2, i) + 1, Mv( 4, i) + 1, Mv(7, i) + 1, Mv( 9, i) + 1) =  hist9( Mv( 2, i) + 1, Mv( 4, i) + 1, Mv(7, i) + 1, Mv( 9, i) + 1) + 1;       
       end
	end
end

for i = 1 : 9
	if ( i == 1 || i == 5 || i == 6 || i == 7)
		jtotal = 4;
	elseif( i == 2 || i == 4 || i == 8)
		jtotal = 5;
	else
		jtotal = 3;
    end
    
	% for BN parameters. First figure out the special case, x2, x4, x7, x9.
    if ( i == 2)
        for k = 0 : 3 
            for j = 1 : jtotal
                theta1 ( 2, k * jtotal + j) = ( hist2( k + 1, j)  + 1) / ( sum( hist2( k + 1, : ) ) + jtotal); 
            end
        end
    elseif ( i == 4)
        for k = 0 : 2 % x3
            for n = 0 : 3 % x5
                for j = 1 : jtotal
                    theta1( 4, k * 4 * jtotal  + n * jtotal  + j ) = ( hist4( k + 1, n + 1, j) + 1 ) / ( sum( hist4 (  k + 1, n + 1, : ) ) + jtotal);
                end
            end
        end
    elseif ( i == 7)
        for k = 0 : 3 % x6
            for n = 0 : 4 % x8
                for j = 1 : jtotal
                    theta1( 7, k * 5 * jtotal + n * jtotal + j ) = (hist7( k + 1, n + 1, j ) + 1 ) / (sum ( hist7( k+ 1, n + 1, :)) + jtotal);
                end
            end
        end
    elseif ( i == 9)
        for k = 0 : 4 % x2
            for n = 0 : 4 % x4
                for l = 0 : 3 % x7
                    for j = 1 : jtotal
                        theta1( 9, k * 5 * 4 * jtotal + n * 4 * jtotal + l * jtotal + j ) = (hist9( k + 1, n + 1, l + 1, j) + 1) / (sum(hist9( k + 1, n + 1, l + 1, :)) + jtotal);
                    end
                end
            end
        end
    else % for normal case, where variables don't have parent(s)
        for j = 1 : jtotal
            theta1( i, j ) = ( hist( i, j ) + 1 ) / (total + jtotal);
        end
    end
    % for Parameters under assumption that variables are independent.    
	for j = 1 : jtotal
		theta2( i, j )  = ( hist( i , j ) + 1 )/ (total + jtotal);
    end
    
end

