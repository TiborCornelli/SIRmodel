%  Abbildung 2.2

addpath('./functions/')
N = 83.24*10^6;
I0 = 20;
S0 = N - I0;
gamma = 1/14;
beta = 0.1940;
rho = N * gamma/beta;
Imax = N + rho *(log(rho/S0)-1);

% Verhalten von Imax
I0_vec = [I0 4*10^6 4 * 10^7 6 * 10^7];
ImaxFunc(gamma,I0_vec,N,1);