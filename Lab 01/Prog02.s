/* Check if a given number is even or odd.
Note: at the end of the program execution R2 contains 0 if number is even, otherwise R2 contains 1.

Algorithm
1.The  number is to be stored in R0
2. AND operation between the given number and constant 1,result of AND operation is stored in R1
(Use instruction ANDS to ensure flags are updated)
4. If the LSB bit of R1 after the AND operation is zero,it indicates even number
If true,Branch to label Location 1,copy 00 into R2 register
Else
5. If the LSB bit of R2 after the AND operation is one,it indicates odd number
If true,Branch to label Location 2,copy 1 into R2 register

CASE 1:
R0 0x06
R1 After AND operation 0x00 
R2 (EVEN) 0

CASE 2:
R0 0x05
R1 After AND operation 0x01
R2 (ODD) 1
 */

@code:

.data 
    A: .word 0x06

.text
    LDR R0,=A
    LDR R0,[R0]
    ANDS R1,R0,#1
    BEQ Location1
    B Location2
Location1:
    MOV R2,#0
    B end
Location2:
    MOV R2,#1
end
 SWI 0x11
.end