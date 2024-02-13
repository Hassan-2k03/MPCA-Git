/* Write an ALP  to find the  length of a given string

Algorithm
1.Initialise r0 to contain the address of the string
2.Let r1=0=Initial length of the string
3.Copy each character from the string into register r2(Use LDRB instruction)
4.Check if the character in r2  is zero 
5.If valid character is found, increment r1.
6.Else end Program
7.Increment r0 to point to next character in the string
8.Repeat step 3 to 5  until end of string
9.r1  contains final length of string
10.End Program */

@code:

.data
    string: .asciz "hello"
    
.text
    ldr r0,=string
    MOV r1,#0
loop:
    LDRB r2,[r0],#1
    CMP r2,#0
    BEQ end
    ADD r1,r1,#1
    B loop
end:
    swi 0x11