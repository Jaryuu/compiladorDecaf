
.data
 
.balign 4
base:
    .word 0

.text
 
.balign 4
.global main
main:
    ldr r1, addr_base 
    mov r3, #3        
    str r3, [r1]      
    ldr r2, addr_base 
    mov r3, #4        
    str r3, [r2,#2]      
 
    ldr r1, addr_base 
    ldr r1, [r1]      
    ldr r2, addr_base 
    ldr r2, [r2,#2]      
    add r0, r1, r2
    bx lr
 
addr_base : .word base