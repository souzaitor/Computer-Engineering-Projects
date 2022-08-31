# Algoritmo de Encadeamento para Trás em Prolog 

## Sobre o projeto

Trabalho de implementação de um sistema baseado em lógica proposto durante o curso da disciplina de Inteligência Artificial (1001336), oferecida pelo Departamento de Computação da UFSCar no semestre ENPE 2020/2.

## Objetivo 

O objeito do trabalho é usar a linguagem Prolog para implementar um sistema baseado em lógica que possa recomendar uma categoria de carteira de investimentos para potenciais investidores, usando o algoritmo de encadeamento para trás  com  busca  em  profundidade.  A  recomendação  é  feita  em  função  do  perfil  de  investidor,  valor  a  ser 
investido, situação financeira, período que se deseja deixar o dinheiro investido e conhecimento do mercado financeiro. O perfil do investidor, por sua vez, é inferido com base no objetivo do investimento e na tolerância a risco. A situação financeira depende do valor da renda anual e do fato da renda ser ou não estável. O valor a ser investido e o período do investimento são inferidos a partir de faixas de valores. 

As variáveis que aparecem na formulação do problema e seus respectivos valores são: 
- Investimento: Categorias de 1 a 6 
- Perfil do investidor: conservador, moderado ou agressivo.  
- Valor a ser investido: baixo, médio ou alto 
- Período do investimento: curto, mediano ou longo  
- Situação financeira: adequada ou inadequada.  
- Objetivo do investimento: preservar capital, acumular recurso ou especular 
- Tolerância a risco: baixa, média ou alta 
- Conhecimento do mercado financeiro: pouco ou muito. 
 
O período desejado para a aplicação é dado em número de meses. O valor a ser aplicado é dado em reais, bem como a renda anual. As categorias que podem ser recomendadas especificam os tipos de investimentos e a proporção do valor a ser investido em cada tipo. São elas: 
- Categoria 1: Renda fixa com curto prazo 
- Categoria 2: Renda fixa com curto prazo (50%) e renda fixa com médio e longo prazo (50%) 
- Categoria 3: renda fixa com curto e longo prazo (70%) e renda variável (30%) 
- Categoria 4: Renda fixa com curto e longo prazo (50%) e renda variável (50%) 
- Categoria 5: Renda fixa com curto e longo prazo (20%) e renda variável (80%) 
- Categoria 6: Renda fixa com curto e longo prazo (15%), renda variável (65%) e minicontrato futuro (20%) 

Usando um conjunto de sentenças da Base de Conhecimento na forma de clausulas definidas de primeira ordem fornecidas pela docente, foi feita  a  implementação  em Prolog  da  base  de  conhecimento,  incluindo    os  fatos  que  definem cada situação inicial, que são as informações específicas de um investidor em particular. 

## Créditos
Autor: Heitor Souza

## Copyright 
This project is licensed under the terms of the MIT license.
