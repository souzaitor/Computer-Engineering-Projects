TITLE Zero and Sign Flags

;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
;
; Capítulo 4 Exercício 2
; Descrição: Programa que usa adição e subtração para setar e limpar as flags Zero e Sign.
;--------------------

INCLUDE Irvine32.inc

.code
main PROC

	mov eax, 0FFFFFFFFh
	inc eax
	call DumpRegs 		
	exit
	
main ENDP
END main