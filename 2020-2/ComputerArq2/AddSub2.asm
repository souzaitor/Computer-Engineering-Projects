;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
;
; Descrição: Este programa adiciona e subtrai inteiros de 32 bits.
; Reimplementa o programa AddSub (32 bits), porém alocando e utilizando variáveis ao invés 
; de valores literais nas operações aritmeticas
;--------------------

INCLUDE Irvine32.inc

.data
val1		DWORD 10000h
val2		DWORD 40000h
val3		DWORD 20000h
valFinal 	DWORD ?

.code
main PROC
	mov eax,val1		; Adiciona o valor 1 em eax
	add eax,val2		; Soma o segundo valor a eax
	sub eax,val3		; Subtrai o terceiro valor
	mov valFinal, eax	; Resultado final
	call DumpRegs		; Exiber os resultados
	
	exit
main ENDP
END main