/* Write a program to Classify the given set of numbers as positive, negative or zero and also store them in different memory locations.

Algorithm

Declare the array A in .data segment
Let R0 contain address of A,R1 contain the address of array pos,R2 contain the address of array neg,R3 contain theaddress of array zero
Let R4 contain the count for number of elements in array
Copy the first element of array to a temporary register R8
Compare element with zero
If element greater than zero, save the value in array pos.Increment R1 to point to next location of pos.Increment R0 to continue to check for remaining array elements.
Decrement R4 by 1(number of elements in array)
Repeat step 6a till all elements of array are checked.If R4 equals to zero go to end of program

OR

If element lesser than zero, save the value in array neg.Increment R2 to point to next location of neg.Increment R0 to continue to check for remaining array elements.
Decrement R4 by 1(number of elements in array)
Repeat step 6b till R4 is not equal to zero.If R4 equals to zero go to end of program

OR

If element is equal zero, save the value in array zero.Increment R3 to point to next location of zero.Increment R0 tocontinue to check for remaining array elements.
Decrement R4 by 1(number of elements in array)
Repeat step 6c till R4 is not equal to zero.If R4 equals to zero go to end of program */

@ code:

.data 
    A: .word 10,-3,41,-55,30,22,0,5,83,0
    pos: .word 0,0,0,0,0,0,0,0,0,0
    neg: .word 0,0
    zero: .word 0,0
.text
    ldr r0,=A
    ldr r1,=pos
    ldr r2,=neg
    ldr r3,=zero
    mov r4,#10
    mov r5,#0
loop:
    ldr r8,[r0],#4
    cmp r8,#0
    bgt posLabel
    blt negLabel
    beq zeroLabel
posLabel:
    str r8,[r1],#4
    subs r4,r4,#1
    bne loop
negLabel:
    str r8,[r2],#4
    subs r4,r4,#1
    bne loop
zeroLabel:
    str r8,[r3],#4
    subs r4,r4,#1
    bne loop
end:
.end