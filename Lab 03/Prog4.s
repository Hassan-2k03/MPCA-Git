/* Write a program to perform 3X3 matrix addition. (Write an ALP to implement C[i][j]=a[i][j]+b[i][j]) */

@ code: 

.data 
    a: .word 10,20,30,40,50,60,70,80,90
    b: .word 1,2,3,4,5,6,7,8,9
    res: .word 0,0,0,0,0,0,0,0,0
.text
    ldr r0,=a
    ldr r1,=b
    ldr r2,=res
    mov r3,#9
loop:
    ldr r4,[r0],#4
    ldr r5,[r1],#4
    add r6,r4,r5
    str r6,[r2],#4
    subs r3,r3,#1
    bne loop    
    swi 0x11