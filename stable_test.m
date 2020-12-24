function u=stable_test(lambda)
    % Similar to heat_eqn.m
    M=20;
    e = ones(M-1,1);
    L = spdiags([e  -2*e  e], [-1 0 1], M-1, M-1);
    I = speye(M-1);
    A = I + lambda*L;
    
    % Conditional loop
        if (norm(double(abs(eigs(A))>1))==0)
        % abs(eigs(A)) returns vector consist of absolute values of six
        % largest eigenvalues of A. from the conditional expression
        % abs(eigs(A))>1, it outputs length 6 vector whose term is 1 if 
        % a term of abs(eigs(A)) in same location is bigger than 1, else
        % zero. Using double function, change logical array to double
        % array. If abs(eigs(A)) has an entry larger than 1, then norm of
        % double(abs(eigs(A))) would be larger than 0. 
        u=true;
        else
        u=false;
        end
end