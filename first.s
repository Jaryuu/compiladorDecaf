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
LDR R11, =base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {LR}
ADD R11, R11, #4
BL metodo0
POP {R4}
POP {R3}
SUB R11, R11, #4
STR R4, [R3,#0]
MOV R3, R11
LDR R3, [R3,#0]
LDR R0, =int
MOV R1, R3
BL printf
/*Fin codigo main*/
BX LR

.section .data.align 4int: .asciz "%d\n"
char: .asciz "%s\n"
base:	.space 12
