
% Código exemplo para síntese de sinais mais complexos a partir de somas de senos
% Aproximando a onda dente de serra
% Murillo Rodrigo Petrucelli Homem

clear all  

T = input("Entre com o tamanho do sinal em segundos: ");
f0 = input("Entre com o valor da frequência fundamental (em Hertz): ");
H = input("Entre com o número de harmônicos: ");
printf("O tamanho do sinal é de %d segundos e a frequência fundamental de %f Hz.\n\n", T, f0);

% calculando a frequencia angular (sua medida é rad/s ou radianos por segundo)
w0 = 2*pi*f0;
delta = 0.0001;  % Cuidado! A frequência máxima que o sinal poderá conter é de 5kHz
A = 1; % amplitude da onda

x = 0;
for tempo = [0:delta:T] 
    x = x + 1;
    soma = 0;
    for k = [1:H]
      soma = soma + ((-1)^k)*(1/k)*sin(k*w0*tempo);
    endfor
    sinal(x) = ((2*A)/pi)* soma;
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
a = log(1.0 + abs(ft_sinal));

hold on; 
figure(2);
plot([0:(H*f0)],a(1:(H*f0)+1),'LineWidth',2,'Color','b');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
hold off;
