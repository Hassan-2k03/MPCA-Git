/* Convert a given 2 digit hexadecimal number to ASCII CODE and store the result in the memory location X and X+1 using ARM7TDMI – ISA.

Example:  (54)10   to  ASCII code  : 

Mask the LS byte.
54 and 0xF0   gives 50.
shift 50 right by 4 times
50  will be 05.
Now, 05 && 0x30 
Results in 0x35.
Repeat the same for the LS byte.
Mask the MS byte.
54 and 0x0F   gives 04.
Now, 04 && 0x30 
Results in 0x34. */

@code:

.data
    X: .word 0,0
.text
    ldr r3, =X
    mov r1, #0x54
    and r0, r1, #0xF0
    mov r0, r0, lsr #4
    orr r0, r0, #0x30
    str r0, [r3]
    and r2, r1, #0x0F
    orr r2, r2, #0x30
    add r3, r3, #4
    str r2, [r3]
    swi 0x11
 */