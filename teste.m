clear vars;
close all;
clc;

xmin = -10;
xmax = 10;
x = xmin:xmax;
FX = calculaFX(x);
plot(x, FX, 'r-');