function[x, y] = DE2_rizzmaster(p,q, g,t0, tN, y0, y1, h)
n = 1 + round((tN - t0) / h); x = t0:h:tN; %vector for the h-steps
y = zeros(1, n);
%apply euler method for y(1)
y(1) = y0 + h * y1;
%apply the method given in the lab for remaining yvalues
for j = 1:n-1
    yderder = y1 * -p(x(j+1)) - y(j) * q(x(j+1)) + g(x(j+1)); %isolate y''
    yder = y1 + h * yderder;
    y1 = yder;
    y(j + 1) = y(j) + h * yder;
end
end