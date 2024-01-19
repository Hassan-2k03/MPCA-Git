/* Write an ALP to find GCD of two numbers (without using LDR and STR instructions).Both numbers are in registers. Use only registers.

Algorithm
1.The first number is to be saved in R0
2.The second number is to be saved in R1
3. Compare both numbers in R0 and R1.
4.If they are equal, end execution 
5.If R0 is greater than R1,R0= R0-R1
6.Repeat steps 3 to 6 till R2=R3, end execution 
7. If R0 is lesser than R1,R1= R1-R0
(Three Screenshots(A=B,A<B,A>B) Choose your own example)

CASE: 
R0 0x0A
R1 0x0F
1st iteration 
R2=0x0A
R3=0x0F
R3=0x0F-0x0A=0x05
2nd iteration 
R2=0x0A
R3=0x05
R2=0x0A-0x05=0x05
3rd iteration 
R2=0x05
R3=0x05
GCD=5 */

@code:

.data

.text
    MOV R0,#0x0A
    MOV R1,#0x0F
    CMP R0,R1
    BEQ end
    BGT greater
    BLT lesser
greater:
    SUB R1,R1,R0
    B compare
lesser:
    SUB R0,R0,R1
    B compare
compare:
    CMP R0,R1
    BNE greater
end:
    SWI 0x11