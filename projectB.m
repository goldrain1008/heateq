%% Project B Numerical solution of the heat equation





%% Exercise 4.1

type heat_eqn
heat_eqn(1,20,0.3)
heat_eqn(1,20,1)
% For the case of lambda=0.3, the graph is concave upward and its maximum value
% decreases as time elapses. For the case of lambda=1, at first the
% function behaves similarly to the case of lambda=0.3, but from t>0.3, the
% function is undefined.

%% Exercise 4.2

type stable_test

a=0.1:0.1:1;
b=zeros(1,10);
i=1;
% lambda loop
for lambda=0.1:0.1:1 
    b(i)=stable_test(lambda);
    i=i+1;
end
% Visualize the solution
[a;b]

% we can check lambda should roughly be equal or smaller than 0.5 if all
% eigenvalues have absolute values less than or equal to 1.
%% Exercise 4.3

type heat_eqn1

%% Exercise 4.4
% u_numerical returns numerical solution when t --> T and u_exact returns
% exact solution when t --> T. Then we can find error by calculating
% Eucliedian norm of difference of the two vectors.
[u_numerical, u_exact]=heat_eqn1(1,20,0.5);
approxerror = norm(u_numerical-u_exact)

%% Exercise 4.5 
% adorablematlab.m suppress animation of heat_eqn1.m 
type adorablematlab.m

% generate y values
Error=zeros(1,81);
i=1;
% M loop
for M=20:100
    [u_numerical, u_exact]=adorablematlab(1,M,0.5);
    Error(i)=norm(u_numerical-u_exact);
    i=i+1;
end

% generate x values
h=1./(20:100);
x=log(h);

% Draw log(Error) - log(h) graph
hold off
plot(x,log(Error),'bx','LineWidth',2);
hold on

% Draw linear regression of the graph
p=polyfit(log(h),log(Error),1);
plot(x,p(1)*x+p(2),'r','LineWidth',2);

% average gradient of log(Error) is coefficient of highest order term of
% linear regression function.
Gradaverage=p(1)

% Generally lnE is proportional to lnh

%% Exercise 4.6 

type heat_eqn2

%% Exercise 4.7
heat_eqn2(1,20,0.3)
heat_eqn2(1,20,1)

% There is no notable difference of the case lambda=0.3, but we can find
% the solution of lambda=1 is stablized: it is still defined where t>0.3

%% Exercise 4.8

type allen_cahn.m

%% Exercise 4.9

% write down beta loop
hold off
for beta=1:5
    allen_cahn(1,20,0.5,1)
end


% shape of each graph is similar, but as beta increases, maximum value of
% each solution increases