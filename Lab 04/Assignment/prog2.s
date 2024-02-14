/* Write a pr0gram in ARM7TDMI-ISA to generate a diagonal matrix. Note: do not read the matrix elements. */

@code: 

.DATA
    a: .WORD 0, 0, 0, 0, 0, 0, 0, 0, 0
.TEXT
    MOV R0, #1
    LDR R1,=a
    MOV R3, #3
outerloop:
    MOV R2, #3
innerloop:
    CMP R3, R2
    BEQ set_diagonal_element 
    MOV R4, #0
    STR R4, [R1], #4
    SUBS R2, R2, #1
    BNE innerloop
    SUBS R3, R3, #1
    BNE outerloop
    B exit
set_diagonal_element:
    STR R0, [R1], #4
    ADD R0, R0, #1
    SUBS R2, R2, #1
    BNE innerloop
exit:
    SWI 0x011
