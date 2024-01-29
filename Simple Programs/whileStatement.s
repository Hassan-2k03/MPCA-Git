/* Convert the following C code to ALP using ARM7TDMI – ISA, code snippet
C statement:       
while( save[i] == k)
    i+=1; */

@code:

.data 
    k: .word 5
    i: .word 0
    save: .word 5, 5, 5, 50, 35, 40 
.text
    ldr r1, = k ; addres of k 
    ldr r0, [r1] ; value of k
    ldr r2, =save ; address of save
    mov r3, #0 ; i = 0
loop:
    ldr r4, [r2, r3, lsl #2] ; save[i]
    cmp r4, r0 ; save[i] == k
    bne exit ; if not equal exit
    add r3, r3, #1 ; i += 1
    b loop ; loop
exit:
    swi 0x11 ; exit