clc,clear
[X,Y] = meshgrid(-2:0.2:2);
F = @(X,Y) 4*Y.^2 - 16;
[x,y] = ode45(F,[-2 2],2-1e-4);
DY = F(1,Y);
DX = DY*0+1;
cla
h1 = quiver(X,Y,DX,DY);
h2 = streamline(X,Y,DX,DY,-2:2,1.9*ones(1,5));
set(h2,'color','g')
hold on
h3 = plot(x,y,'r');
hold off