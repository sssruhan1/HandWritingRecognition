% CSE 574 PROJECT 2 BN Evaluation of Cursive characteristic CursiveEvaluate()
% Ruhan Sa 50060400
% This function evaluate the parameters  of Cursive 'and' when the
% variables are assumed to be indipendent.
% Expression: According to log loss, the evaluation should be negative sum of thetas
% For further use, this function also stores the joint probability for each
% data sample. i.e. p. As well as the extreme values Index, MAX & MIN p.


function [like, p, MaxIdx, MinIdx] = CursiveEvaluationIndi(theta2, Mv)
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
        temp = theta2( j, Mv(j, n) + 1);
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
