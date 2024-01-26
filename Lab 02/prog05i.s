/* Write a program to add array of ten 8-bit numbers taking data from memory location stored as byte data (use .byte to store the data 
instead of .word) */

@code 

.data
    array: .byte 1,2,3,4,5,6,7,8,9,10
    sum: .byte 0

.text
    ldr r0,=array
    mov r1,#0
    mov r2,#10
loop:
    ldrb r3,[r0],#1
    add r1,r1,r3
    subs r2,r2,#1
    bne loop
    strb r1,[r0]
    ldr r0,=sum
    ldrb r0,[r0]
.end