% CSE 574 PROJECT 2 BN Evaluation of Handprint characteristic HandprintEvaluate()
% Ruhan Sa 50060400
% This function evaluate the graph model of Handprint and
% Expression: According to log loss, the evaluation should be production of thetas
% For further use, this function also stores the joint probability for each
% data sample. i.e. p. As well as the extreme values Index, MAX & MIN p.


function [like, p, MaxIdx, MinIdx] = HandprintEvaluation(theta1, Mv)
% theta1 is the parameter for BN of Handprint 'and', derived by HandprintPara(Mv);
% Mv is the feature value of Handprint, derived by [~, ~, Mv] = file2matrix('truthHandprint.txt');

total = 1135; % total number of data
%[~, ~, Mv] = file2matrix('truthHandprint.txt'); % read the truth of the cursive into matrix

logLike = 0; % init

p = ones(1, total);
Maxp = 0;
Minp = 1;
MaxIdx = -1;
MinIdx = -1;

for n = 1 : total
    for j = 1 : 9
        if ( i == 1 || i == 3 || i == 4 || i == 6)
            jtotal = 5;
        elseif( i == 2 || i == 7 )
            jtotal = 6;
        elseif ( i == 5 || j == 9)
            jtotal = 3;
        else
            jtotal = 4;
        end
        
        if (j == 1)
            temp = theta1( j, Mv(6, n) * 4 *  3 * jtotal + Mv(8, n) * 3 * jtotal + Mv(5,  n) * jtotal + Mv(1, n) + 1);
        elseif(j == 2)
            temp = theta1( j, Mv(3,  n ) * 3 * jtotal + Mv(5,  n) * jtotal + Mv(2,  n) + 1);
        elseif(j == 4)
            temp = theta1( j, Mv(2,  n ) * 5 * jtotal + Mv(3,  n)* jtotal + Mv(4,  n) + 1);
        elseif(j == 5)
            temp =  theta1( j, Mv(3,  n) * jtotal +  Mv(5, n) + 1);
        elseif(j == 6)
            temp = theta1( j, Mv(2, n) *  3 * jtotal + Mv(5,  n) * jtotal + Mv(6, n) + 1);
        elseif(j == 7)
            temp = theta1( j, Mv(3, n) * 5 *  5 * jtotal + Mv(4, n) * 5 * jtotal + Mv(6,  n) * jtotal + Mv(7, n) + 1);
        elseif(j == 8)
            temp = theta1( j, Mv(5, n) * 5 * jtotal + Mv(6, n) * jtotal + Mv(8, n) + 1);
        else
            temp = theta1( j, Mv(j, n) + 1);
        end
         logLike = logLike + log( temp );
         p(n) = p(n) * temp;
    end
    if ( p(n) > Maxp)
        Maxp = p(n);
        MaxIdx = n;
    end
    if ( p(n) < Minp)
        Minp = p(n);
        MinIdx = n;
    end
end

like = -logLike;
