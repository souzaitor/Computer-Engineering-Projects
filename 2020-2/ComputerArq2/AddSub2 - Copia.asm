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
B1 BYTE  250 
B2 BYTE -120 
B3 BYTE -130 ; Impossível representar, 127 é o máximo 
BList1 BYTE 0, 10, 20, 30, 40, 50, 60, 70, 80, 90 
BList2 BYTE 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
BList3 20 DUP(0) 
BString BYTE "Programa Teste", 0Dh, 0Ah 
W1 WORD 3500 
WList1 WORD 0, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000 
WList2 10 DUP(?)

.code
main PROC
	mov esi, OFFSET B1 
	mov ecx, 1
	mov ebx, BYTE 
call DupMem

	mov esi, OFFSET B2 
	mov ecx, 1
	mov ebx, BYTE 
call DupMem

	mov esi, OFFSET B3 
	mov ecx, 1
	mov ebx, BYTE 
call DupMem

	mov esi, OFFSET BList1
	mov ecx, 10
	mov ebx, BYTE 
call DupMem

	mov esi, OFFSET BList2
	mov ecx, 10
	mov ebx, BYTE 
call DupMem

	mov esi, OFFSET BList3
	mov ecx, 10
	mov ebx, BYTE 
call DupMem

	mov esi, OFFSET BString
	mov ecx, 16
	mov ebx, BYTE 
call DupMem

	mov esi, OFFSET W1 
	mov ecx, 1
	mov ebx, WORD 
call DupMem

	mov esi, OFFSET WList1
	mov ecx, 10
	mov ebx, WORD 
call DupMem

	mov esi, OFFSET WList2
	mov ecx, 10
	mov ebx, WORD 
call DupMem
	
	exit
main ENDP
END main