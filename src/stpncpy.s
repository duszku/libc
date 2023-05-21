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
        ret
