/* Write a program to find the sum of N data items at alternate [odd or even positions] locations in the memory. Store the result 
in the memory location.  */

@code: 

.data
    array: .word 1,2,3,4,5,6,7,8,9,10
    sum: .word 0
.text
    ldr r0,=array
    mov r1,#0
    mov r2,#10
loop:
    ldr r3,[r0],#8
    add r1,r1,r3
    subs r2,r2,#2
    bne loop
    str r1,[r0]
    ldr r0,=sum
    ldr r0,[r0]
    swi 0x11