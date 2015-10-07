% CSE 574 PROJECT 2 BN Evaluation of Handprint characteristic HandprintEvaluate()
% Ruhan Sa 50060400
% This function evaluate the  of parameter of handprint 'and' when the
% variables are assumed to be independent.
% Expression: According to log loss, the evaluation should be production of thetas
% For further use, this function also stores the joint probability for each
% data sample. i.e. p. As well as the extreme values Index, MAX & MIN p.


function [like, p, MaxIdx, MinIdx] = HandprintEvaluationIndi(theta2, Mv)
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
         temp = theta2( j, Mv(j, n) + 1);
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
