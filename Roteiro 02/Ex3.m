clc;
clearvars;
close all;


[n, delta] = pulso(-10, 10, -3); % define delta[n-3]



subplot(3, 1, 2) % divide a figura em 3 linhas e 1 coluna e seleciona a primeira entrada para o gráfico a seguir
stem(n, delta)
ylabel('delta[n+3]') % inclui uma legenda no eixo y




function [n, delta] = pulso(n_min, n_max, j)
    n = n_min:1:n_max;
    
    delta = zeros(size(n));
    idx = (n == j);
    delta(idx)=1;
    

end

