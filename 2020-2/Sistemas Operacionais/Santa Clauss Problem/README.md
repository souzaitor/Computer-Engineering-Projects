<h1 align="center"> Santa Clauss Problem </h1>
<h3 align="center"> Project Assignment 1</h3>
<h3 align="center"> 1001535 - Operational Systems (2020/2)</h3>
<h4 align="center"> <a href="https://site.dc.ufscar.br/"> DC - Department of Computing</a>  </h4>
<h4 align="center"> <a href="https://www.ufscar.br/">UFSCar - Universidade Federal de São Carlos</a>  </h4>

## 🔵 Introduction

Implementation of the Santa Clauss IPC (Inter Process Communication) problem proposed during the Operating Systems course (1001535), offered by the Department of Computing at UFSCar in the semester 2020/2

## 🔵 About The Project

Implementation and studying of Santa Clauss Problem proposed by William Stallings in your book Operating Systems: Internals and Design Principles. Prentice Hall, fourth edition, 2000. The implementation is based on the proposed resolution of The Little Book of Semaphores, written by Allen B. Downey.

The literal description of the problem taken from the book:
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

## 🔵 Using the Project

Run [python notebook file](https://github.com/souzaitor/Santa-Clauss-Problem/blob/main/Trabalho_SO_Santa_Claus_Problem.ipynb).


## 🔵 License
This project is under license. Acess the file [LICENSE](https://github.com/souzaitor/Santa-Clauss-Problem/blob/main/LICENSE) for more details.


## 🔵 Author
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/souzaitor">
        <img src="https://avatars.githubusercontent.com/souzaitor" width="100px;" alt="Foto do Iuri Silva no GitHub"/><br>
        <sub>
          <b>Heitor Souza</b>
        </sub>
      </a>
    </td>
    </td>
  </tr>
</table>


## 🔵 References
* [📚 The Little Book of Semaphores](https://greenteapress.com/semaphores/LittleBookOfSemaphores.pdf)




<div align="right"><a href="https://github.com/souzaitor/EnC/blob/main/README.md#projects"> ⬅️ Return to menu</a></div>
