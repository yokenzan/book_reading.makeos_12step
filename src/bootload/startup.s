    .h8300h
    .section .text
    .global _start
#   .type   _start,@function

_start:                     # definition of '_start' label
    mov.l   #0xffff00,sp    # setting of stack pointer
    jsr     @_main          # invoke main()


1:
    bra     1b              # endless loop

