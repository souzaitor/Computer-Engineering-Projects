;--------------------
; Autor: Heitor Souza
; Data: 06/07/2021
;
; Descrição: Implementa o cálculo do MDC (máximo divisor comum) entre os números  x e y. 
; O programa também testa chamanda a função 3 vezes, 
; com valores diferentes para x e y. Os resultados são exibidos na tela
;--------------------

Include Irvine32.inc
 
.data
    str1 BYTE "X = 15 e Y = -9", 0
    str2 BYTE "X = 16 e Y = 8", 0
    str3 BYTE "X = 100 e Y = 200", 0
    str4 BYTE "Maximo Divisor Comum eh: ", 0

    x DWORD ?
    y DWORD ?
    resto DWORD ?

.code
main PROC
    
    call teste

exit
main ENDP
 

MDC PROC

L1: mov eax, x; 
    cmp eax, 0;
    jg ENDL1;
    neg eax;
    mov x, eax;

ENDL1:

L2: mov eax, y;
    cmp eax, 0;
    jg ENDL2;
    neg eax;    
    mov y, eax;

ENDL2:

L3:
    mov eax, x;   
    mov ebx, y;   
    sub edx, edx; 
    idiv ebx; 
    mov resto, edx;
    mov ebx, y;
    xchg ebx, x;  
    mov ebx, resto;
    xchg ebx, y;  
    mov ebx, y;
    cmp y, 0;
    jg L3;    // while (y > 0)
    
ENDL3:
    mov eax, x
	ret

MDC ENDP

teste proc
    

    mov x, 15
    mov y, -9
    mov  edx, OFFSET str1
    call WriteString
    mov  edx, OFFSET str4
    call Crlf
    call WriteString
    call MDC
    call WriteDec

    mov x, 16
    mov y, 8
    mov  edx, OFFSET str2
    call Crlf
    call WriteString
    mov  edx, OFFSET str4
    call Crlf
    call WriteString
    call MDC
    call WriteDec

    mov x, 100
    mov y, 200
    mov  edx, OFFSET str3
    call Crlf
    call WriteString
    mov  edx, OFFSET str4
    call Crlf
    call WriteString
    call MDC
    call WriteDec

    call Crlf

    ret

teste ENDP
       
END main