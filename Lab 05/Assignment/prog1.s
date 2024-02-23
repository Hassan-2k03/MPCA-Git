/* Write a ARM7TDMI-ISA program to swap the first and last character of a given string.
Example:
Input: ‘dog’
Output: ‘god’*/

@code:

.data
str: .asciz "dog"  
.text
    ldr r0, =str
    bl swap
    b end
swap:
    ldrb r1, [r0]
    ldrb r2, [r0, #2]
    strb r1, [r0, #2]
    strb r2, [r0]
    bx lr
end:
    mov r7, #1
    swi 0