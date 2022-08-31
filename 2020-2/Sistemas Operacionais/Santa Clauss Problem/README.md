# 🎅🏻 Santa Clauss Problem

Implementação do problema de IPC (Inter Process Communication Santa Clauss proposto durante o curso da disciplina de Sistemas Operacionais (1001535), oferecida pelo Departamento de Computação da UFSCar no semestre ENPE 2020/2

<div id="top"></div>
<!-- Sumário -->
<details>
  <summary>Sumário</summary>
  <ol>
    <li><a href="#sobre-o-projeto">💻 Sobre o Projeto</a></li>
    <li><a href="#usando">☕ Usando o Projeto</a></li>
    <li><a href="#Licença">📝 Licença</a></li>
    <li><a href="#Autor">📧 Autor</a></li>
    <li><a href="#Referências">📝 Referências</a></li>
  </ol>
</details>

<div id="sobre-o-projeto"></div>
<!-- ABOUT THE PROJECT -->

## 💻 Sobre o Projeto

O projeto implementa e estuda o Santa Clauss Problem proposto William Stallings no seu livro Operating Systems: Internals and Design Principles. Prentice Hall, fourth edition, 2000. A implementação é baseada na resolução proposta no The Little Book of Semaphores de Allen B. Downey.

A desrição literal do problema retirada do livro:
```
    Santa Claus sleeps in his shop at the North Pole and can only be
awakened by either (1) all nine reindeer being back from their vaca-
tion in the South Pacific, or (2) some of the elves having difficulty
making toys; to allow Santa to get some sleep, the elves can only
wake him when three of them have problems. When three elves are
having their problems solved, any other elves wishing to visit Santa
must wait for those elves to return. If Santa wakes up to find three
elves waiting at his shop’s door, along with the last reindeer having
come back from the tropics, Santa has decided that the elves can
wait until after Christmas, because it is more important to get his
sleigh ready. (It is assumed that the reindeer do not want to leave
the tropics, and therefore they stay there until the last possible mo-
ment.) The last reindeer to arrive must get Santa while the others
wait in a warming hut before being harnessed to the sleigh.


• After the ninth reindeer arrives, Santa must invoke prepareSleigh, and
then all nine reindeer must invoke getHitched.
• After the third elf arrives, Santa must invoke helpElves. 
Concurrently, all three elves should invoke getHelp.
• All three elves must invoke getHelp before any additional 
elves enter (increment the elf counter).

Santa should run in a loop so he can help many sets of elves. 
We can assume that there are exactly 9 reindeer, but there may be any number of elves.
```

<p align="right">(<a href="#top">Voltar ao Topo</a>)</p>

<div id="usando"></div>
<!-- USAGE EXAMPLES -->

## ☕ Usando o Projeto

Para usar o projeto bastata acessar a implementação no arquivo [Python Notebook](https://github.com/souzaitor/Santa-Clauss-Problem/blob/main/Trabalho_SO_Santa_Claus_Problem.ipynb).


<p align="right">(<a href="#top">Voltar ao Topo</a>)</p>

<div id="Licença"></div>
<!-- Licença -->

## 📝 Licença

Esse projeto está sob licença. Veja o arquivo [LICENÇA](https://github.com/souzaitor/Santa-Clauss-Problem/blob/main/LICENSE) para mais detalhes.

<p align="right">(<a href="#top">Voltar ao Topo</a>)</p>

<div id="Autor"></div>
<!-- Autor -->

## 📧 Autor



[![author](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/souzaitor)
[![b](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/itorsouza)


<p align="right">(<a href="#top">Voltar ao Topo</a>)</p>

<div id="Referências"></div>
<!-- Referências -->

## 📝 Referências

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [📚 The Little Book of Semaphores](https://greenteapress.com/semaphores/LittleBookOfSemaphores.pdf)

<p align="right">(<a href="#top">Voltar ao Topo</a>)</p>


