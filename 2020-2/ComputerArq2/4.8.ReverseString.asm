TITLE Reverse String

;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
;
; Capítulo 4 Exercício 8
; Descrição: Este programa usa a instrução LOOP com endereçamento indireto que copia uma string de
; origem para destino, invertendo a ordem dos caracteres no processo
;--------------------

INCLUDE Irvine32.inc

.data
SOURCE BYTE "This is the source string", 0
TARGET BYTE SIZEOF source DUP('#')

.code
main PROC

	mov ecx, SIZEOF SOURCE - 1
	mov esi, OFFSET SOURCE + (SIZEOF SOURCE) - 2
	mov edi, OFFSET TARGET 

	l1:
		mov  al, [esi]		
		mov  [edi], al		 
		dec  esi		
		inc  edi
	loop l1

	
	mov  esi,OFFSET target		; offset of variable
	mov  ebx,1		; byte format
	mov  ecx,SIZEOF target-1		; counter
	call DumpMem
	
	exit
main ENDP
END main