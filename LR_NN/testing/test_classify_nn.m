% CSE 574 PROJECT1 PART 2 CLASSIFY_nn
% Ruhan Sa 50060400
% classify the testing data


K = 10;
M = 3;
D = 512;
N = 150;

temp = load('train_nnV2.mat', 'W2F');
W2 = temp.('W2F');
temp = load('train_nnV2.mat', 'W1F');
W1 = temp.('W1F');

phi = getPhi(K, N);
a = [];
z = [];
y = zeros(N*K, K);
target = getT(K, N);
right = 0; % right classification number
min = 1;

for n = 1 : N*K
       for j = 1 : M
            a(j) = 0;
            for i = 1 : (D+1)
                a(j) = a(j) + W1(j, i)*phi(n, i);
            end
            z(j) = tanh(a(j)); %(exp(a(j))-exp(-a(j)))/(exp(a(j))+exp(a(j)));
        end
        for k = 1 : K
            for j = 1 : M
                y(n, k) = y(n, k) + W2(k, j)* z(j);
            end
        end
   
    % classification 
    for k = 1 : K
        if(k == 1)
            max = y(n,k);
        end
        if ( max <= y(n, k)) % classify
            max = y(n,k);
            result(n) = k-1;
        end
    end
    
    % calculate the right classification
    if( result(n) ==  (floor(n/N)-1) )
        right = right + 1;
    end
end

errrate = 1 - right / (N*K);