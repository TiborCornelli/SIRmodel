function [beta, I0, I_hat] = LAP(t,I)
    n = length(t);
    X = [t ones(n,1)];
    y = log(I);
    eta = (X'*X)\X'*y;
    beta = eta(1);
    I0 = exp(eta(2));
    I_hat = I0 * exp(beta * t);
end

