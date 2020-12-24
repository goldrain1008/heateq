function u = heat_eqn(T,M,lambda)

%set up grid points
h = 2/M;
x = (linspace(-1,1,M+1))';
k = lambda*h^2;
N = ceil(T/k);

%initial conditions
u = cos(pi*x/2) + (sin(pi*x))/2;
t = 0;

%plot u(x,0)
plot(x,u,'b','LineWidth',2);
axis([-1 1 0 1.3]);
title('t = 0');
xlabel('x');
ylabel('u');

%finite difference operator
e = ones(M-1,1);
L = spdiags([e  -2*e  e], [-1 0 1], M-1, M-1);
I = speye(M-1);
A = I + lambda*L;

%main loop
while (t<T)
    u_inner = u(2:M,1);
	u_inner = A*u_inner;
    u = [0; u_inner; 0];
    %plot current solution
    hold off
    plot(x,u,'LineWidth',2);
    axis([-1 1 0 1.3]);
	title(['t = ' num2str(t)]);
    xlabel('x');
    ylabel('u');
	pause(0.02);
    t = t + k;
end







