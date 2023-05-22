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
        mov     rbx, rdi            ; save base of destination
        add     rbx, rdx            ; find pointer to last character to touch

    ; start copying loop
    lopcpy:
        mov     al, byte [rsi]      ; move offsetted byte from source to al
        mov     [rdi], al           ; copy moved byte to destination
        inc     rsi                 ; increment source offset
        inc     rdi                 ; increment destination

        cmp     al, 0               ; check if last copied character was nul
        je      lopzero             ; jump to zeroing-out if it was

        cmp     rdi, rbx            ; check if n characters were copied
        jg      end                 ; break loop if yes
        jmp     lopcpy

    ; start zeroing-out loop
    lopzero:
        mov     [rdi], byte 0       ; zero-out current byte
        inc     rdi                 ; move one byte forwards
        cmp     rdi, rbx            ; check if n characters were copied
        jle     lopzero

    end:
        mov     rax, rdi            ; move destination base to return register
        dec     rax                 ; offset was 1 too far - compensate for it
        ret
