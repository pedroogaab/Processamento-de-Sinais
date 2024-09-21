clc;
clearvars;
close all;


[n, u] = degrau(-15, 15, 0); % define u[n]
[n2, u2] = degrau(-15, 15, -5); % define delta[n-3]
y = u - u2; % calcula o sinal resultante

figure; % abre uma nova figura
subplot(3, 1, 1) % divide a figura em 3 linhas e 1 coluna e seleciona a primeira entrada para o gráfico a seguir
stem(n, u)
ylabel('u[n]') % inclui uma legenda no eixo y

subplot(3, 1, 2) % divide a figura em 3 linhas e 1 coluna e seleciona a primeira entrada para o gráfico a seguir
stem(n2, u2)
ylabel('u[n+5]') % inclui uma legenda no eixo y

subplot(3, 1, 3)
stem(n, y) % plota o gráfico do sinal
xlabel('Amostra (n)') % inclui uma legenda no eixo x
ylabel('y[n]') % inclui uma legenda no eixo y




% codigo desenvolvido para adiconar um atraso so sinal de degrau (n0)
function [n, x] = degrau(n_min, n_max, n0) % u[n]
    n = n_min:1:n_max; % define um vetor com valores entre n_min e n_max com incrementos de 1
    x = zeros(size(n)); % define o sinal x, que é inicializado com valores zero e de mesmo tamanho do vetor n
    idx = (n >= n0); % encontra os índices do vetor n em são maiores que n0
    x(idx) = 1; % para os índices encontrados anteriormente, faz com que o vetor x seja 1
    % retorna os últimos valores de n e x
end

