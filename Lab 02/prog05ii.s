/* Generate Fibonacci Series and store them in an array / memory location.*/

@ code:

.data
    fibonacci: .word 0,0,0,0,0,0,0,0,0,0
.text
    ldr r0,=fibonacci
    mov r1,#0
    mov r2,#1
    mov r3,#10
    str r1,[r0],#4
    str r2,[r0],#4
    mov r4,#2
loop:
    add r5,r1,r2
    str r5,[r0],#4
    mov r1,r2
    mov r2,r5
    add r4,r4,#1
    cmp r4,r3
    blt loop
    mov r0,#0
    swi 0