function[x,y] = systemsolver_rizzmaster(f1, f2, t0,tN,y0,h)
n = round(((tN-t0)/h), 0); 
x = linspace(t0, tN, n);
y = zeros(2, n); y(1, 1) = y0(1); y(2, 1) = y0(2);
for j = 1:n-1
    x_1_slope_1 = f1(x(j), y(1, j), y(2,j)); x_1_slope_2 = y(1, j) + h*f1(x(j), y(1, j), y(2,j));
    x_2_slope_1 = f2(x(j), y(1, j), y(2,j)); x_2_slope_2 = y(2, j) + h*f2(x(j), y(1, j), y(2,j));
    y(1, 1 + j) = y(1, j) + 0.5*h*(x_1_slope_1 + f1(h + x(j), x_1_slope_2, x_2_slope_2));
    y(2, 1 + j) = y(2, j) + 0.5*h*(x_2_slope_1 + f2(h + x(j), x_1_slope_2, x_2_slope_2));
end