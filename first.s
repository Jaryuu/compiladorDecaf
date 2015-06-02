.text
.global main
main:
stmfd sp!, {lr}
LDR R12, =addr_base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, R12
MOV R4, #0
STR R4, [R3,#0]
@Empieza aqui el while
begin_0:
MOV R3, R12
LDR R3, [R3,#0]
MOV R4, #10
CMP R3, R4
MOVLT R3, #1
MOVGE R3, #0
/*If que hace el salto*/
CMP R3, #0
BEQ codeWhile_0_next
MOV R4, R12
MOV R5, R12
LDR R5, [R5,#0]
MOV R6, #1
ADD R5, R5, R6
STR R5, [R4,#0]
LDR R0, =int
MOV R1, R5
B begin_0
codeWhile_0_next:
MOV R0, R5;
/*Fin codigo main*/
BX LR
ldmfd sp!, {lr}

.section .data
.align 4
int:	.asciz "%d\n"
base:	.space 12

