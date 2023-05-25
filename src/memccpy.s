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
; Output:   Address of the nul character in the destination string
;-------------------------------------------------------------------------------

memccpy:
        ret
