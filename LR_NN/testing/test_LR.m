% CSE 574 PROJECT1 PART2 test_lr
% Ruhan Sa  50060400
% test the logistic regression parameter (for IRLS)

N = 150;
D = 512;
K = 10;

phi = getPhi(K, N);

% test for IRLS method
struct = load('train_IRLS.mat', 'W');
W = struct.('W');
Y = getY( K, N, W, phi);
target = getT(K, N);
err_IRLS = -sum(sum(target.*log(Y+1e-10))); 
classify_IRLS;

% test for normal gradient descent method
struct = load('train_gd.mat', 'W');
W = struct.('W');
Y = getY( K, N, W, phi);
target = getT(K, N);
err_gd = -sum(sum(target.*log(Y+1e-10)));
classify_gd;
