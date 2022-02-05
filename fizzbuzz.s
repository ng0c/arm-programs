@ r0 - loop counter
@ r1 - copy of counter
@ r2 - result

.section .data
    .align 2

.section	.text
    .align		2
	.global		_start

_start:
    eor r0, r0, r0      @ zero out register

_loop:
    cmp r0, #20         @ check if r0 > 10
    bgt _end            @ end program if r0 > 10
    mov r1, r0          @ copy of loop counter
    bl _compare         @ brach to _compare
    add r0, #1          @ increment loop counter
    b _loop             @ next iteration
    
_compare:
    tst r1, #7          @ check if counter value is divisible by 8
    bne _return         @ if not divisible continue loop
    b _result           @ store result if true

_return:
    bx lr

_result:
    mov r2, r1          @ store result in r2
    bx lr               @ branch back to loop (bl _compare)

_end: b _end



