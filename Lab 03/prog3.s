/* Write an ALP to find the sum of all the digits of a given 32 bit number.*/
@code: 

.data
    n:.word 0xffffffff
.text
    ldr r0,=n
    ldr r0,[r0]
    
