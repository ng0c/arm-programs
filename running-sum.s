@@@@@ Running sum of 1d array @@@@@
@ Given an array nums. 
@ We define a running sum of an array as runningSum[i] = sum(nums[0]...nums[i]).
@ Return the running sum of nums.

@ r2 - counter
@ r3 - pointer
@ r4 - first index
@ r5 - next index
@ r6 - running sum
@ r7 - result

.section .data
    .align 2
	nums: .word 3, 1, 2, 10, 1

.section    .text
.align  2
.global _start

_start:
    mov r2, #4
    ldr r3, =nums   @ storing the address of array
    ldr r4, [r3]    @ loading the first index
    mov r6, r4      @ storing value at the first index to r6

_main:
    ldr r3, =nums   @ storing the address of the array again
    add r3, r3, r2  @ pointing to the next index
    ldr r5, [r3]    @ loading next index
    add r6, r6, r5  @ r6 += r5
    cmp r2, #16     @ check if we are at the end of the array
    beq _result     @ if true, branch to _result and store the sum
    add r2, #4      @ else: add #4 to pointer to point to the next index
    b _main         

_result:
    mov r7, r6
    b _end

_end: b _end
