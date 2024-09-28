clc;
clearvars;
close all;

[n, u] = degrau(0,20, 5); % define u[n]
[n, delta] = pulso(0, 20, 0); % define delta[n-3]


y = convolucao(u, delta); % executa a convolu��o

% Plota o gr�fico da convolu��o
figure;
subplot(3,1,1)
stem(n, u)
grid on
ylabel('x[n]')
subplot(3,1,2)
stem(n, delta)
grid on
ylabel('h[n]')
subplot(3,1,3)
stem(0:length(y)-1, y)
grid on
xlabel('Amostra (n)')
ylabel('Sa�da do sistema y[n]')


function [y] = convolucao(x, h)
    y = zeros(1, length(x)+length(h)-1); % inicializa y=0, tendo o tamanho do vetor de entrada mais o vetor de convolu��o menos um
    hd = zeros(size(x)); % inicializa o vetor de resposta impulsiva deslocado como zero
    for i = 1:length(y) % loop para iterar entre todos os �ndices de y
        % Desloca o vetor hd para a direita
        hd(2:end) = hd(1:end-1);
        if i <= length(h)
            hd(1) = h(i); % adiciona a pr�xima amostra de h[n] no vetor h[d], caso exista
        else
            hd(1) = 0; % adiciona zero no in�cio do vetor hd, caso a resposta impulsiva tenha encerrado
        end
        y(i) = hd*x';
    end
end


function [n, x] = degrau(n_min, n_max, n0)
    n = n_min:1:n_max; % define um vetor com valores entre n_min e n_max com incrementos de 1
    x = zeros(size(n)); % define o sinal x, que � inicializado com valores zero e de mesmo tamanho do vetor n
    idx = (n >= n0); % encontra os �ndices do vetor n em s�o maiores que n0
    x(idx) = 1; % para os �ndices encontrados anteriormente, faz com que o vetor x seja 1
    % retorna os �ltimos valores de n e x
end

function [n, delta] = pulso(n_min, n_max, j)
    n = n_min:1:n_max;
    
    delta = zeros(size(n));
    idx = (n == j);
    delta(idx)=1;
    

end
