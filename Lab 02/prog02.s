/* Write a program to Check if a given set of numbers are even or odd . Then store even and odd numbers in two different memory Locations. 

Algorithm

Declare the array A in .data segment
Initialise array ODD to store odd numbers,Initial values are 0
Initialise array EVEN to store even numbers in data segment.Initial values are 0
Initialise R0 =address of array A,R1 =address of array ODD,R2=address of array EVEN
Let R3=Count of number of elements in the array A
Copy the element of array to temporary register R4
Use AND instruction to check if the LSB bit of number in R4 is one
If R4 is equal to 1 after AND operation,it indicates odd number.Branch to location ODDNUMBER
Store the checked odd number in array named ODD
Increment register R1 to indicate next location of array ODD
Decrement R3 by 1(i.e Count for Number of elements in array A)
Repeat steps 9 to 11 for all elements of array A(increment R0) until R3 is not equal to zero.Go to End of Program

OR

If R4 is equal to 0 after AND operation,it indicates even number
Save the checked even number in location EVEN
Increment register R2 to indicate next location of array EVEN
Decrement R3 by 1(Number of elements in array A)
Repeat steps 14 to 16 for all elements of array A (increment R0) until R3 is not equal to zero.Go to End of Program */

@code: 

.data
    arr: .word 10,3,41,55,30,22,11,5,83,90
    even: .word 0,0,0,0,0,0,0,0,0,0 
    odd: .word 0,0,0,0,0,0,0,0,0,0
    len: .word 10
.text
    ldr r0,=arr
    ldr r1,=odd
    ldr r2,=even
    ldr r3,=len
    ldr r3,[r3]
    mov r5,#0
loop:
    ldr r4,[r0],#4
    mov r5,r4
    and r4,r4,#1
    cmp r4,#1
    beq oddnumber
    str r5,[r2],#4
    subs r3,r3,#1
    bne loop
    b end
oddnumber:
    str r5,[r1],#4
    subs r3,r3,#1
    bne loop
end:
.end