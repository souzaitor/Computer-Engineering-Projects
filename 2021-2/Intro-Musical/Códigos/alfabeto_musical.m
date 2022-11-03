% Código para gerar as notas correspondentes ao nosso alfabeto musical
% 26/04/2022
% Heitor Pereira de Souza

clear all  

% Escala Natural em Dó Maior
% Frequência das Notas 
n1 = 65.41;
n2 = 73.42;
n3 = 82.41;
n4 = 87.31;
n5 = 98.00;
n6 = 110.00;
n7 = 123.47;
n8 = 130.81;
n9 = 146.83;
n10 = 164.81;
n11 = 174.61;
n12 = 196.00;
n13 = 220.00;
n14 = 246.94;
n15 = 261.63;
n16 = 293.66;
n17 = 329.63;
n18 = 349.23;
n19 = 392.00;
n20 = 440.00;
n21 = 493.88;
n22 = 523.25;
n23 = 587.33;
n24 = 659.26;
n25 = 698.46;
n26 = 783.99;
n27 = 880.00;
n28 = 987.77;
n29 = 1046.50;
n30 = 1174.66;
n31 = 1318.51;
n32 = 1396.91;
n33 = 1567.98;
n34 = 1760.00;
n35 = 1975.53;
n35 = 1975.53;

% Frase 
%frase = [n15, n22, n18, n17, n15, n19, n16, n15, n19, n15, n19, n12, n5, n8, n15, n16, n23, n19, n21, n20, n21, n24, n28];
frase = [n23, n27, n26, n19, n21, n22, n18, n11, n14, n11, n15, n19, n21, n20, n21, n25, n18, n17, n16, n15, n16, n19, n21, n28];

% Parametros de Gravaçao
sr = 44100;         % Frequência de Amostragem Padrão
intervalo = 1/sr;   % Periodo = 1 / Frequência
T = 0.5;            % Período de cada nota
x = 0;              % Contador 

% Geração das Notas
for f0 = frase
    for g = [0:intervalo:T]
        x = x + 1;   
        sinal(x) = sin(2*pi*f0*g);
    endfor	   
endfor

audiowrite ("musica.wav", sinal, sr);

