.section .data
x: .word 3
y: .word 9 
 

.section .text
.align 2
.global _start

_start:
	mov r3, #32

 

_loop: 
	sub r3, r3, #1
	cmp r3, #0 
	beq _end 
	ldr r0, =y
	ldr r0, [r0]
	eor r1, r1, r1 @ set Q to zero 
	ldr r2, =x
	ldr r2, [r2] 
	sub r0, r0, r2 

	cmp r0, #0
	bge _shift
	add r0, r0, r2 
	lsl r0, #1 
	lsr r2, #1 
	b _loop 


_shift: 
	lsl r1, #1 
	add r1, r1, #1
	lsr r2, #1
	b _loop 


_end: b _end
 


@ R stores the remainder, r0
@ Q stores the quoteint, r1 
@ X stores the dividend, r2 