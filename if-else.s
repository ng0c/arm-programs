@ r1 = x
@ r2 = y

.section	.data

.section	.text
.align	2
.global _start

_start:
    @ if x == 0
    cmp r1, #0
    addeq r1, r1, #5

    @ if x >= 5
    cmp r1, #5
    movge r1, #0

    mov r1, #10
    mov r2, #5
    b _func1

_func1:
    cmp r1, #0
    blt _func2    
    mul r2, r2, r1
    sub r1, r1, #1
    b _func1

_func2:
    cmp r1, #9 @ func2
    addlt r1, r1, #1
    mov r1, #0
    b _end

_end: b _end
