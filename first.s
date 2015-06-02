.text
.global main
main:
stmfd sp!, {lr}
LDR R11, =base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, R11
MOV R4, #0
STR R4, [R3,#0]
@Empieza aqui el while
begin_0:
MOV R3, R11
LDR R3, [R3,#0]
MOV R4, #10
CMP R3, R4
MOVLT R3, #1
MOVGE R3, #0
/*If que hace el salto*/
CMP R3, #0
BEQ codeWhile_0_next
MOV R4, R11
MOV R5, R11
LDR R5, [R5,#0]
MOV R6, #1
ADD R5, R5, R6
STR R5, [R4,#0]
LDR R0, =int
MOV R1, R5
BL printf
B begin_0
codeWhile_0_next:
/*Fin codigo main*/
ldmfd sp!, {lr}
BX LR


.section .data
.align 4
int:	.asciz "%d\n"
base:	.space 12

