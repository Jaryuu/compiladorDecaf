.text
.global main
metodo0:
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, #3
/*Retornando a donde se llamo al metodo.*/
POP {R4}
PUSH {R3}
MOV PC, R4
BX LR

main:
stmfd sp!, {lr}
LDR R11, =base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, #99
LDR R0, =int
MOV R1, R3
BL printf
MOV R4, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
PUSH {LR}
ADD R11, R11, #4
BL metodo0
POP {R5}
POP {R4}
POP {R3}
SUB R11, R11, #4
STR R5, [R4,#0]
MOV R4, R11
LDR R4, [R4,#0]
LDR R0, =int
MOV R1, R4
BL printf
/*Fin codigo main*/
ldmfd sp!, {lr}
BX LR

.section .data
.align 4
int: .asciz "%d\n"
char: .asciz "%s\n"
base:	.space 12
