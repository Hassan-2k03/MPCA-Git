/* Write an ALP to check whether the given number has odd or even number of 1’s (Even Parity and Odd Parity).

RESULT 1

R0=0x00F0

00000000 00000000
00001111 00000000

Number of Ones =4

Number of zeroes=28

Even Parity

RESULT 2
R0=0x00F4

00000000 00000000
00001111 00000100

Number of Ones =5
Number of zeroes=28

Odd Parity 

Algorithm

Let R0 contain the required number
Initialise R1=Number of bits in Given Number
Initialise R2 to count number of ones,initial value zero
Initialise R3 to count number of zeroes, ,initial value zero
AND number in R0 with 1
Check if current LSB bit of R3 is 1
If bit is one,increment ones counter R2
If bit is zero,increment zeroes counter R3
Shift the contents of register R0 one bit to the right
Decrement count in R1(Number of bits in given number)
Repeat steps 5 to 10 till all 32 bits are checked
AND value in register R2 with 1.If result after AND is zero,it indicates even parity.Else if result after AND is 1,it indicates odd parity
End program */

@code: 

.text
    mov r0,#0x00F0  
    mov r1,#32
    mov r2,#0   
    mov r3,#0   
loop:
    and r4,r0,#1 
    cmp r4,#1   
    beq one     
    bne zero    
one:
    add r2,r2,#1
    b shift
zero:
    add r3,r3,#1
shift:
    mov r0,r0,lsr #1
    sub r1,r1,#1
    cmp r1,#0
    bne loop
    and r5,r2,#1
    cmp r5,#0
    beq even
    bne odd
even:
    mov r0,#0x00F0
    mov r1,#0x0000
    swi 0x11
odd:
    mov r0,#0x00F4
    mov r1,#0x0000
    swi 0x11