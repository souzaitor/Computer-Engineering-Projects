TITLE Reverse Array

;--------------------
; Autor: Heitor Souza
; Data: 15/07/2021
;
; Capítulo 4 Exercício 5
; Descrição: Este programa inverte um vetor sem usar outra outro array para tal.
;--------------------

INCLUDE Irvine32.inc

.data
    array1 DWORD 10d,20d,30d,40d,50d,60d,70d,80d,90d
.code
main PROC
        mov ESI, OFFSET array1  ;ESI now points to the first item of array1
        mov EDI, SIZEOF array1
        add EDI, OFFSET array1
        sub EDI, TYPE array1    ;EDI now points to the last item of array1

        mov ECX, LENGTHOF array1
        shr ECX, 1          ;now ecx is half the length of the array1
L1:     mov EAX, [ESI]          ;in this loop we reverse the items of the array
        mov EBX, [EDI]
        mov [EDI],EAX
        mov [ESI],EBX
        add ESI, TYPE array1
        sub EDI, TYPE array1
        LOOP L1

        mov ECX, LENGTHOF array1;here we just print the array
        mov ESI, OFFSET array1
L2:     MOV EAX, [ESI]
        call WriteInt
        call Crlf
        add ESI, TYPE array1
        LOOP L2
        exit        
main ENDP
END main