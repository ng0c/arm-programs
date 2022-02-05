@r0, counter (length of array)
@r2, address
@r3, current index
@r4, next index
@r5, max number
@.word, specifies the size which is 4 bytes

.section .data
	.align 2 					@ align memory address to multiples of 2 (8bits)
	data: .word 3, 4, 9, 2, 10 

.section	.text
.align		2
.global		_start

_start:
	mov r0, #4

_main:
	ldr r2, =data 				@ storing address of 3
	ldr r3, [r2] 				@ storing the value 3
	add r2, r2, r0 				@ pointing at 4 i.e. the next index
	ldr r4, [r2] 				@ loads in the value 4
	cmp r4, r5 					@ comparing 4 with 3
	movcs r5, r4 				@ if array value is larger -> set that value to be max
	cmp r0, #16 				@ to not step outside of the array
	beq _end
	add r0, #4 					@ increment index counter
	b _main

_end: b _end