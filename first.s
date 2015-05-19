.text
.align 2
.global main0
.type main, %function
main0:
@Obteniendo los parametros y guardandolos en memoria
LDR R0, [#0x0]
MOV R1, #12
STR R0, R1
ldmfd sp!, {lr}
bx lr