% CSE 574 Project1 Part 2 main.m
% Ruhan Sa 50060400
% main training iterations
% partially from TA's code

K = 10;
N = 1000;% for training
D = 512;

W = zeros(D+1, K); % initialize W
H = zeros(K*(D+1)); % the Hessian matrix
err = [];

% iterate to reduce the error rate 
for m = 1 : 10 
    % Training
    phi = gettPhi(K, N);
    Y = getY( K, N, W, phi);
    target = getT(K, N);
    H = getHessian( K, Y, phi, D);
    dE = getDerivative( K, N, D, Y, target, phi);
    %add small values to diagonal to enhance numerical stability
    deltaW = (H+eye((D+1)*K))\dE(:); 
    deltaW = reshape(deltaW, D+1, K);
    W = W - deltaW;
    
    %Validating
    V_phi = getvPhi(K, N);
    V_Y = getY( K, N, W, V_phi);
    err(m) = -sum(sum(target.*log(V_Y+1e-10)));  
    if( m == 1)
        min = err(m);
    end
    if( min > err(m))
         min = err(m);
         WF = W;
         errF = err;
    end
end
