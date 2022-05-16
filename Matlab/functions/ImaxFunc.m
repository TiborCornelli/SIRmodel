function [beta,I_max] = ImaxFunc(gamma,I0,N,beta_max)
    figure('position',[10 10 800 400]);
    for k=1:length(I0)
        S0 = N - I0(k);
        % Damit für die Basisreproduktionszahl R_0 > 1 ist, muss gemäß Beispiel
        % 2.20 gelten: beta > gamma * N / S0
        % Für beta = gamma * N / S0 entspricht I_max gerade dem Anfangswert I_0
        s = gamma * N / S0;
        beta = linspace(s,beta_max,100);
        rho = gamma*N./beta;
        I_max = N + rho.*(log(rho./S0)-1);
        plot(beta,I_max,'LineWidth',1);
        hold on;
    end
    legendCell = strcat('$$I_0=',string(num2cell(I0)),'$$');
    legend(legendCell, 'interpreter','latex','Location','southeast','fontsize',22);
    titel = strcat('$$\gamma = 1/',num2str(1/gamma),...
               ', N = ',num2str(N),...
               ' $$');
    title(titel,'Interpreter','latex','FontSize',22);
    %title('$$ \omega = 1/90, \psi = 0.164, I_0 = 100 $$','interpreter','latex');
    xlabel('$$ \beta $$','FontSize',22,'interpreter','latex');
    ylabel('$$ I_{\max} $$','FontSize',22,'interpreter','latex');
end