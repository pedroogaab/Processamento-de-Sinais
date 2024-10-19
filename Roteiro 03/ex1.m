%% Definição do sinal analisado
clc;close all;clearvars;
N = 11; % período de 11 amostras
omega0 = 2*pi/N; % frequência fundamental do sinal
n = 0:1:2*N; % gera vetor de amostras
x = sin(omega0*n);
k_min = 0;
k_max = N-1;


% Só precisa passar um período de x[n] para calcular seus
% coeficientes da série de Fourier
a = coef_fourier(x(1:N), k_min, k_max, omega0, N);

% Gráfico do sinal analisado
figure;
stem(n, x)
ylabel('x[n]')
xlabel('Amostra (n)')


% Gera o gráfico das partes real e imaginária
figure;
subplot(2,1,1)
stem(k_min:1:k_max, real(a))
title('Valores de a_k na representação cartesiana')
ylim([min(-1,min(real(a))), max(1,max(real(a)))]) % limites do eixo y do gráfico
ylabel('R{a_k}')
grid on
subplot(2,1,2)
stem(k_min:1:k_max, imag(a))
ylim([min(-1,min(imag(a))), max(1,max(imag(a)))]) % limites do eixo y do gráfico
ylabel('I{a_k}')
grid on

% Gera o gráfico de a_k na representação polar
figure;
subplot(2,1,1)
stem(k_min:1:k_max, abs(a))
title('Valores de a_k na representação polar')
ylim([min(-1,min(abs(a))), max(1,max(abs(a)))]) % limites do eixo y do gráfico
ylabel('abs(a_k)')
grid on
subplot(2,1,2)
stem(k_min:1:k_max, angle(a))
ylim([min(-1.1*pi,min(angle(a))), max(1.1*pi,max(angle(a)))]) % limites do eixo y do gráfico
ylabel('fase(a_k) (rad)')
grid on
%% Funções
function a = coef_fourier(x, k_min, k_max, omega0, N)

    n = 0:1:N-1;  % Vetor de índices de tempo

    for k = k_min:1:k_max
        % Cálculo do coeficiente a_k
        a(k - k_min + 1) = (1/N) * sum(x .* exp(-1j * k * omega0 * n));
    end
end
    