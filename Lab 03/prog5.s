/* Write a program to search for an element in an array using Linear search technique */
@code:

.data 
    a: .word 5,10,15,20,25,30,35,40,45,50
    key: .word 12
.text
    ldr r0,=a
    ldr r1,=key
    ldr r1,[r1]
    mov r2,#0
    mov r3,#10
loop:
    ldr r4,[r0],#4
    cmp r4,r1
    beq found
    sub r3,r3,#1
    cmp r3,#0
    bne loop
    b exit
found:
    mov r2,#1
exit:
    mov r0,r2
    swi 0x11
