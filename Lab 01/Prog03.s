/* Write a program to find the factorial of a given number. (without using LDR and STR instructions).Use only registers.

Algorithm
1.The number n is to be saved in R0
2.Let R1=1
3.Multiply contents of R0 and R1 Save the result in R1
4.Subtract the contents of R0 by 1 to calculate n-1
5.Check if the content of R0 is one
6.Repeat steps 3 to 5 till R0 reaches one
9.End execution when R0=1

                                                                                                                                                                                                                                                                                                                            
1st Iteration
R0=0x05
R1=0x04
R1=0X14=Decimal 20
 
2nd Iteration
R1=0x14
R0=0X03
R1=0x3C=Decimal 60

3rd Iteration
R1=0x3C
R0=0X02
R1=0x78

4th Iteration
R1=0x78
R0=0X01
R1=0x78 =Decimal 120 */

@code: 

.data 

.text
    MOV R0,#0x05
    MOV R1,#0x01
Loop:
    MUL R1,R1,R0
    SUB R0,R0,#0x01
    CMP R0,#0x01
    BNE Loop
    SWI 0x11
    