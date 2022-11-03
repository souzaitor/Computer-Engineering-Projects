
% Filtro passa-baixa (low-pass)
% Murillo Rodrigo Petrucelli Homem

clear all  

T = input("Entre com o tamanho do sinal em segundos: ");
f0 = input("Entre com o valor da frequência fundamental (em Hertz): ");
H = input("Entre com o número de harmônicos: ");
C = input("Entre com a frequencia de corte (cut-off): ");

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

% Constrói o filtro passa-baixa (filtro de média simples)
% Uma característica deste filtro é seu caráter oscilatório!
dw = 1/delta;
M = round(dw/C); % Tamanho da janela de corte
for n = [1:M]
    l(n) = 1;
endfor
l = (1/M).*l; % necessário para manter o nível DC

filtro(1:M) = l(1:M);
filtro_padding = [filtro zeros(1,1/delta)];
ft_filtro = fft(filtro_padding,(1/delta)); % calcula a Transformada de Fourier do filtro passa-baixa
s3 = abs(ft_filtro);

hold on; 
figure(3);
plot([0:(H*f0)],s3(1:(H*f0)+1),'LineWidth',2,'Color','b');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
hold off;

sinal_filtrado = conv(sinal,l,"same");

sinal2(1:1/delta) = sinal_filtrado(1:1/delta);
sinal_padding2 = [sinal2 zeros(1,1/delta)];
ft_sinal2 = fft(sinal_padding2,(1/delta)); % calcula a Transformada de Fourier para 1 segundo do sinal filtrado
s4 = abs(ft_sinal2);

hold on; 
figure(4);
plot([0:(H*f0)],s4(1:(H*f0)+1),'LineWidth',2,'Color','g');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
hold off;

hold on; 
figure(5);
plot([0:delta:T],sinal_filtrado,'LineWidth',2,'Color','r');
xlabel('Tempo (s)');
ylabel('Amplitude');
hold off;

