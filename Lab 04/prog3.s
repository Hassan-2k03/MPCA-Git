/* Write an ALP  to find the  length of a given string8 */

@code:

.data
    string: .asciz "hello"
    
.text
    ldr r0,=string
    MOV r1,#0
loop:
    LDRB r2,[r0],#1
    CMP r2,#0
    BEQ end
    ADD r1,r1,#1
    B loop
end:
    swi 0x11