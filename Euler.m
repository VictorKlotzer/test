% change made on websit
function [ X,err ] = Euler( f,x0,t0,T,solth )

% Dans le cas où T n'est pas donné lors de l'appel (solth non plus)
ne = nargin();  % nombre d'entrées
if ne<4
    l = 10;
    k = 100;
    T = t0 : (l - t0)/(k+1) : l
end

    
N = length(T);
m = size(x0, 1);
X = zeros(m, N);
X(:,1) = x0;

for i = 2:N
    X(:,i) = X(:,i-1) + (T(i) - T(i-1)) * f(T(i-1),X(:,i-1));
end

if ne<5
    err = []; 
else
    err = norm(X - solth);
end

end
