%% Parameter
addpath('./functions/')

% Deutschland:
N = 83.24*10^6;
I0 = 20;
alpha = 0.0013; % Impfrate
beta = 0.1940;

% Spanien
% N = 47.35*10^6;
% I0 = 223;
% beta = 0.1671;

R0 = 0;
S0 = N - I0 - R0;
t0 = 0;
T = 365;
gamma = 1/14;

%% Approximation (Methode 1)
%  Abbildung 2.3
[t_Approx1, S_Approx1, I_Approx1, R_Approx1] = ...
    approximation1(beta, gamma, N, I0, t0,T);

figure('position',[10 10 800 400]);
hold on;
plot(t_Approx1,S_Approx1, 'color','g','LineWidth',1);
plot(t_Approx1,I_Approx1, 'color','r','LineWidth',1);
plot(t_Approx1,R_Approx1, 'color','b','LineWidth',1);
ylabel('Population','FontSize',22);
xlabel('Zeit (Tage)','FontSize',22);
titel = strcat('$$\beta = ',num2str(beta),...
               ', \gamma = 1/',num2str(1/gamma),...
               ', I_0 = ',num2str(I0),...
               ', N = ',num2str(N),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
legend('$$S$$','$$I$$','$$R$$ ','interpreter','latex','FontSize',22);

%% Approximation (Methode 2)
%  Abbildung 2.4
[t_Approx2, S_Approx2, I_Approx2, R_Approx2] = ...
    approximation2(beta, gamma, N, I0, t0,T);

figure('position',[10 10 800 400]);
hold on;
plot(t_Approx2,S_Approx2, 'color','g','LineWidth',1);
plot(t_Approx2,I_Approx2, 'color','r','LineWidth',1);
plot(t_Approx2,R_Approx2, 'color','b','LineWidth',1);
ylabel('Population','FontSize',18);
xlabel('Zeit (Tage)','FontSize',18);
titel = strcat('$$\beta = ',num2str(beta),...
               ', \gamma = 1/',num2str(1/gamma),...
               ', I_0 = ',num2str(I0),...
               ', N = ',num2str(N),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
legend('$$S$$','$$I$$','$$R$$ ','interpreter','latex','FontSize',22);

%% ode23s SIR-Modell
%  Abbildung 2.5
[t_RK,S_RK,I_RK,R_RK] = ode23s_solver(T,S0,I0,R0,beta,gamma);
figure('position',[10 10 800 400]);
hold on;
plot(t_RK,S_RK, 'color','g','LineWidth',1);
plot(t_RK,I_RK, 'color','r','LineWidth',1);
plot(t_RK,R_RK, 'color','b','LineWidth',1);
ylabel('Population','FontSize',18);
xlabel('Zeit (Tage)','FontSize',18);

titel = strcat('$$\beta = ',num2str(beta),...
               ', \gamma = 1/',num2str(1/gamma),...
               ', I_0 = ',num2str(I0),...
               ', N = ',num2str(N),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
legend('$$S$$','$$I$$','$$R$$ ','interpreter','latex','FontSize',22);

%% odes23 SIR-Modell mit Impfungen
%  Abbildung 3.1

[t_VACC,S_VACC,I_VACC,R_VACC] = ode23s_impfung(T,S0,I0,R0,alpha,beta,gamma);
figure('position',[10 10 800 400]);
hold on;
plot(t_VACC,S_VACC, 'color','g','LineWidth',1);
plot(t_VACC,I_VACC, 'color','r','LineWidth',1);
plot(t_VACC,R_VACC, 'color','b','LineWidth',1);
ylabel('Population','FontSize',18);
xlabel('Zeit (Tage)','FontSize',18);

titel = strcat('$$\alpha = ',num2str(alpha),...
               ', \beta = ',num2str(beta),...
               ', \gamma = 1/',num2str(1/gamma),...
               ', I_0 = ',num2str(I0),...
               ', N = ',num2str(N),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
legend('$$S$$','$$I$$','$$R$$ ','interpreter','latex','FontSize',22);

%% Vergleich: keine Impfungen vs. Impfungen
%  Abbildung 3.2

[t_VACC1,~,I_VACC1,~] = ode23s_impfung(T,S0,I0,R0,alpha,beta,gamma);
[t_VACC2,~,I_VACC2,~] = ode23s_impfung(T,S0,I0,R0,2*alpha,beta,gamma);

figure('position',[10 10 800 400]);
hold on;
plot(t_RK,I_RK, 'color','#A2142F','LineWidth',1);
plot(t_VACC1,I_VACC1, 'color','#D95319','LineWidth',1);
plot(t_VACC2,I_VACC2, 'color','#EDB120','LineWidth',1);
ylabel('Population','FontSize',18);
xlabel('Zeit (Tage)','FontSize',18);

titel = strcat('$$\alpha = ',num2str(alpha),...
               ', \beta = ',num2str(beta),...
               ', \gamma = 1/',num2str(1/gamma),...
               ', I_0 = ',num2str(I0),...
               ', N = ',num2str(N),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
legend('$$\alpha = 0$$ (ohne Impfungen)','$$\alpha = 0.0013$$','$$\alpha = 0.0026$$','interpreter','latex','FontSize',22);

%% Vergleich: I und R ( Approximation 1 vs. ode23s )
%  Abbildung 2.6

figure('position',[10 10 800 400]);
hold on;
plot(t_Approx1,I_Approx1,'color','#EDB120','LineWidth',1);
plot(t_Approx1,R_Approx1,'color','#4DBEEE','LineWidth',1);
plot(t_RK,I_RK,'color','r','LineWidth',1);
plot(t_RK,R_RK,'color','b','LineWidth',1);
ylabel('Population','FontSize',18);
xlabel('Zeit (Tage)','FontSize',18);

titel = strcat('$$\beta = ',num2str(beta),...
               ', \gamma = 1/',num2str(1/gamma),...
               ', I_0 = ',num2str(I0),...
               ', N = ',num2str(N),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
legend('$$I^*$$','$$R^*$$','$$I$$','$$R$$','interpreter','latex','FontSize',22);

%% Vergleich: S (Approx. 1 vs Approx. 2 vs. ode23s)
%  Abbildung 2.7

figure('position',[10 10 800 400]);
hold on;
plot(t_Approx1,S_Approx1,'color','#D95319','LineWidth',1);
plot(t_Approx2,S_Approx2,'color','#EDB120','LineWidth',1);
plot(t_RK,S_RK,'color','g','LineWidth',1);
ylabel('Population','FontSize',18);
xlabel('Zeit (Tage)','FontSize',18);

titel = strcat('$$\beta = ',num2str(beta),...
               ', \gamma = 1/',num2str(1/gamma),...
               ', I_0 = ',num2str(I0),...
               ', N = ',num2str(N),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
legend('$$S^*$$','$$\tilde S$$','$$S$$','interpreter','latex','FontSize',22);
%% Monte Carlo Simulation (Euler-Maruyama)
%  Abbildung 3.3

M = 100;
m = T * 2*10;
[t_MC,S_MC,I_MC,R_MC] = em_mc(t0,T,[S0;I0],beta,gamma,N,m,M);
figure('position',[10 10 800 300]);
hold on;
plot(t_MC,S_MC,'color','g','LineWidth',1);
plot(t_MC,I_MC,'color','r','LineWidth',1);
plot(t_MC,R_MC,'color','b','LineWidth',1);

ylabel('Population','FontSize',18);
xlabel('Zeit (Tage)','FontSize',18);

titel = strcat('$$\beta = ',num2str(beta),...
               ', \gamma = 1/',num2str(1/gamma),...
               ', I_0 = ',num2str(I0),...
               ', M = ',num2str(M),...
               ', \Delta t = ',num2str((T-t0)/m),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
legend('$$S$$','$$I$$','$$R$$','interpreter','latex','FontSize',22);

%% Vergleich deterministisch vs. stochastisch
%  Abbildung 3.4

M = 100;
m = T * 20;
[t_RK,S_RK,I_RK,R_RK] = ode23s_solver(T,S0,I0,R0,beta,gamma);
[t_MC,S_MC,I_MC,R_MC] = em_mc(t0,T,[S0;I0],beta,gamma,N,m,M);
figure('position',[10 10 800 400]);
hold on;
plot(t_RK,I_RK,'LineWidth',1);
%plot(t_RK,R_RK,'LineWidth',1);
plot(t_MC,I_MC,'LineWidth',1);
%plot(t_MC,R_MC,'LineWidth',1);
ylabel('Population','FontSize',18);
xlabel('Zeit (Tage)','FontSize',18);
titel = strcat('$$\beta = ',num2str(beta),...
               ', \gamma = 1/',num2str(1/gamma),...
               ', I_0 = ',num2str(I0),...
               ', M = ',num2str(M),...
               ', \Delta t = ',num2str((T-t0)/m),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
legend('deterministisch','stochastisch','latex','FontSize',22);