.text
.align 2
.global main
.type main, %function

main:
@Obteniendo los parametros y guardandolos en memoria
LDR R0,=a
LDR R0, [R0]
MOV R1, #12
STR R1, [R0]
ldmfd sp!, {lr}
bx lr

.section .data
a: .word 0xf0f0f0f0