.data
.balign 4
base:
.word 0

.text
.global main
main:
@Obteniendo los parametros y guardandolos en memoria
LDR R0, addr_base
ADD R0, R0, #0
MOV R1, #10
STR R1, [R0]
LDR R0, addr_base
ADD R0, R0, #4
MOV R1, #12
STR R1, [R0]
LDR R0, addr_base
ADD R0, R0, #4
LDR R1, addr_base
LDR R1, [R1,#4]
LDR R2, addr_base
LDR R2, [R2,#0]
ADD R1, R1, R2
STR R1, [R0]
@HALT
ldmfd sp!, {lr}
bx lr
addr_base : .word base