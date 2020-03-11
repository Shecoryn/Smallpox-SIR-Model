function dU = net(t,U)
global beta
global nu

%First have to name the function. dX and X are vectors.

X = reshape(U,[1 2]);


%dX = [dx,dy]
dX(:,1) = -beta.*X(:,1).*X(:,2);
dX(:,2) = (beta.*X(:,1).*X(:,2)) - (nu.*X(:,2));

%old formulas
%dX(:,1) = c.*(X(:,2)+X(:,1)-X(:,1).^3/3 -I);
%dX(:,2) = a-X(:,1)- b.*X(:,2);


dU = reshape(dX, [2 1]);