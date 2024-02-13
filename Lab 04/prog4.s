/* ALP  to copy string from one location to another

Algorithm
1.Initialise R0 to contain the address of the string srcstr
2.Initialise R1 to contain the address of the string dststr
3.Copy character from srcstr to R2
4.Copy character from R2 to dststr
5.Check if character in R2 is valid character
6.Repeat step 3 to 5  until end of srcstr
8.Display srcstr and dststr using SWI0x02
9.End Program */

@code: 

.data
    srcstr: .asciz "PES University"
    dststr: .asciz "aaaaaaaaaaaaaa"
.text
    ldr r0,=srcstr
    ldr r1,=dststr
loop:
    ldrb r2,[r0],#1
    strb r2,[r1],#1
    cmp r2,#0
    bne loop
    mov r1,#0   
    ldr r0,=srcstr
    swi 0x02
    ldr r0,=dststr
    swi 0x02


    