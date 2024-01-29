/* Write a program to compute the factorial of a number using subroutine

R1=5=Given Number,
R2=1=Initial Factorial Value

After 1st Iteration
R2=5*1=5, 
R1=4

After 2nd Iteration
R2=5*4=20=0x14,
R1=3

After 3rd Iteration
R2=20*3=60=0x3C,
R1=2

After 4th Iteration
R2=60*2=120=0x78
R1=1

After 5th Iteration
R2=120*1=120=0x78
R1=0


Algorithm

1.Initialise required number n in R1
2.Initialise initial factorial value in R2 equal to one
3. Call subroutine to compute Factorial
Algorithm for Factorial Subroutine
4a.Compare given number with zero
If zero,copy Link Register value to Program Counter(R15)
Else
4b.Multiply given number in R1 with initial factorial value in
R2(i.e,1)
4c.Decrement R1 to get the value (n-1)
4d.Repeat steps 4a to 4c till R1 is not equal to zero
(Recursive Subroutine to be used)
5.On return from subroutine,go to end of Program */

@code: 

.data
    n: .word 5 
.text
    ldr r1,=n
    ldr r1,[r1]
    mov r2,#1
    bl factorial
end:
    swi 0x11
factorial:
    cmp r1,#0
    bxeq r14
    mul r3,r2,r1
    mov r2,r3
    sub r1,r1,#1
    b factorial