
% Filtro passa-alta
% Murillo Rodrigo Petrucelli Homem

clear all  

T = input("Entre com o tamanho do sinal em segundos: ");
f0 = input("Entre com o valor da frequência fundamental (em Hertz): ");
H = input("Entre com o número de harmônicos: ");

% calculando a frequencia angular (sua medida é rad/s ou radianos por segundo)
w0 = 2*pi*f0;
delta = 0.0001;  % Cuidado! A frequência máxima que o sinal poderá conter é de 5kHz

for k = [1:H]
    p(k) = 1/(2*k);  % um exemplo para as amplitudes das parcelas senoidais
endfor

x = 0;
for tempo = [0:delta:T] 
    x = x + 1;
    soma = 0;
    for k = [1:H]
      soma = soma + p(k)*sin(k*w0*tempo);
    endfor
    sinal(x) = soma;
endfor

hold on;
figure(1);
plot([0:delta:T],sinal,'LineWidth',2,'Color','r');
xlabel('Tempo (s)');
ylabel('Amplitude');
hold off;

sinal1(1:1/delta) = sinal(1:1/delta);
sinal_padding = [sinal1 zeros(1,1/delta)];
ft_sinal = fft(sinal_padding,(1/delta)); % calcula a Transformada de Fourier para 1 segundo do sinal
s2 = abs(ft_sinal);

hold on; 
figure(2);
plot([0:(H*f0)],s2(1:(H*f0)+1),'LineWidth',2,'Color','b');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
hold off;

% Constrói o filtro passa-alta
dw = 1/delta;
sigma = 10;  % o desvio padrão deve ser ajustado para cortar as frequências desejadas!
for n = [1:dw]
     filtro(n) = exp((-1)*(((n)*(n))/(2*sigma*sigma)));
endfor
filtro = filtro ./ filtro(1);
high = 1.0 .- filtro;

hold on; 
figure(3);
plot([0:(H*f0)],high(1:(H*f0)+1),'LineWidth',2,'Color','b'); % intervalo ajustado para exibição apenas
xlabel('Frequência (Hz)');
ylabel('Magnitude');
hold off;

for k = [1:dw]
  ft_sinal_filtrado =   ft_sinal .* high;
endfor

hold on; 
figure(4);
plot([0:(H*f0)],abs(ft_sinal_filtrado(1:(H*f0)+1)),'LineWidth',2,'Color','b'); % intervalo ajustado para exibição apenas
xlabel('Frequência (Hz)');
ylabel('Magnitude');
hold off;

sinal_filtrado = ifft(ft_sinal_filtrado);

hold on; 
figure(5);
plot([0:delta:T-delta],abs(sinal_filtrado(1:dw)),'LineWidth',2,'Color','r');
xlabel('Tempo (s)');
ylabel('Amplitude');
hold off;

