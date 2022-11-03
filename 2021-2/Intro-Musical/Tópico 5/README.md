[⬅️ Voltar](https://github.com/souzaitor/Intro-Musical/blob/main/README.md#-notas-de-aula)

<div id="top"></div>

# 📖 Tópico 5: Composição Algorítmica
<ul>
 <li><a href="#t1">🎵 Ressonância</a></li>
 <li><a href="#t2">🎵 Formantes</a></li>  
 <li><a href="#t3">🎵 Referências </a></li>  
</ul>                     

<div id="t1"></div>

## 🎵 Ressonância

Exploramos como, a partir de uma frequência, a qual chamamos frequência fundamental, denotada comumente por f0, um som com características mais complexas pode ser gerado, ou melhor, sintetizado. Relembrando, dada uma frequência f0, podemos construir uma série harmônica (no tempo) como

<!-- $s(t) = \sum_{k=1}^{n} A_k\cdot\sin(kw_0t)$ --> <div align="center"><img style="transform: translateY(0.1em); background: white;" src="https://render.githubusercontent.com/render/math?math=s(t)%20%3D%20%5Csum_%7Bk%3D1%7D%5E%7Bn%7D%20A_k%5Ccdot%5Csin(kw_0t)"></div>

sendo w0 = 2π · f0 a frequência angular, n o número total de harmônicos (frequência múltiplas inteiras da fundamental ) utilizados na série e Ak sendo a amplitude de cada uma das funções senos consideradas nas parcelas da série. Assumimos um número de harmônicos finito para fins práticos. Verifica-se que as notas musicais são exemplos de sinais harmônicos e f0 a menor frequência capaz de produzir ondas estacionárias em um instrumento musical.

Vamos considerar agora um conceito muito importante que pode alterar as frequências em um sistema físico, chamado ressonância. Trata-se de fenômeno que ocorre quando uma força  ́e aplicada (sobre um sistema físico) com uma frequência igual ou muito próxima da fundamental desse sistema.O fenômeno ocasiona um aumento na amplitude de oscilação maior do que aquele ocasionado por outras frequências.

Conceitualmente, existem diversos tipos de ressonância como a mecânica, a sonora, a elétrica, a magnética e a  ́optica. Neste texto, estamos interessados principalmente na **ressonância sonora**.

A ressonância sonora acontece quando uma fonte emissora (evidentemente, de um som) consegue emitir ondas em frequências muito próximas à frequência de oscilação natural de um receptor mecânico. Essa frequência natural do receptor ́e exatamente o que já definimos anteriormente como **frequência fundamental**. Podemos dizer que cada corpo possui uma frequência e quando encontra ondas sonoras geradas por outros corpos que tenham a mesma frequência natural de vibração, passam a vibrar também, havendo um reforço desta frequência natural.

Matematicamente, na equação (1), por exemplo, para determinadas frequências, algumas parcelas da soma, são amplificadas, ou seja, alguns Ak são alterados significativamente em relação a outros.

<p align="right">(<a href="#top">⬆️ Voltar ao Topo</a>)</p>

<div id="t2"></div>

## 🎵 Formantes

Diretamente associado ao fenômeno da ressonância sonora, o conceito de formante ́e importantíssimo no estudo do som, como elemento caracterizador do timbre (de um instrumento, da voz etc). Definimos um formante como picos de energia em uma região do espectro sonoro. Nesse sentido, parciais (de frequência) que se encontram nessa região de ressonância serão realçados. 

Verifica-se que enquanto o espectro de cada nota produzida por um instrumento musical ́e alterado consideravelmente em função da altura, as regiões dos formantes permanecem praticamente estáveis, seja qual for a frequência da nota. Assim, dizemos que os formantes funcionam como **uma espécie de assinatura para uma determinada fonte sonora**, ajudando a caracterizar seu timbre.

Formantes podem ter origem a partir de estruturas físicas (dentro de caixas de ressonância, por exemplo) que alteram determinadas frequências do espectro sonoro. A título de ilustração, a tabela 1 apresenta algumas frequências de formantes para alguns instrumentos de sopro. 

Particularmente, os formantes são importantes na geraçãao das vogais, isto ́e, na determinaçãao da fala humana, considerando o aparelho fonador humano como uma caixa de ressonância (ilustrado na figura 1). A formaçãao do som das vogais se dá pela alteração física de determinadas regiões do aparelho fonador, em particular da língua, amplificando frequências específicas. Na prática, as vogais podem ser caracterizadas por apenas dois formantes, embora alguns autores mencionam o uso de quatro (ou mais). 

<div align="center"><img src="./img1.JPG" width="400"></div>

O primeiro, relaciona-se com a altura do tom modificado pela língua, sendo inversamente proporcional a este. Desse modo, as vogais com tons mais altos têm as frequências dos primeiros formantes mais baixas e vice-versa.

O segundo formante está associado à anterioridade e posterioridade da língua em relaçãao ao seu eixo (movimento horizontal). As vogais mais anteriores apresentam um segundo formante mais alto e as posteriores mais baixo. De maneira geral, as médias e as centrais exibem valores intermediários.

<div align="center"><img src="./img2.JPG" width="400"></div>

A tabela 2 apresenta os primeiros e segundos formantes (em Hz) para o som correspondente as vogais (em média). 

Vale observar que os valores das frequências formantes que definem uma vogal não dependem, em um modelo simplificado, da frequências fundamental utilizada. No mesmo sentido, os mesmos formantes podem ser utilizados para sintetizar vogais considerando diversos idiomas. Isto ́e, não importa se estamos interessados em sintetizar vogais da língua Portuguesa ou da língua Inglesa, em princípio, os mesmos formantes podem ser utilizados. 

No que se refere a síntese de voz, a frequências fundamental pode ser utilizada para caracterizar uma voz masculina ou feminina. No primeiro caso, ́e muito comum utilizar uma frequências de aproximadamente 120 Hz para a fundamental. Para uma voz feminina, considera-se valores entre 220 e 300 Hz. Importante ressaltar que esses valores são estimados através de experimentos ac acústicos e sempre são resultados médios.

<div align="center"><img src="./img3.JPG" width="400"></div>

<p align="right">(<a href="#top">⬆️ Voltar ao Topo</a>)</p>

<div id="t3"></div>

# Referências

* [▶️ How to Write a Melody?](https://www.youtube.com/watch?v=rl-V2IsUprQ&feature=youtu.be&ab_channel=fastforwardable)

* [▶️ Três dicas para escrever uma grande melodia](https://www.youtube.com/watch?v=OEIk3bJtTNw&ab_channel=12tone)

* [▶️ Music’s MAGICAL Grammar, EXPLAINED](https://www.youtube.com/watch?v=4Wo4aPJwNwQ&ab_channel=CreativelyeXplained)

* [▶️ Regular Languages: Deterministic Finite Automaton (DFA)](https://www.youtube.com/watch?v=PK3wL7DXuuw&ab_channel=lydia)

* [▶️ Regular Languages: Nondeterministic Finite Automaton (NFA)](https://www.youtube.com/watch?v=W8Uu0inPmU8&ab_channel=lydia)


<p align="right">(<a href="#top">⬆️ Voltar ao Topo</a>)</p>