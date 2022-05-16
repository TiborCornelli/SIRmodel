M = readmatrix('newton_data.csv');
t = M(2:end,1);
I = M(2:end,2);

N = 3;
b = zeros(2,N);
b(:,1) = [0.2 1]';
for i=1:N-1
    u = exp(b(1,i)*t);
    s = I - b(2,i)*u;
    F = s'*s;
    dFdb = [-2*b(2,i)*s'*(t.*u) -2*s'*u];
    disp(dFdb'*dFdb)
    deltab = inv(dFdb'*dFdb)*(-dFdb'*F);
    disp(deltab);
    b(:,i+1) = b(:,i) + deltab;
end