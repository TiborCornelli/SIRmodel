function [t,S,I,R] = ode23s_impfung(T,S0,I0,R0,alpha,beta,gamma)
    N = S0 + I0 + R0;
    pars = [alpha beta gamma N];
    y0 = [S0 I0 R0];
    tspan = [0 T];
    options = odeset('Events',@events);
    [t,y,~,~] = ode23s(@sir_rhs, tspan, y0, options, pars);
    xlim(tspan);
    
    S = y(:,1);
    I = y(:,2);
    R = y(:,3);
    
    function f = sir_rhs(~,y,pars)
        f    = zeros(3,1);
        f(1) = -pars(2)*y(1)*y(2)/pars(4) - pars(1)*y(1);
        f(2) = pars(2)*y(1)*y(2)/pars(4) - pars(3)*y(2);
        f(3) = pars(3) * y(2) + pars(1)*y(1);
    end

    function [value,isterminal,direction] = events(~,y,pars)
        value      = pars(1)*y(1)*y(2) - pars(2)*y(2); 
        isterminal = 0;
        direction  = 0;
    end
end
