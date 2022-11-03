
% C�digo exemplo para a s�ntese de uma nota musical
% Murillo Rodrigo Petrucelli Homem

clear all  

% Parametros de grava�ao
sr = 44100; % frequ�ncia de amostragem padrao
intervalo = 1/sr;

T = input("Entre com o tamanho do sinal em segundos: ");

f0 = input("Entre com o valor da frequ�ncia fundamental (em Hertz): "); 

printf("O tamanho do sinal � de %d segundos e a frequ�ncia fundamental de %f Hz.\n\n",T,f0);

% calculando a frequencia angular (sua medida � rad/s ou radianos por segundo)
w0 = 2*pi*f0;

x = 0;

format long g;

for g = [0:intervalo:T]

    x = x + 1;  
    sinal(x) = 1*sin(w0*g);
						   
endfor

audiowrite ("nota_gerada.wav", sinal, sr);
