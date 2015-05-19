.text
.align 2
.global main0
.type main0, %function
main0:
@Obteniendo los parametros y guardandolos en memoria
LDR R0,=a
LDR R0, [R0]
MOV R1, #12
STR R1, =a
ldmfd sp!, {lr}
bx lr

.section .data
a: .word 0xf0f0f0f0