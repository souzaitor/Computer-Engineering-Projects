TITLE Carry Flag

;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
;
; Capítulo 4 Exercício 1
; Descrição: Programa que usa adição e subtração para setar e limpar a flag Carry.
;--------------------

INCLUDE Irvine32.inc

.code
main PROC

	mov eax, 0
	mov al, 0FFh
	add al, 1
	call DumpRegs 		

	mov eax, 1
	sub eax, 2
	call DumpRegs 		
	
	
	add eax, 1
	call DumpRegs 		

	exit
main ENDP
END main