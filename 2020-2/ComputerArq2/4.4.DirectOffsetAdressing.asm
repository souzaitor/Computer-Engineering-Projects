TITLE Direct-Offset Addressing

;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
;
; Capítulo 4 Exercício 4
; Descrição: Proma que usa instruções de endereçamento de offset direto 
; para mover os quatro valores em Uarray para o registradores EAX, EBX, ECX e EDX
;--------------------

INCLUDE Irvine32.inc

.data
Uarray WORD 1000h, 2000h, 3000h, 4000h
Sarray SWORD -1,-2,-3,-4

.code
main PROC

	movzx EAX, Uarray
	movzx EBX, [Uarray + TYPE Uarray]
	movzx ECX, [Uarray + 2 * TYPE Uarray]
	movzx EDX, [Uarray + 3 * TYPE Uarray]
	call DumpRegs 		
	
	
	movsx EAX, Sarray
	movsx EBX, [Sarray + TYPE Sarray]
	movsx ECX, [Sarray + 2 * TYPE Sarray]
	movsx EDX, [Sarray + 3 * TYPE Sarray]
	call DumpRegs 		

	exit

main ENDP
END main