% Murillo Rodrigo Petrucelli Homem

% Compassos

% Os compassos servem para facilitar a execução da música, pois definem uma unidade de tempo, 
% o ritmo e o pulso de uma composição musical. 

% O compasso separa os valores com acentuação periódica, alternando-se entre forte e fraco.

clear all
dt = 0.0001; 
dw = 1/dt;

T = 3; % um tempo arbitrário para escutar e contar os pulsos gerados
% frequência de base para o código; pode ser alterada para fins de ilustração considerando
% que não estamos interessados em gerar notas ou tons mas apenas um processo de contagem
f0 = 100; 
NC = 4;  % número de compassos para o experimento.

% Andamento = batidas por minuto de um metrônomo, por exemplo.
% A velocidade é dada em função desse parâmetro.
% Relacionada ao "andamento" da música: Exemplo: "allegro", 132 batidas por minuto; "andante", 63 a 72 batidas por minuto.

% A unidade de tempo é o valor musical que preenche, sozinho, um tempo do compasso.
% Tempo é a pulsação musical.
% A unidade de tempo dos compassos simples é preenchida pelos seguintes números: 1, 2, 4, 8, 16, 32 e 64. 
% Por exemplo, 4 dará que a unidade de tempo corresponde a uma semínima, 2 corresponde a uma mínima...
% O denominador indica a "espécie de valores" ou sua "qualidade". Por exemplo, 4, indica uma semínima.

% A unidade de compasso é o valor musical que é capaz de preencher o compasso inteiro.
% A unidade de compasso dos compassos simples é preenchida pelos seguintes números: 2, 3 e 4.
% O numerador indica quantas unidades de tempo têm o compasso (define ritmo).
% O numerador indica a quantidade de "valores" (quantas "figuras" cabem no compasso).

numerador = [2 3 4]; % quantas unidades de tempo existem no compasso.
denominador = [1 2 4 8 16 32 64]; % figuras para as unidades de tempo do compasso.

% Exemplos usuais:
% 2 / 4 -> compasso binário ("Argumento", de Paulinho da Viola)
% 3 / 4 -> compasso ternário (“Romaria”, de Renato Teixeira)
% 4 / 4 -> compasso quaternário ("Frevo Mulher", de Zé Ramalho): acentuação: 1 – forte, 2 – fraco, 3 – meio-forte, 4 – fraco.

n = numerador(3);  % Quantas unidades de tempo haverá no compasso.
d = denominador(3); % Define o valor (figura) da unidade de tempo.

% Por exemplo, para um compasso de 4 tempos (uma semibreve) o denominador informa que precisamos
% dividir por 4 para obter uma unidade de tempo correspondente a uma semínima de duração.
% Exemplo: d = denominador(3);
% Define o valor (figura) da unidade de tempo como uma semínima.

% Determinando a unidade de tempo (ut)
ut = T/d;

x = 0; c = 0; % c é o número de amostras por unidade de tempo (ut) do compasso

for tempo = [0:dt:ut-dt]
    x = x + 1; c = c + 1;
    hit(x) = sin(2*pi*f0*tempo)/(2*pi*f0*tempo);
endfor

x = 1; y = 1; b = 1; % determina a batida forte

while (x < NC*(n*c))
      if (y == c)
          y = 1;
          b = b + 1;
      endif
      if (b == (n+1))
          b = 1;
      endif      
      if (b == 1)
          a = 100; % batida forte
      else
          a = 10;
      endif      
      result(x) = a*hit(y);
      x = x + 1;
      y = y + 1;
endwhile

result = result ./ max(result);

audiowrite ("hit.wav",result,dw);

