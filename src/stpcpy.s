        section .text
        global  stpcpy

;-------------------------------------------------------------------------------
; Function: stpcpy
; Purpose:  Copies a string and returns pointer to its end
; Inputs:
;   - address s1: points to the destination
;   - address s2: points to the source
; Output:   Address of the nul character in the destination string
;-------------------------------------------------------------------------------

stpcpy:
    ; begin loop
    lop:
        mov     al, byte [rsi]  ; move current character from source
        mov     [rdi], al       ; copy moved character to destination

        inc     rdi             ; offset destination by a byte
        inc     rsi             ; offset source by a byte

        cmp     al, 0           ; check if last copied character was nul
        jne     lop             ; continue iff it was not

    ; end loop
    end:
        mov     rax, rdi
        ret
