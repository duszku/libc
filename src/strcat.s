        section .text
        global  strcat:function

;-------------------------------------------------------------------------------
; Function: strcat
; Purpose:  Concatenates two strings
; Inputs:
;   - address s1: points to the destination
;   - address s2: points to the source
; Output:   s1
;-------------------------------------------------------------------------------

strcat:
        mov     rax, rdi

    ; end-seeking loop start
    lopseek:
        cmp     byte [rdi], 0
        je      lopcpy
        inc     rdi
        jmp     lopseek

    ; copying loop
    lopcpy:
        mov     bl, byte [rsi]
        mov     [rdi], bl

        inc     rsi
        inc     rdi

        cmp     bl, 0
        jne     lopcpy

        ret
