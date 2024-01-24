/* Write a program to find the largest number from a given set of numbers.

Algorithm

1.Initialise array A in .data segment
2.Let R0 contain address of A
3.Copy the first element of array A to R1. Initial value of biggest number is assumed to be 10 stored in R1
4.Let R3 contain count of number of elements in array A
5.Compare each element of array A with biggest value in R1
6.If R1 is less than current element of array A ,then current element of array A becomes new BIG value in R1
7.Check for all elements of array A
8.Decrement R3 by 1(Count for number of elements of array A)
9.Repeat checking all the array elements until R3 becomes zero
10.If R1 is greater than current element of array A,continue to check for remaining elements of array A
11.Decrement R3 by 1(Count for number of elements of array A)
12.Repeat checking all the array elements until R3 becomes zero

A: .word
10,50,41,55,30,20,11,
5,100,77

Largest
value=100=0X64 */

@code:

.data
    A: .word 10,50,41,55,30,20,11,5,100,77
    Largest: .word 0
.text
    ldr r0,=A
    ldr r1,[r0]
    ldr r3,=10
loop:
    cmp r3,#0
    beq exit
    ldr r2,[r0],#4
    cmp r1,r2
    bgt next
    mov r1,r2
next:
    subs r3,r3,#1
    b loop
exit:
    ldr r0,=Largest
    str r1,[r0]
    ldr r0,=Largest
    ldr r1,[r0]
    mov r7,#1
.end