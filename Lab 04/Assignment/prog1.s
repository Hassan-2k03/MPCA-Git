/* Write an ALP to find whether a given character is present in a string. If present, find how many times the given character is present 
in a string. */
@code: 

.data
    string: .asciz "hello"
    char: .word 'l'
    count: .word 0
.text
    ldr r0, =string
    ldr r1, =char
    ldr r1, [r1]
    ldr r2, =count
    mov r3, #0
    mov r4, #0
    loop:
        ldrb r5, [r0], #1
        cmp r5, #0
        beq end
        cmp r5, r1
        bne loop
        add r3, r3, #1
        b loop
    end:
        str r3, [r2]
        swi 0x11
