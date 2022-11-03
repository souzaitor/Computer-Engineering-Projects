% C�digo para a S�ntese de uma nota musical com envolt�rio linear
% Heitor Pereira de Souza
% RA: 744596
% 04/02/2022

clear all  

% Parametros de grava�ao
sr = 44100; % Frequ�ncia de Amostragem Padr�o
intervalo = 1/sr;

T = input("Entre com o tamanho do sinal em segundos: ");

f0 = input("Entre com o valor da frequ�ncia fundamental (em Hertz): "); 

nome = input("Entre com o nome do arquivo a ser gerado: ", "s"); 

printf("O tamanho do sinal � de %d segundos e a frequ�ncia fundamental de %f Hz.\n\n",T,f0);

% Calculando a Frequencia Angular (sua medida � rad/s ou radianos por segundo)
w0 = 2*pi*f0;

x = 0;

format long g;

for g = [0:intervalo:T]

    x = x + 1;  
    sinal(x) = (1-g/T)*sin(w0*g);
    
endfor

nome = strcat(nome, ".wav"); 
audiowrite (nome, sinal, sr);
