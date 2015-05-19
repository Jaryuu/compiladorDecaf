.text
.align 2
.global main0
.type main0, %function
main0:
@Obteniendo los parametros y guardandolos en memoria
MOV R0, #0
LDR R0, [R0]
MOV R1, #12
STR R0, R1
ldmfd sp!, {lr}
bx lr