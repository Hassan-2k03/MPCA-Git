/* Write an ALP using conditional ARM instructions to sort an array of numbers using Bubble Sort Algorithm.*/

.data
    array: .word 5,2,4,6,1,3
    size: .word   6
.text
    ldr r0, =array
    ldr r1, =size
    ldr r1, [r1]
    mov r2, #1
outer_loop:
    mov r2, #0
    sub r1, r1, #1
    ldr r3, =array
    mov r4, #0
inner_loop:
    ldr r5, [r3, r4, LSL #2]
    add r6, r4, #1
    ldr r7, [r3, r6, LSL #2]
    cmp r5, r7
    ble continue
    str r7, [r3, r4, LSL #2]
    str r5, [r3, r6, LSL #2]
    mov r2, #1
continue:
    add r4, r4, #1
    cmp r4, r1
    blt inner_loop
    cmp r2, #0
    bne outer_loop
    bx lr