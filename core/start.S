/**
 * File: start.S
 * Author: Garrison Taylor
 * Description: Entry point and interrupt vector
 *
 * Copyright (c) Garrison Taylor
 **/

        .globl _start
        .section .text

_start:
        li a7, 0x4442434e
        li a6, 0x0
        li a0, 12
        lla a1, msg_start
        li a2, 0

        ecall

        call main

halt:
        j halt

        .section .data

msg_start:
        .asciz "\n[ OK ] Reached kernel start\n"
