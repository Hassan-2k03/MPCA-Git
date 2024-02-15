/* ALP  to copy string from one location to another*/

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


    