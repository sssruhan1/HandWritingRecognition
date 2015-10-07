% CSE 574 PROJECT 2 PARAMETER ESTIMATION for Handprint 'and'.  HandprintPara()
% Ruhan Sa 50060400
% This file is pretty similar with my CursivePara.m file, only some of the parameters have been changed.
% Functionality: 
%             (1) Estimate the parameters of Handprint 'and' based on BN given.
%             (2) Estimate the paramters of Handprint 'and' under assumption that the variables are all independent.
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


function [theta1, theta2] = HandprintPara(Mv)
% Mv is the feature value of Handprint derived by [~, ~, Mv] = file2matrix('truthHandprint.txt');

total = 1135; % total number of data

% [~, ~, Mv] = file2matrix('truthHandprint.txt'); % read the truth of the cursive into matrix

% Calculate the histogram of each variable within given data.
% hist is for parameters under the assumption that all variables are
% independent.
hist = zeros(9, 6); 

% the following hist is for parameters of variable 1, 2, 4, 5,  6, 7, 8 in BN, who has parent(s). 

% x6 ( the parent) has 5 values.
% x8 ( the parent) has 4 values.
% x5 ( the parent) has 3 values.
% x1 takes 5 values for each of the above combinations.
hist1 = zeros(5, 4, 3, 5);
% x3 ( the parent) has 5 values.
% x5 ( the parent) has 3 values.
% x2 takes 6 values for each of the above combinations.
hist2 = zeros( 5, 3, 6);
% x2 ( the parent) has 6 values.
% x3 ( the parent) has 5 values.
% x4 takes 5 values for each of the above combinations.
hist4 = zeros( 6, 5, 5);
% x3 ( the parent) has 5 values.
% x5 takes 3 values for each of the above combinations.
hist5 = zeros(5, 3);
% x2 ( the parent) has 6 values.
% x5 ( the parent) has 3 values.
% x6 takes 5 values for each of the above combination.
hist6 = zeros(6, 3, 5);
% x3 ( the parent) has 5 values.
% x4 ( the parent) has 5 values.
% x6 ( the parent) has 5 values.
% x7 takes 6 values for each of the above combinations.
hist7 = zeros(5, 5, 5, 6);
% x5 ( the parent) has 3 values.
% x6 ( the parent) has 5 values.
% x8 takes 4 values for each of the above combinations.
hist8 = zeros(3, 5, 4);

for i = 1 : total % accumulate the number of variable values
    for j = 1 : 9 % start from 3 because the 1st and 2nd is writer # and document.
        hist( j , Mv(j, i) + 1 ) = hist( j , Mv(j, i) + 1) + 1;
        % For BN, X2, X4, X7 AND X9 is depend on their parent's value
        % So the histogram should be calculated seperately.
        if ( j == 1 )
            hist1( Mv( 6, i) + 1, Mv( 8, i) + 1, Mv( 5, i) + 1, Mv(1, i) + 1) = hist1( Mv( 6, i) + 1, Mv( 8, i) + 1, Mv( 5, i) + 1, Mv(1, i) + 1) + 1;
        elseif ( j == 2 )
            hist2( Mv( 3, i) + 1, Mv( 5, i ) + 1, Mv(2, i) + 1 ) =  hist2( Mv( 3, i) + 1, Mv( 5, i ) + 1, Mv(2, i) + 1) + 1;
        elseif( j == 4 )
            hist4 ( Mv(2, i ) + 1, Mv( 3, i) + 1, Mv( 4, i) + 1) = hist4 ( Mv(2, i ) + 1, Mv( 3, i) + 1, Mv( 4, i) + 1) + 1; 
        elseif( j == 5 )
            hist5 ( Mv(3, i) + 1, Mv( 5, i ) + 1) = hist5 ( Mv(3, i) + 1, Mv( 5, i ) + 1) + 1;
        elseif( j == 6 )
            hist6 (Mv(2, i ) + 1, Mv(5, i ) + 1, Mv(6, i ) + 1) = hist6 (Mv(2, i ) + 1, Mv(5, i ) + 1, Mv(6, i ) + 1) + 1;
        elseif ( j == 7 ) 
            hist7( Mv(3, i ) + 1, Mv( 4, i ) + 1, Mv( 6, i ) + 1, Mv( 7, i ) + 1) = hist7( Mv(3, i ) + 1, Mv( 4, i ) + 1, Mv( 6, i ) + 1, Mv( 7, i ) + 1) + 1;
        elseif( j == 8 )
            hist8( Mv( 5, i ) + 1, Mv( 6, i ) + 1, Mv( 8, i ) + 1) = hist8( Mv( 5, i ) + 1, Mv( 6, i ) + 1, Mv( 8, i ) + 1) + 1;
       end
	end
end

for i = 1 : 9
	if ( i == 1 || i == 3 || i == 4 || i == 6)
		jtotal = 5;
	elseif( i == 2 || i == 7 )
		jtotal = 6;
    elseif ( i == 5 || i == 9)
        jtotal = 3;
    else
		jtotal = 4;
    end
    
	% for BN parameters. First figure out the special case, x1, x2, x4, x5, x6, x7, x8.
    if ( i == 1)
        for k = 0 : 4 % x6
            for l = 0 : 3 % x8
                for n = 0 : 2 % x5
                    for j = 1 : jtotal
                        theta1( 1, k * 4 * 3 * jtotal + l * 3 * jtotal + n * jtotal + j) = (hist1( k + 1, l + 1, n + 1, j) + 1)/ ( sum(hist1(k + 1, l + 1, n + 1, :)) + jtotal);
                    end 
                end
            end
        end
    elseif ( i == 2)
       for k = 0 : 4 % x3
           for l = 0 : 2 % x5
                for j =  1 : jtotal
                    theta1(2, k * 3 * jtotal + l * jtotal + j) = ( hist2( k + 1, l + 1, j) + 1) / ( sum(hist2(k + 1, l + 1, :) ) + jtotal);
                end
           end
       end
    elseif ( i == 4)
        for k = 0 : 5 %x2
            for l = 0 : 4 %x3
                for j = 1 : jtotal
                    theta1 (  4,  k * 5 * jtotal + l * jtotal  + j) = ( hist4( k + 1, l + 1, j) + 1) / ( sum( hist4(k + 1, l + 1, :)) + jtotal);
                end
            end
        end
        
    elseif( i == 5)
        for k = 0 : 4 % x3
            for j = 1 : jtotal
                theta1( 5, k * jtotal + j) =  (hist5(k + 1, j) + 1) / (sum (hist5( k + 1, : )) + jtotal);
            end
        end
    elseif( i == 6)
        for k = 0 : 5 %x2
            for l = 0 : 2 %x5
                for j = 1 : jtotal
                    theta1 ( 6, k * 3 * jtotal + l * jtotal + j) = (hist6(k + 1, l + 1, j) + 1) / (sum(hist6(k + 1, l + 1, :)) + jtotal);
                end
            end
        end
    elseif ( i == 7) 
        for k = 0 : 4  %x3
            for l = 0 : 4 %x4
                for n = 0 : 4 %x6
                    for j = 1 : jtotal
                        theta1 ( 7, k * 5 * 5 * jtotal + l * 5 * jtotal + n * jtotal + j ) = (hist7(k + 1, l + 1, n + 1, j) + 1) / (sum(hist7(k + 1, l + 1, n + 1, :)) + jtotal);
                    end
                end
            end
        end
    elseif ( i == 8)
        for k = 0 : 2 % x5
            for l = 0 : 4 %x6
                for j = 1 : jtotal
                    theta1(8, k * 5 * jtotal + l * jtotal + j) = (hist8(k + 1, l + 1, j) + 1) / (sum(hist8(k + 1, l + 1, :)) + jtotal);
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
