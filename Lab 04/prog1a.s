/* Write an ALP  to perform Convolution using MUL  instruction (Addition of multiplication of respective numbers of loc A and loc B)*/

@code:

.data
    a: .word 10, 20, 30, 40, 50 
    b: .word 10, 20, 30, 40, 50
.text
    ldr r0,=a   ;addr of matrix a
    ldr r1,=b   ;addr of matrix b
    mov r2,#5   ;array size     
    mov r5,#0   ;sum
loop:
    ldr r3,[r0],#4  ;load elements of a to r3
    ldr r4,[r1],#4  ;load elements of b to r4
    mul r6, r3, r4  ;multiply elements of a and b
    add r5, r5, r6  ;add the result to the sum
    subs r2, r2, #1 ;decrement the counter
    bne loop    ;if counter is not zero, repeat the loop
    swi 0x11    ;exit