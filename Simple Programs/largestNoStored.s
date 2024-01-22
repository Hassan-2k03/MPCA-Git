/* find the largest 32 bit element stored in an array A.*/
@ code: 

.data
    A: .word 10,20,30,40,50
.text
    ldr r1,=A
    ldr r0,[r1] ; initially set first element as the largest element (stored in register r0).
    mov r3,#0 ; count register
loop: ldr r2,[r1,#4]! ; load the next element
    cmp r0,r2 ; compare
    blt less ; if the previous element is less than next element then store the largest element in register r0.
l1: add r3,r3,#1
    cmp r3,#4
    bne loop
    b exit
less: mov r0,r2
    b l1    
exit: swi 0x011