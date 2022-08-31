<h1 align="center"> Prolog Backward Chaining </h1>
<h3 align="center"> Project Assignment 1</h3>
<h3 align="center"> 1001336 - Artificial intelligence (2020/2)</h3>
<h4 align="center"> <a href="https://site.dc.ufscar.br/"> DC - Department of Computing</a>  </h4>
<h4 align="center"> <a href="https://www.ufscar.br/">UFSCar - Universidade Federal de São Carlos</a>  </h4>


## 🔵 Introduction
Implementation project ofa logic-based system proposed during the course of the Artificial Intelligence (1001336), offered by the Department of Computing at UFSCar in the 2020/2 semester.

## 🔵 Goals 

The aim of the work is to use the Prolog language to implement a logic-based system that can recommend a category of investment portfolio to potential investors, using the backward chaining algorithm with depth-first search. The recommendation is based on the investor profile, value to be
invested, financial situation, period in which the money is invested and knowledge of the financial market. The investor profile, in turn, is inferred based on the investment objective and risk tolerance. The financial situation depends on the amount of annual income and whether or not the income is stable. The amount to be invested and the period of investment are inferred from ranges of values.

The variables that appear in the formulation of the problem and their respective values are:
- Investment: Categories 1 to 6
- Investor profile: conservative, moderate or aggressive.
- Amount to be invested: low, medium or high
- Investment period: short, medium or long
- Financial situation: adequate or inadequate.
- Investment objective: preserve capital, accumulate resource or speculate
- Risk tolerance: low, medium or high
- Knowledge of the financial market: little or a lot.
 
The desired period for the application is given in number of months. The amount to be invested is given in reais, as well as the annual income. The categories that can be recommended specify the types of investments and the proportion of the amount to be invested in each type. Are they:

- Category 1: Fixed income with short term
- Category 2: Fixed income with short term (50%) and fixed income with medium and long term (50%)
- Category 3: fixed income with short and long term (70%) and variable income (30%)
- Category 4: Fixed income with short and long term (50%) and variable income (50%)
- Category 5: Fixed income with short and long term (20%) and variable income (80%)
- Category 6: Fixed income with short and long term (15%), variable income (65%) and mini futures contract (20%)

Using a set of sentences from the Knowledge Base in the form of first-order defined clauses provided by the professor, the knowledge base was implemented in Prolog, including the facts that define each initial situation, which are the specific information of an investor in particular. 

## 🔵 Using the project

Run the [prolog file](https://github.com/souzaitor/EnC/blob/main/2020-2/Intelig%C3%AAncia%20Artifical/Prolog%20Backward%20Chaining/AlgoritmoEncadeamentoParaTras.pl)
.

## 🔵 Authors

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
  </tr>
</table>

## Copyright 
This project is licensed under the terms of the MIT license.

<div align="right"><a href="https://github.com/souzaitor/EnC#projects"> ⬅️ Return to projects list</a></div>
