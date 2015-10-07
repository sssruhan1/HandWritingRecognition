% CSE 574 PROJECT1 PART 2 CLASSIFY_IRLS
% Ruhan Sa 50060400
% classify the testing data 

Y; % probability matrix
N; % NUM. OF DATA PER CLASS
K; % NUM. OF CLASSES

result_IRLS = [];
right = 0;
for i = 1: K*N
    for j = 1: K
        if( j == 1)
            max = y(i, j);
            result_IRLS(i) = j;
        end
        if( max < Y(i, j))
            max = Y(i, j);
            result_IRLS(i) = j;
        end
    end
   if(result_IRLS(i) == floor(i / N))
       right = right+1;
   end
end

errorrate = 1 - right/(K*N);
