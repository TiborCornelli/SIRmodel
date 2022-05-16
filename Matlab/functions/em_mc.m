function [t,S_MC,I_MC,R_MC] = em_mc(t0,T,X0,beta,gamma,N,m,M)
    S = zeros(1,m+1);
    I = zeros(1,m+1);
    for i=1:M
        [t_EM,S_EM,I_EM] = eulermaruyama(t0,T,X0,beta,gamma,N,m);
        S = S + S_EM;
        I = I + I_EM;
    end
    S_MC = S./M;
    I_MC = I./M;
    R_MC = N - S_MC - I_MC;
    t = t_EM;
end