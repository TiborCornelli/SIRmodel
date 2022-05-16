function [t,S,I] = sis(T,I0,N,omega,psi)
    t = 1:T;
    a = psi - omega;
    if a == 0
        I = 1./((1/I0) + (psi*t/N));
    else 
        I = (a * I0 * exp(a * t))./((psi/N)*I0*(exp(a*t)-1) + a); 
    end
    S = N - I;
end