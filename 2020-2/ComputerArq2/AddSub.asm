;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
;
; Descrição: Este programa adiciona e subtrai inteiros de 32 bits.
;--------------------

INCLUDE Irvine32.inc

.code
main PROC

	mov	eax, 10000h		; EAX = 10000h
	add	eax, 40000h		; EAX = 50000h
	sub	eax, 20000h		; EAX = 30000h
	call	DumpRegs

	exit
main ENDP
END main