/* Write an ALP to implement Sum[i]+=a[i][j]  */

@code:

.data
    a: .word 1,2,3,4,5,6,7,8,9
.text
    ldr r0,=a   ;r0=address of A
    mov r1,#0   ;r1=initial value of sum
    mov r2,#3   ;r2=max no of rows
    mov r3,#3   ;r3=max no of columns
    mov r4,#0   ;r4=initial value of i
    mov r5,#0   ;r5=initial value of j
loop1: 
    cmp r4,r2   ;compare i with max no of rows
    bge end
loop2:
    cmp r5,r3   ;compare j with max no of columns
    bge increment_i
    ldr r6, [r0], #4   ;load a[i][j] into r6
    add r1,r1,r6   ;sum+=a[i][j]
    add r5,r5,#1   ;increment j
    b loop2
increment_i:
    add r4,r4,#1   ;increment i
    mov r5,#0      ;reset j
    b loop1
end:
    mov r7, #1     ;system call number (sys_exit)
    swi 0          ;terminate the program