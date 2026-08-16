/**
 * File: start.S
 * Author: Garrison Taylor
 * Description: Entry point and interrupt vector
 *
 * Copyright (c) Garrison Taylor
 **/

.globl _start
.section .text.kernel

_start:
        li a7, 0x4442434e // DBCN extension
        li a6, 0x0 // debug_console_write()
        
        la a2, msg_end
        la a1, msg_start
        sub a0, a2, a1

        ecall
        nop

loop:
        j loop

.section .data.kernel

msg_start:
.asciz "Hello, World!\n"
msg_end:
