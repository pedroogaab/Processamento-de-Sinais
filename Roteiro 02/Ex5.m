clc;
clearvars;
close all;

[n, x] = seno(-10, 10, 2, 2*pi/6, pi/4);

figure;
stem(n, x)
xlabel('Amostra (n)') 
ylabel('Sinal Seno') 

function [n, res] = seno(n_min, n_max, A, omega0, phase)
    n = n_min:1:n_max;
    res = A * sin(omega0 * n + phase);
end
