function [u, u_exact] = adorablematlab(T,M,lambda)


h = 2/M;
x = (linspace(-1,1,M+1))';
k = lambda*h^2;
N = ceil(T/k);


u = cos(pi*x/2) + (sin(pi*x))/2;
t = 0;

%finite difference operator
e = ones(M-1,1);
L = spdiags([e  -2*e  e], [-1 0 1], M-1, M-1);
I = speye(M-1);
A = I + lambda*L;

%main loop
while (t<=T)
    u_inner = u(2:M,1);
	u_inner = A*u_inner;
    u = [0; u_inner; 0];
    t = t + k;
end
u_exact=U(x,T);
    
end

function v=U(x,t)
    v=  exp(-(pi^2)*t/4)*cos(pi*x/2)+(exp(-(pi^2)*t)*sin(pi*x))/2;
end