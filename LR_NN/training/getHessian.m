% CSE 574 Project1 Part2 getHessian(K, Y, phi, D)
% Ruhan Sa 50060400
% get the Hessian matrix, code given by TA
% K: NUM. OF CLASSES
% Y: Probability matrix
% phi: feature matrix
% D: Dimension 


function [H] = getHessian( K, Y, phi, D)

I = eye(K);
% the following part should be integrated in the main update loop
% should not need more than 10 iterations to get really small error
for k = 1 : K
    for j = 1 : k
        % Calculate block of hessian matrix
        % Equation 4.110 in PRML book
        H((j-1)*(D+1)+1:j*(D+1), (k-1)*(D+1)+1:k*(D+1)) = (repmat(Y(:,k).*(I(k,j) - Y(:,j)), 1, D+1).*phi)'*phi;
        % use of symmetry of the Hessian matrix
        H((k-1)*(D+1)+1:k*(D+1), (j-1)*(D+1)+1:j*(D+1)) = H((j-1)*(D+1)+1:j*(D+1), (k-1)*(D+1)+1:k*(D+1));
    end
end
