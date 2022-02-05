@ r0 - counter
@ r1 - pointer
@ r2 - first index
@ r3 - next index
@ r4 - running sum
@ r5 - result

.section .data
    .align 2
	data: .word 2, 3, 7

.section    .text
.align  2
.global _start

_start:
    mov r0, #4
    ldr r1, =data   @ storing the address
    ldr r2, [r1]    @ loading the first index
    mov r4, r2

_main:
    ldr r1, =data   @ storing the address
    add r1, r1, r0  @ pointing to the next index
    ldr r3, [r1]    @ loading next index
    add r4, r4, r3  @ r4 += r3
    cmp r0, #8
    beq _result
    add r0, #4
    b _main

_result:
    mov r5, r4
    add r5, #7
    b _end

_end: b _end
