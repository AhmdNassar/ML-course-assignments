function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

reg = (lambda/(2*m))*sum(theta(2:size(theta)).^2) ;
z = X*theta;
h = sigmoid(z);
j1 = -y'*log(h);
j2 = (1-y)'*log(1-h);
J = (j1 -j2)/m+reg;

a = (lambda/m) * theta(2:size(theta));
grad = (X'*(h-y))./m +  [0,a']'  ;
%grad(1) = ((h-y)'*X(:,1))/m;
%ll = ((h-y)'*X(:,2:size(theta)))./m;
%ll2=(lambda*theta(2:size(theta))'./m);


%grad(2:size(theta)) = ll+ll2;


% =============================================================

end
