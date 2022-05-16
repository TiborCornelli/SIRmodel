function [t,S,I,R] = approximation1(beta,gamma, N, I0, t0,T)
    S0 = N - I0;
    rho = gamma/beta * N;
    mu = (S0/rho - 1);
    delta = (rho^2)/S0;
    alpha = sqrt(mu^2 + 2*(N - S0)/delta);
    phi = atanh(mu/alpha)+(alpha * gamma * t0)/2;
    t = t0:T;
    R = delta * (mu + alpha * tanh(alpha * gamma * t./2 - phi));
    I = alpha^2 * delta/2 *(1-tanh(alpha * gamma * t./2 - phi).^2);
    S = rho * (-alpha * tanh(alpha * gamma * t/2 - phi)+1);
end