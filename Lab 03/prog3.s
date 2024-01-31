/* Write an ALP to find the sum of all the digits of a given 32 bit number.*/
@code: 

.data
    n: .word 0x12345678
    sum: .word 0
.text
    ldr r0, =n
    ldr r1, [r0]
    ldr r0, =sum
    mov r2, #0
loop:
    mov r3, r1
    and r3 ,r3, #0xf
    add r2, r2, r3
    mov r1, r1, lsr #4
    cmp r1, #0
    bne loop
    str r2, [r0]
    swi 0x11