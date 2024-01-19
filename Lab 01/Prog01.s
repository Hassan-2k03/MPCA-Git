/* Write an ALP to add if the numbers are equal, otherwise subtract them.

Algorithm
1.The first number is to be saved in R0
2.The second number is to be saved in R1
3.Compare the two numbers 
4.If they are equal,branch to location L1 where both numbers are  added.
5.Save the addition result in R2 and end execution                                                                                           
6.If the numbers are not equal subtract the two numbers.
7.Save  subtraction result in R2 and end execution.

CASE 1
R1=0x05, R0=0x05
R2=R1+R0=0x0A
 
CASE 2
R1=0x06,R0=0x05
R2=R1-R0=0x01 */

@ Code arm assembly

.data
    A: .word 0x05
    B: .word 0x05
    C: .word 0x00
.text
    LDR R0, =A
    LDR R1, =B
    LDR R2, =C
    LDR R0, [R0]
    LDR R1, [R1]
    CMP R0, R1
    BEQ L1
    SUB R2, R0, R1
    B END
L1: ADD R2, R0, R1
END: STR R2, [R2]
SWI 0x11