/* Write an ALP to implement Sum[i]+=a[i][j] 

Algorithm
Declare the array A  in .data segment
Let R0 contain address of A
Let R1=0=initial value of sum
Let R2 contain max number of rows in the matrix,assume=3.
Let R3 contain max number of columns in the matrix,assume=3.
Let R4 contain initial value of i=0
Let R5 contain initial value of j=0

Algorithm for Subroutine for_i and for_j
8.Save the current values of i and j on stack(Use R13 register)
9.Branch to subroutine that calculates address of current element of matrix get_addr(step 10)

Algorithm for Subroutine get_addr
10.Pop the values of i and j from stack back to registers R4 and R5
11.Multiply no of columns in r3 with i value(in R4) add with j value( in R5)
Store the result in R7
12.Multiply this result in R7 wih 4 to get address of next element.
Save multiplication result in R6
13.Save the values of i ,j and address (in R6) to stack
14.Return to subroutine for_i  for_j(Step 15)


15.Retrieve the values of i,j and address from stack to registers r4,r5 and r6
16.Calculate address of a[i][j] (Add R0 with R6 store result in R6)
17.Copy the value from address a[i][j] to register R9
18.Add this value in R9 to the value of sum in R1
19.Increment j value in R5 by 1
20.Compare this with value max no of columns in R3
21.Repeat steps 8 to 20 until j becomes equal to max no of columns
22.Reset j value back to 0 to move to second row,first column of the matrix
23.Increment i value (in R4 ) by 1
24.Compare i value with max no of rows value in R2
25.If i has reached max no of rows,go to end of program
Else Repeat steps 8 to 24 
26.End of Program   */

@code:

.data 
    a: .word 1,2,3,4,5,6,7,8,9
.text
.global main
main:
    ldr r0, =a   ; address of matrix a
    mov r1, #0   ; initial value of sum
    mov r2, #3   ; max number of rows in the matrix
    mov r3, #3   ; max number of columns in the matrix
    mov r4, #0   ; initial value of i
    mov r5, #0   ; initial value of j

for_i:
    push {r4, r5} ; save the current values of i and j on stack
    bl get_addr   ; branch to subroutine that calculates address of current element of matrix

get_addr:
    pop {r4, r5}  ; pop the values of i and j from stack back to registers R4 and R5
    mul r7, r4, r3 ; multiply no of columns in r3 with i value(in R4)
    add r7, r7, r5 ; add with j value( in R5)
    lsl r6, r7, #2 ; multiply this result in R7 with 4 to get address of next element
    push {r4, r5, r6} ; save the values of i ,j and address (in R6) to stack
    bx lr           ; return to subroutine for_i

for_j:
    pop {r4, r5, r6} ; retrieve the values of i,j and address from stack to registers r4,r5 and r6
    add r6, r0, r6   ; calculate address of a[i][j]
    ldr r9, [r6]     ; copy the value from address a[i][j] to register R9
    add r1, r1, r9   ; add this value in R9 to the value of sum in R1
    add r5, r5, #1   ; increment j value in R5 by 1
    cmp r5, r3       ; compare this with value max no of columns in R3
    blt for_j        ; repeat steps until j becomes equal to max no of columns
    mov r5, #0       ; reset j value back to 0 to move to second row,first column of the matrix
    add r4, r4, #1   ; increment i value (in R4 ) by 1
    cmp r4, r2       ; compare i value with max no of rows value in R2
    blt for_i        ; if i has not reached max no of rows, repeat steps
    swi 0x11         ; end of program