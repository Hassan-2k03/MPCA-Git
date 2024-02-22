; PrOGraM TO FIND THE SUM OF aLL THE ELEMENTS IN a MaTrIX OF aNY OrDEr.
; USE mla instruction. c=a+b, USING row Major Order

.data
	a: .word 1,2,3,4,5,6,7,8,9
	b: .word 1,1,2,2,3,3,4,4,5
	c: .word 0,0,0,0,0,0,0,0,0
.text
	ldr r4, =a
	ldr r12,=b
	ldr r10,=c
	mov r1, #3 
	mov r2, #0 
	mov r3, #0 
    mov r7, #4 
	mov r8, #0 
loop:	mla r5, r1, r2, r8  
	mla r6, r5, r7, r4  
	ldr r9, [r6]        
	mla r5, r1, r8, r3  
	mla r6, r5, r7, r12
	ldr r11,[r6]
    mla r0, r9, r11, r0  
	add r8, r8, #1      
    cmp r8, #3
    bne loop	
	mla r5, r1, r2, r3
	mla r6, r5, r7, r10
	str r0, [r6]
	mov r0, #0
	mov r8, #0
	add r3, r3, #1
	cmp r3, #3
	bne loop
	mov r3,#0
	add r2, r2, #1
	cmp r2, #3
	bne loop
	swi 0X011