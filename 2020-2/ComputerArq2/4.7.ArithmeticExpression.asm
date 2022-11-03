TITLE Arithmetic Expression

;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
; 
; Capítulo 4 Exercício 7
; Descrição: Escreva um programa que implemente a seguinte expressão aritmética:
; EAX = −val2 + 7 - val3 + val1
;--------------------

INCLUDE Irvine32.inc

.data
val1 SDWORD   8
val2 SDWORD -15
val3 SDWORD  20

.code
main PROC
 
	mov eax, val2
	neg eax
	add eax,    7
	sub eax, val3
	add eax, val1
call DumpRegs 		

	exit
main ENDP