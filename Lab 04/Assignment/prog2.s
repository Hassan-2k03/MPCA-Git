/* Write a program in ARM7TDMI-ISA to generate a diagonal matrix. Note: do not read the matrix elements. */

@code: 

.data 
    matrix: .space 25 ; 5x5 matrix
.text
    mov r0, #5  ;number of rows and columns
    mov r1, #1  ;diagonal element
    ldr r2, =matrix
    mov r3, #0  ;row counter
loop1:
    mov r4, #0  ;column counter
loop2:
    str r1, [r2], #4  ;store the diagonal element
    