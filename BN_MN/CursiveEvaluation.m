% CSE 574 PROJECT 2 BN Evaluation of Cursive characteristic CursiveEvaluate()
% Ruhan Sa 50060400
% This function evaluate the graph model of Cursive 'and'
% Expression: According to log loss, the evaluation should be negative sum of thetas
% For further use, this function also stores the joint probability for each
% data sample. i.e. p. As well as the extreme values Index, MAX & MIN p.


function [like, p, MaxIdx, MinIdx] = CursiveEvaluation(theta1, Mv)
% theta1 is the parameter of BN, derived by CursivePara(Mv);
% Mv is the feature value derived from [~, ~, Mv] =  file2matrix('truthCursive.txt');

total = 3075;
%[ ~, ~ , Mv] = file2matrix('truthCursive.txt');
logLike = 0; % init
p = ones(1, total);
Maxp = 0;
Minp = 1;
MaxIdx = -1;
MinIdx = -1;
for n = 1 : total
    for j = 1 : 9
        if ( i == 1 || i == 5 || i == 6 || i == 7)
            jtotal = 4;
        elseif( i == 2 || i == 4 || i == 8)
            jtotal = 5;
        else
            jtotal = 3;
        end
        if (j == 2)
            temp = theta1( j, Mv(1,  n) * jtotal + Mv(2, n) + 1);
        elseif(j == 4)
            temp = theta1( j, Mv(3,  n ) * 4 * jtotal + Mv(5,  n) * jtotal + Mv(4,  n) + 1);
        elseif(j == 7)
            temp = theta1( j, Mv(6,  n ) * 5  * jtotal + Mv(8,  n)* jtotal + Mv(7,  n) + 1);
        elseif(j == 9)
            temp = theta1( j, Mv(2,  n)  * 5 * 4 * jtotal + Mv(4,  n) * 4 * jtotal + Mv(7, n) * jtotal + Mv(9, n) + 1);
        else
            temp = theta1( j, Mv(j, n) + 1);
        end
        logLike = logLike + log(temp);
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
