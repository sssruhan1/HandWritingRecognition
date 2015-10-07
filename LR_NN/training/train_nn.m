% CSE 574 PROJECT 1 PART 2 train_nn
% Ruhan Sa 50060400
% training using neural network
N = 1000;
K = 10;
M = 3;
D = 512;
lambda = [ 0.000001, 1e-7, 1e-8, 1e-9, 1e-10];

W2 = rand(K, M)/100000; % LAYER 2 WEIGHT MATRIX
W1 = rand(M, D+1)/100000;% LAYER 1 WEIGHT MATRIX

phit = gettPhi(K, N);
phiv = getvPhi(K, N);
a = [];
z = [];
target = getT(K, N);
delta = [];
err = [];

min = 1;

for l = 1 : 5
    err(l) = 0;
    right = 0; % right classification number
    yt = zeros(N*K, K);
    yv = zeros(N*K, K);
    for n = 1 : N*K
        % train for W1 and W2
        for j = 1 : M
            a(j) = 0;
            for i = 1 : (D+1)
                a(j) = a(j) + W1(j, i)*phit(n, i);
            end
            z(j) = (exp(a(j))-exp(-a(j)))/(exp(a(j))+exp(-a(j)));
        end
        
        for k = 1 : K
            for j = 1 : M
                yt(n, k) = yt(n, k) + W2(k, j)* z(j);
                delta(n, k) = yt(n,k) - target(n, k);
            end
        end
        
            sum = 0;
            for k = 1 : K
                sum = sum + W2(k, j)* delta(k);
            end
            delta(j) = (1 - z(j)^2)*sum;
            for i = 1 : (D+1)
                dE1(j, i) = delta(j)* phit(n, i);
            end
            for k = 1 : K
                dE2(k, j) = delta(k) * z(j);
            end
        end
        
        W1 = W1 - lambda(l) * dE1;
        W2 = W2 - lambda(l) * dE2;
    end
    
    for n = 1 : N*K
    % get the sum-of-square error function for validation
        for j = 1 : M
            a(j) = 0;
            for i = 1 : (D+1)
                a(j) = a(j) + W1(j, i)*phiv(n, i);
            end
            z(j) = (exp(a(j))-exp(-a(j)))/(exp(a(j))+exp(-a(j)));
        end

            for k = 1 : K
                for j = 1: M
                yv(n, k) = yv(n, k) + W2(k, j)* z(j);
                end
            end
        end

        for k = 1 : K
            err(l) = err(l) + (yv(n, k) - target(n, k))^2;
            if (k == 1)
                max = yv(n, k);
            end
            if ( max <= yv(n, k)) % classify
                max = yv(n,k);
                result(n) = k;
            end
        end

        % calculate the right classification
        if( result(n) ==  floor(n/N) )
            right = right + 1;
        end
    end

        errrate(l) = 1 -  right / (N*K) ;

        if (l == 1)
            min = err(l);
            W1F = W1;
            W2F = W2;
        end
        
        % Get the most appropriate W1 & W2.
        if ( min > err(l))
            W1F = W1;
            W2F = W2;
        end
end


