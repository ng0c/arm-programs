.section	.data
x:	.word   8
y:	.word   4

.section	.text
.align	2
.global	_start

_start:
	ldr r0,=x
	ldr r0, [r0]
	ldr r1,=y
	ldr r1, [r1]

_subtract:
	cmp r0, r1
	blt _store
	sub r0, r0, r1
	add r3, r3, #1
	b _subtract

_store:
	mov r2, r3
	b _end

_end: b _end



@r0, x
@r1, y
@r2, result
@r3, count
