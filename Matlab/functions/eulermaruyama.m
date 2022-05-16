function [t_out,S,I,R] = eulermaruyama(t0,T,X0,beta,gamma,N,m)
    dt = (T-t0)/m;
    t = zeros(1,m+1);
    X = zeros(2,m+1);
    t(1) = t0;
    X(1:2,1) = X0;
    
    for j=2:(m+1)
        f1 = -beta * X(1,j-1) * X(2,j-1)/N;
        f2 = beta * X(1,j-1) * X(2,j-1)/N - gamma * X(2,j-1);
        f = [f1 f2]';
        g11 = -sqrt(beta * X(1,j-1) * X(2,j-1)/N);
        g22 = -sqrt(gamma * X(2,j-1));
        g = [g11 0; -g11 g22];
        t(j) = t(j-1) + dt;
        dW = sqrt(dt) * randn(2,1);
        X(1:2,j) = X(1:2,j-1) + f * dt + 1*g * dW;
    end
    
    t_out = t;
    S = X(1,1:m+1);
    I = X(2,1:m+1);
    R = N - S - I;
end

