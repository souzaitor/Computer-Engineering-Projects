[⬅️ Voltar](https://github.com/souzaitor/Intro-Musical/blob/main/README.md#-notas-de-aula)

<div id="top"></div>

# 📖 Tópico 1: Conceitos Introdutórios da Computação Musical

<ul>
 <li><a href="#lei">🎵 Lei das Cordas</a></li>
 <li><a href="#altura">🎵 Altura</a></li>
 <li><a href="#natural">🎵 Escala Natural </a></li>  
 <li><a href="#temperada">🎵 Escala Temperada</a></li> 
 <li><a href="#sen">🎵 Modelo Matemático Senoidal</a></li>
</ul>                     

<div id="lei"></div>

## 🎵 Lei das Cordas

- Descobrindo as razões matemáticas entre as vibrações (frequências) das cordas e as notas geradas, Pitágoras determino a **Lei das Cordas**: A frequência é inversamente proporcional ao comprimento da corda
- **Oitava**: Uma é o intervalo entre uma nota musical e outra com a metade de sua frequência. Refere-se igualmente como sendo um intervalo musical de 2/1.
<p align="right">(<a href="#top">⬆️ Voltar ao Topo</a>)</p>

<div id="altura"></div>

## 🎵 Altura

- A vibração regular produz sons de altura definida, chamadas notas musicais
- Dessa forma, definimos nota musical por uma frequência específica
- Em particular, as notas são descritas por meio de sinais (figuras)

![Untitled](./Untitled.png)

- A medida que a frequência **sobe**, a altura **aumenta**.
- Quanto **mais alta** uma nota, **mais agudo** é a sensação da nota. Quanto **mais baixa** uma nota, **mais grave** é a sensação da nota.

<p align="right">(<a href="#top">⬆️ Voltar ao Topo</a>)</p>

<div id="natural"></div>

## 🎵 Escala Natural

![Untitled](./Untitled%201.png)

- O **tom** é a soma de dois semitons
- O **semitom** é o menor intervalo adotado entre duas notas (frequências) na música ocidental
- O **coma** é a nona parte de um tom

<p align="right">(<a href="#top">⬆️ Voltar ao Topo</a>)</p>

<div id="temperada"></div>

## 🎵 Escala Temperada

- No sistema Temperado para chegar no Semitom Ascendente (Sustenido) e no Semitom Descendente (Bemol ) são necessários andar 4.5 comas, então nesse caso Sustenido = Bemol

![Untitled](./Untitled%202.png)

- A escala temperada é dividida em intervalos iguais, i: **dó, dó#, ré, ré#, mi, fá, fá#, sol, sol#, lá, lá#, si**
- Se no intervalo de uma oitava a frequência dobra, podemos escrever: <img src="https://render.githubusercontent.com/render/math?math=i%5E%7B12%7D%3D2%20%5Ctext%7B%20ou%20%7D%20i%3D2%5E%7B1%2F12%7D">
- **valor de i = 1.012918**

<p align="right">(<a href="#top">⬆️ Voltar ao Topo</a>)</p>

<div id="sen"></div>

## 🎵 Modelo Matemático Senoidal

- A **onda senoidal** é a forma mais simples de sinal (função) periódica que permite explicar as propriedades percentuais do som, como a altura, intensidade, timbre, inclusive aspectos mais complexos como harmônicos
- Portanto, um modelo matemático para descrever o som pode ser construído com base em funções senoidais.

<img src="./Untitled%203.png" align="middle"/>

- A **amplitude**, igual ao raio da circunferência geradora, determina a **potência** sonora entre pelo sinal ( potência é a energia por unidade de tempo e mede-se em watts)
- A amplitude é um **parâmetro físico**, a intensidade representa a **percepção** da amplitude da vibração sonora e permite distinguir sons fortes de sons fracos.
- Enquanto **amplitude** e **potência** são conceitos físicos, **intensidade**, assim como **altura**, é um conceito psicofísico.
- A percepção do ouvido não é linear em relação à potência (amplitude ao quadrado)
- A intensidade (medida em dB - decibéis) de um som é dada por, sendo Po o **som de referência**:  <img src="https://render.githubusercontent.com/render/math?math=I%3D10%5Ccdot%5Clog(P%2FP_o)">

- Por exemplo, para produzir um som de intensidade duas vezes maior, é preciso utilizar cerca de 10 vezes mais potência acústica

<img src="./Untitled%204.png" width="200" align="middle"/>

<p align="right">(<a href="#top">⬆️ Voltar ao Topo</a>)</p>
