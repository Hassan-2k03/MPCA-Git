/* Write an ALP to multiply 2 matrices. (3X3) */

.data 
    a: .word 1,2,3,4,5,6,7,8,9
    b: .word 1,1,2,2,3,3,4,4,5
    c: .word 0,0,0,0,0,0,0,0,0
.text
    ldr r0,=a   ;matrix a
    ldr r1,=b   ;matrix b
    ldr r2,=c   ;result
    mov r7,#3   ;no of rows
    mov r9,#3   ;no of cols
loop2:
    mov r6,r0   ;cpy of r0
    mov r5,r1   ;cpy of r1
    
loop1:
    ldr r10,[r6],#4 ;load matrix a
    ldr r11,[r5],#12 ;load matrix b
    mla r8,r10,r11,r8 ;multiply and add
    subs r7,r7,#1 ;decrement rows in r4
    bne loop1
    