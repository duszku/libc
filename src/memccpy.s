        section .text
        global  memccpy:function

;-------------------------------------------------------------------------------
; Function: memccpy
; Purpose:  Copies bytes of memory, stops at given value or after some #copies
; Inputs:
;   - address s1: points to the destination
;   - address s2: points to the source
;   - uchar   c:  when c is met, copying stops
;   - uint    n:  even if c does not occur, at most n copies will take place
; Output:   Pointer to copy of c in s1 or null if no c occurs in s1
;-------------------------------------------------------------------------------

memccpy:
        mov     rbx, rdi        ; store destination base pointer in rbx
        add     rbx, rcx        ; calculate address of the last accessible byte 

    ; copying loop
    lopcpy:
        mov     al, byte [rsi]  ; move offsetted byte to al
        cmp     al, dl          ; check if its not equal to c
        je      endc            ; end if it is

        mov     [rdi], al       ; copy moved byte
        inc     rdi             ; increment destination offset
        inc     rsi             ; increment source offset

        cmp     rdi, rbx        ; check if final byte was reached
        jl      lopcpy          ; continue if not

    ; cause of end: reached final byte
    endn:
        mov     rax, 0          ; return NULL
        ret

    ; cause of end: found character c
    endc:
        mov     rax, rbx
        sub     rax, 1
        ret
