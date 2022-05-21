%% Parameterschätzung
%  Gesucht ist eine Schätzung von
%    - beta (Infektionsrate)
%    - I0 (Anfangswert)
%  für das ausgewähle Land und die ausgewähle Zeitperiode

%  In dem Verzeichnis /SIRmodel/Matlab/data sind verschiedene Datensätze
%  zu den Anfangsstadien von Covid-19 in den Ländern Schweden, Spanien,
%  Italien und Deutschland zu finden (Zeitraum: 15.02.2020-01.04.2022)

addpath('./functions/')

M = readmatrix('./data/Germany_20200215-20200401.csv');
data = M(2:end,2:end);
t = data(:,1);
I = data(:,2);

[beta, I0, I_hat] = LAP(t,I);

hold on;
plot(t,I_hat, "linewidth",1.5,"color","red")
plot(t,I,".","markersize",10, "color","blue")
ylabel('Population','FontSize',22);
xlabel('Zeit (Tage)','FontSize',22);
legend('LAP','Echte Daten','FontSize',22, 'Location','northwest');
titel = strcat('$$\hat \beta = ',num2str(round(beta,4)),...
               ', \hat I_0 = ',num2str(round(I0,2)),...
               ' $$');
title(titel,'Interpreter','latex','FontSize',22);