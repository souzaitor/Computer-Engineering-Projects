TITLE Overflow Flag

;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
;
; Capítulo 4 Exercício 3
; Descrição: Programa que usa adição e subtração para setar e limpar a flags Overflow.
;--------------------

INCLUDE Irvine32.inc

.code
main PROC

	mov eax, 1
	sub eax, 1
	call DumpRegs 		
	
	mov eax, 4
	sub eax, 8
	call DumpRegs 		
	exit

main ENDP
END main