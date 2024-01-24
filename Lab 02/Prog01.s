/* Write a program to add two numbers by reading them from memory and store the result back to the memory.

Algorithm:

Initialise array a with values in two consecutivememory locations
Initialise res to be the result memory locationwith initial value = zero
Let R0 indicate address of memory location a
Let R2 indicate address of memory location res
Copy First Number of array A to register R1
Increment R0 to access the second number
Copy Second Number of array A to register R3
Add First Number(in R1)and Second Number(inR3)
Save the addition result in R1
Copy the addition result from register R1 to memory location res,accessed by index register R2 */

@code: 

.data
    a: .word 10
    b: .word 20
    c: .word 0
.text
    ldr r0, =a
    ldr r1, =b
    ldr r2, =c
    ldr r3, [r0]
    ldr r4, [r1]
    add r3, r3, r4
    str r3, [r2]
.end