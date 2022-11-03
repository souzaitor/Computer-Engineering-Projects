TITLE Fibonacci Numbers

;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
;
; Capítulo 4 Exercício 6
; Descrição: Programa que use um loop para calcular os primeiros sete valores da sequência de números de Fibonacci,
; descrito pela seguinte fórmula: Fib (1) = 1, Fib (2) = 1, Fib (n) = Fib (n - 1) + Fib (n - 2)
;--------------------

INCLUDE Irvine32.inc

.data
PRIMEIRO DWORD ?
SEGUNDO DWORD ?
RESULTADO DWORD ?

.code
main PROC

	mov ecx, 12
	
	mov PRIMEIRO, 0
	mov SEGUNDO, 1
	
	l1:
			mov eax, PRIMEIRO
			add eax, SEGUNDO
			call DumpRegs 		
			mov RESULTADO, eax
			mov eax, SEGUNDO
			mov PRIMEIRO, eax
			mov eax, RESULTADO
			mov SEGUNDO, eax
	loop l1
		
	exit
main ENDP
END main