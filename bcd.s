.section	.data
		x:	.word 0, 0, 0, 0, 9, 9, 0, 1
		y:	.word 0, 0, 0, 0, 0, 1, 0, 5
		z:	.word 0, 0, 0, 0, 0, 0, 0, 0

.section	.text
.align		2
.global		_start

_start:
	mov r0, #28 	@ 4*7, starts at 0
	ldr r1, =x
	ldr r2, =y
	ldr r3, =z
	mov r4, #0
	mov r7, #0

_check:
	cmp r0, #0
	beq _end
	b _loop

_loop:
	ldr r5, [r1, r0] @r5 = r1 +	address shifted by r0(28) to get to the end of array
	ldr r6, [r2, r0] @similar
	add r4, r5, r6
	add r4, r4, r7
	cmp r4, #10
	bge _carry
	b _store

_carry:
	movcs r7, #1 	  @cs - only work if carry flag is set, then r7=1
	subcs r4, r4, #10 @similar, if c==1 then r4 = r4-10
	b _store

_store:
	str r4, [r3, r0] @store r4 into r3 + r0(28) - end of array
	sub r0, r0, #4
	b _check


_end: b _end

@ r0, counter
@ r1 is x
@ r2 is y
@ r3 is z=final array
@ r4, sum

