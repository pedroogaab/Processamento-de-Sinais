%% Defini��o do sinal analisado
clc; close all; clearvars;
N = 15; % per�odo de 11 amostras
omega0 = 2*pi/N; % frequ�ncia fundamental do sinal
n = 0:1:2*N; % gera vetor de amostras
o0n = omega0 * n;

x = 2 + cos(o0n) + 2*sin((2*o0n) + (3*pi/2)) + 0.5*cos((4*o0n) + (pi/6)); % Alterado para o sinal desejado
k_min = -7;
k_max = 7;

% C�lculo dos coeficientes da s�rie de Fourier
a = coef_fourier(x(1:N), k_min, k_max, omega0, N);

% Gr�fico do sinal analisado
figure;
stem(n, x)
ylabel('x[n]')
xlabel('Amostra (n)')

% Gera o gr�fico das partes real e imagin�ria
figure;
subplot(2,1,1)
stem(k_min:1:k_max, real(a))
title('Valores de a_k na representa��o cartesiana')
ylim([min(-1, min(real(a))), max(1, max(real(a)))]) % limites do eixo y do gr�fico
ylabel('R{a_k}')
grid on
subplot(2,1,2)
stem(k_min:1:k_max, imag(a))
ylim([min(-1, min(imag(a))), max(1, max(imag(a)))]) % limites do eixo y do gr�fico
ylabel('I{a_k}')
grid on

% Gera o gr�fico de a_k na representa��o polar
figure;
subplot(2,1,1)
stem(k_min:1:k_max, abs(a))
title('Valores de a_k na representa��o polar')
ylim([min(-1, min(abs(a))), max(1, max(abs(a)))]) % limites do eixo y do gr�fico
ylabel('abs(a_k)')
grid on
subplot(2,1,2)
stem(k_min:1:k_max, angle(a))
ylim([min(-1.1*pi, min(angle(a))), max(1.1*pi, max(angle(a)))]) % limites do eixo y do gr�fico
ylabel('fase(a_k) (rad)')
grid on

%% Fun��es
function a = coef_fourier(x, k_min, k_max, omega0, N)
    n = 0:1:N-1;  % Vetor de �ndices de tempo

    for k = k_min:1:k_max
        % C�lculo do coeficiente a_k
        a(k - k_min + 1) = (1/N) * sum(x .* exp(-1j * k * omega0 * n));
    end
end
