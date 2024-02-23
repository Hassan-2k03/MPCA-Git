/* Given a c Code convert it in its equivalent Arm Code.

x = (a + b) - c; */

@code: 

.data
    a: .word 5
    b: .word 6
    c: .word 7
    x: .word 0
.text
    ldr r1, =a
    ldr r1, [r1]
    ldr r2, =b
    ldr r2, [r2]
    add r3, r1, r2
    ldr r4, =c
    ldr r4, [r4]
    sub r0, r3, r4
    ldr r5, =x
    str r0, [r5]
    swi 0x11
