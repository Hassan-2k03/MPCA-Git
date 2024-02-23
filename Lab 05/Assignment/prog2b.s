/* Given a c Code convert it in its equivalent Arm Code.

z = (a << 2) |(b & 15); */

@code: 

.data
    a: .word 0x12345678
    b: .word 0x9abcdef0
    z: .word 0x0
.text
    ldr r0, =a
    ldr r1, =b
    ldr r2, =z
    ldr r3, [r0]
    ldr r4, [r1]
    mov r3, r3, lsl #2
    and r4, r4, #15
    orr r3, r3, r4
    str r3, [r2]
    swi 0x11
