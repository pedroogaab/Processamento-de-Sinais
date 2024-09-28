clc;
clearvars;
close all;


[n, u] = degrau(-15, 15, 0); % define u[n]
[n2, sen] = seno(-15, 15, 1, 2*pi/5, 0); % define y[n], com os valores variando em 0.5 entre 1 e -1

y = u .* sen; % calcula o sinal resultante

figure; % abre uma nova figura
subplot(3, 1, 1) % divide a figura em 3 linhas e 1 coluna e seleciona a primeira entrada para o gr�fico a seguir
stem(n, u)
ylabel('u[n]') % inclui uma legenda no eixo y

subplot(3, 1, 2) % divide a figura em 3 linhas e 1 coluna e seleciona a primeira entrada para o gr�fico a seguir
stem(n2, sen)
ylabel('sen(2pi/5)n') % inclui uma legenda no eixo y

subplot(3, 1, 3)
stem(n, y) % plota o gr�fico do sinal
xlabel('Amostra (n)') % inclui uma legenda no eixo x
ylabel('y[n]') % inclui uma legenda no eixo y




% codigo desenvolvido para adiconar um atraso so sinal de degrau (n0)
function [n, x] = degrau(n_min, n_max, n0) % u[n]
    n = n_min:1:n_max; % define um vetor com valores entre n_min e n_max com incrementos de 1
    x = zeros(size(n)); % define o sinal x, que � inicializado com valores zero e de mesmo tamanho do vetor n
    idx = (n >= n0); % encontra os �ndices do vetor n em s�o maiores que n0
    x(idx) = 1; % para os �ndices encontrados anteriormente, faz com que o vetor x seja 1
    % retorna os �ltimos valores de n e x
end

function [n, res] = seno(n_min, n_max, A, omega0, phase)
    n = n_min:1:n_max;
    res = A * sin(omega0 * n + phase);
end
