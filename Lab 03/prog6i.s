/* Write a program to search for an element in an array using binary search technique. */
@code:

.data
    arr: .word 10,20,30,40,50,60,70,80,90,100
    key: .word 80
.text
    ldr r0,=arr ; base address of array
    ldr r1,=key
    ldr r1,[r1] ; key value
    mov r3,#0 ; low
    mov r4,#9 ; high
    mov r2,#0 ; mid
loop:
    cmp r3, r4 ; compare low and high
    bgt end ;
    add r2, r3, r4
    mov r2, r2, asr #1 ; mid = (low + high) / 2
    ldr r5, [r0, r2, lsl #2] ; load arr[mid]
    cmp r5, r1 ; compare arr[mid] with key
    beq found
    blt greater
    bgt less
found:
    mov r0, r2 ; if found, return mid
    b end
less:
    sub r4, r2, #1 ; if less, high = mid - 1
    b loop
greater:
    add r3, r2, #1 ; if greater, low = mid + 1
    b loop
end:
    swi 0x11