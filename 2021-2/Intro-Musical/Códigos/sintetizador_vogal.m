% Murillo Rodrigo Petrucelli Homem
% C�digo exemplo para sintetizar vogais

% Tabela com valores de formantes para a s�ntese de vogais
%
%                                           Primeiro formante          |            Segundo formante             |        Vogal
%                                                800                   |                   1200                  |         /a/
%                                                460                   |                   1800                  |         /e/ (aberto)
%                                                570                   |                   1590                  |         /e/ (fechado)
%                                                320                   |                   2110                  |         /i/
%                                                450                   |                   950                   |         /o/ (aberto)
%                                                560                   |                   1050                  |         /o/ (fechado)
%                                                320                   |                   850                   |         /u/

clear all
close all

nome = input("Entre com o nome da vogal: ");  % Exemplo, digite entre aspas "a.wav". N�o esque�a da extens�o wave
% uma tabela com as frequ�ncias dos primeiro e segundo formantes para vogais 
% da lingua Portuguesa est� no in�cio deste arquivo
formante_1 = input("Entre com o primeiro formante (em Hz): "); 
formante_2 = input("Entre com o segundo formante (em Hz): ");

% Par�metros fixos para o experimento
sigma = 3;    % desvio padr�o para os filtros de resson�ncia (o aluno fica convidado a testar outros valores)
T  = 1;       % o sinal gerado � de 1 segundo
f0 = 120;     % frequ�ncia fundamental do sinal de base para uma voz masculina, mais grave (em m�dia)
H = 40;       % serão utilizados 40 harmônicos na síntese da onda dente de serra

% para o caso da m�dia da f0 em mulheres, em torno de 220 Hz, o n�mero de harm�nicos deve ser aproximadamente 20
% (neste c�digo, o n�mero de harm�nicos est� sendo ajustado para n�o violar o teorema de Nyquist)

% Calculando a frequ�ncia angular (sua medida � rad/s ou radianos por segundo)
w0 = 2*pi*f0;
delta = 0.0001;  % Cuidado! A frequ�ncia m�xima que o sinal poder� conter � de 5 kHz (teorema de Nyquist)
dw = 1/delta;
A = 1;           % Amplitude da onda para refer�ncia (ser� mantida em um)

% Gera uma onda dente de serra
x = 0;
for tempo = [0:delta:T-delta] 
    x = x + 1;
    soma = 0;
    for k = [1:H]
      soma = soma + ((-1)^k)*(1/k)*sin(k*w0*tempo);
    endfor
    sinal(x) = ((2*A)/pi)* soma;
endfor

% calcula a Transformada de Fourier para o sinal aproximado da dente de serra
sinal_padding = [sinal zeros(1,dw)];
ft_sinal = fft(sinal_padding,dw); 

% Cnstr�i os filtros passa-banda no dom�nio de Fourier (frequ�ncia) para os formantes
for n = [1:dw]
     filtro1(n) = exp((-1)*(((n-formante_1)^2)/(2*(sigma^2))));
     filtro2(n) = exp((-1)*(((n-formante_2)^2)/(2*(sigma^2))));
endfor

% filtra a onda dente de serra (considerando o primeiro formante)
ft_sinal_filtrado_f1 =  ft_sinal .* filtro1;
% filtra a onda dente de serra (considerando o segundo formante)
ft_sinal_filtrado_f2 =  ft_sinal .* filtro2;

% voltando para o dom�nio do tempo...
sinal_filtrado_f1 = ifft(ft_sinal_filtrado_f1);
sinal_filtrado_f2 = ifft(ft_sinal_filtrado_f2);
sinal_filtrado =  sinal_filtrado_f1 .+ sinal_filtrado_f2;

% Ajusta a amplitude do sinal nas frequ�ncias desejadas (simulando o processo de resson�ncia)
fator_amplificacao = 10; % o aluno � convidado a trabalhar com outros valores
sinal_filtrado_amplificado = fator_amplificacao .* sinal_filtrado; % lembrando que s�o n�meros complexos

vogal_gerada = sinal .* sinal_filtrado_amplificado;

% gera uma envolt�ria Gaussiana
x = 0;
sigma = 0.1;
for tempo = [0:delta:T-delta] 
    x = x + 1;
    envoltoria(x) = exp((-1)*(((tempo-0.5)^2)/(2*(sigma^2))));
endfor

vogal_gerada = envoltoria .* real(vogal_gerada); % agora temos valores reais

% normalizando o �udio da vogal gerada entre [-1,1]
vogal_gerada = vogal_gerada ./ max(vogal_gerada);

hold on; 
figure(1);
plot([0:delta:T-delta],vogal_gerada(1:dw),'LineWidth',2,'Color','r');
xlabel('Tempo (s)');
ylabel('Amplitude');
hold off;

% salva a vogal
audiowrite (nome,vogal_gerada,dw);