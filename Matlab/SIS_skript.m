%% Parameter
addpath('./functions/')
N = 83.24*10^6;
I0 = 20;
S0 = N - I0;
T = 365;
omega = 1/90; % Immunität von 90 Tagen
psi = 0.1940;

%% Lösung des SIS-Modells berechnen

[t,S,I] = sis(T,I0,N,omega,psi);
I_inf = (psi - omega)*N/psi;
figure('position',[10 10 800 400]);
hold on
plot(t,S, 'color','g','LineWidth',1);
plot(t,I, 'color','r','LineWidth',1);
plot(t,ones(1,T)*I_inf, 'color','cyan','LineWidth',1);
titel = strcat('$$\omega = 1/',num2str(1/omega),...
               ', \psi = ',num2str(psi),...
               ', I_0 = ',num2str(I0),...
               ', N = ',num2str(N),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);
%title('$$ \omega = 1/90, \psi = 0.164, I_0 = 100 $$','interpreter','latex');
ylabel('Population','FontSize',18);
xlabel('Zeit (Tage)','FontSize',18);
legend('$$S$$','$$I$$','$$ I_\infty$$ ','interpreter','latex','FontSize',22);