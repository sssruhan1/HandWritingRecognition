% CSE 574 Project 1 part 2 main_gd
% Ruhan Sa 50060400
% get the W using normal version of gradient descent

K = 10;
N = 1000;% for training
D = 512;

lambda = [ 0.001, 0.0001, 0.00001, 0.000001]; % learning rate
err = [];

% iterate to reduce the error rate 
for l = 1 : 4
    W = zeros(D+1, K); % initialize W
    for m = 1 : 10 
        % Training
        phi = gettPhi(K, N);
        Y = getY( K, N, W, phi);
        target = getT(K, N);
        dE = getDerivative( K, N, D, Y, target, phi);
        W = W - lambda(l)*dE;

        %Validating
        V_phi = getvPhi(K, N);
        V_Y = getY( K, N, W, V_phi);
        err(l, m) = -sum(sum(target.*log(V_Y+1e-10)));  
        if(l == 1)
            min = err(l, m);
            WF = W;
        end
        if(min > err(l, m))
            min = err(l,m);
            WF = W;
        end
     end
end
