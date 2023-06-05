;-------------------------------------------------------------------------------
; THIS PROGRAM IS PROVIDED UNDER THE TERMS OF ACCOMPANYING ECLIPSE
; PUBLIC LICENSE ("LICENSE"). ANY USE, REPRODUCTION OR DISTRIBUTION
; OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS AGREEMENT.
;-------------------------------------------------------------------------------

        section .text
        global  stpncpy:function

;-------------------------------------------------------------------------------
; Function: stpncpy
; Purpose:  Copies a string up to a given length and returns pointer to its end
; Inputs:
;   - address s1: points to the destination
;   - address s2: points to the source
;   - uint    n:  maximal number of characters to copy
; Output:   Address of the nul character in the destination string
;-------------------------------------------------------------------------------

stpncpy:
        mov     rax, rdi        ; move destination base to rax
        add     rax, rdx        ; calculate top of the destination
        dec     rax             ; obtain last accessible byte

    ; start copying loop
    cpylop:
        mov     bl, byte [rsi]  ; take next byte
        mov     [rdi], bl       ; copy to destination

        inc     rdi             ; increment destination pointer
        inc     rsi             ; increment source pointer

        cmp     rdi, rax        ; check if last byte was reached
        jg      end             ; return if yes

        cmp     bl, 0           ; check if source ended
        je      zerolop         ; start zeroing-out remaining bytes if yes
        jmp     cpylop

    ; start zeroing-out loop
    zerolop:
        mov     [rdi], byte 0   ; zero-out current byte
        inc     rdi             ; increment destination pointer
        cmp     rdi, rax        ; check if last byte was reached
        jle     zerolop

    ; return precalculated value in rax
    end:
        ret
