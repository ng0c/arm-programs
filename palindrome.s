.section    .data
    digit:  .word 2,3,4,2
    length: .word 4

.section    .text
.align      2
.global     _start

_start:
  ldr r1, =digit                @r1 = arr adrs
  ldr r2, =length               @r2 = length adrs
  ldr r3, [r2]                  @r3 = length
  eor r0, r0, r0                @index
  mov r9, r3

_main:
  cmp r0, r3
  beq _end
  sub r9, r3, r0                @move along
  sub r9, r9, #1                @get the last digit index
  ldr r4, [r1, r9, lsl #2]      @last
  ldr r6, [r1, r0, lsl #2]      @first
  cmp r6, r4
  moveq r10, #1
  movne r10, #0
  cmp r10, #1
  bne _end
  add r0, r0, #1                @i++
  beq _main

_end: b _end