function [u, u_exact] = heat_eqn1(T,M,lambda)


h = 2/M;
x = (linspace(-1,1,M+1))';
k = lambda*h^2;
N = ceil(T/k);


u = cos(pi*x/2) + (sin(pi*x))/2;
t = 0;



plot(x,u,'b','LineWidth',2);
hold on
% plot the graph of exact solution when t=0
plot(x,U(x,0),'r','LineWidth',2);
axis([-1 1 0 1.3]);
legend('numerical solution','exact solution');
title('t = 0');
xlabel('x');
ylabel('u');

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
    %plot current solution
    hold off
    % numerical solution
    plot(x,u,'b', 'LineWidth',2);
    hold on
    % true solution
    plot(x,U(x,t),'r','LineWidth',2);
    axis([-1 1 0 1.3]);
	title(['t = ' num2str(t)]);
    legend('numerical solution','exact solution');
    xlabel('x');
    ylabel('u');
	pause(0.001);
    % define u_exact while t --> T for Exercise 4.4
    u_exact = U(x,t);
    t = t + k;
end
    
end

% define true solution
function v=U(x,t)
    v=  exp(-(pi^2)*t/4)*cos(pi*x/2)+(exp(-(pi^2)*t)*sin(pi*x))/2;
end