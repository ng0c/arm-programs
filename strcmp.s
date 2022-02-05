	.section	.text
	.align		2
	.global		_start

_start:

	ldr	r0, =string1
	ldr	r1, =string2

	bl	_strcmp @ store lr next instruction because of bl
	_end:
	swi	0x11

_strcmp:
	@mov	r8, lr		@ store return address
	eor	r7,r7,r7	@ counter
	eor	r5,r5,r5
	eor	r4,r4,r4
	eor	r6,r6,r6	@ flag for match
loop:
	ldrb	r2, [r0, r7]	@ str 1
	cmp	r2, #0				@ is this the end of str1? = '\0'
	bleq	done1 			@ branch and link if equal. Storing the next instruction in lr
	ldrb	r3, [r1, r7]	@ str 2 and increment r7, load by byte
	cmp	r3, #0				@ is this the end of str2?
	bleq	done2
	cmp	r4,r5				@ are both strings done?
	bne	done_not_same
	cmp	r4, #0				@if they both negative then r4 is negative
	bgt _end
	@movmi	pc, r8			@ if r4 is negative r5 is negative and we have finished. lr pointing to what was branch to last
							@ mi = move if negative
	cmp	r2, r3
	bne	done_not_same
	add	r7, r7, #1
	b	loop
	
done1:
	mov	r4, #-1
	bx lr 					@going to the next instruction in this case after bleq
done2:	
	mov	r5, #-1
	bx lr
done_not_same:
	mov	r6, #-1
	@mov	pc, r8 				@ end program, the address of r8
	b _end
	
.section	.data
string1:	.asciz	"bri" 	@ z - turn into string with '\0' at the end
string2:	.asciz	"bri"