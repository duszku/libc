;-------------------------------------------------------------------------------
; THIS PROGRAM IS PROVIDED UNDER THE TERMS OF ACCOMPANYING ECLIPSE
; PUBLIC LICENSE ("LICENSE"). ANY USE, REPRODUCTION OR DISTRIBUTION
; OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS AGREEMENT.
;-------------------------------------------------------------------------------

        section .text
        global  stpcpy:function

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

        ; end loop and return
        mov     rax, rdi
        dec     rax
        ret
