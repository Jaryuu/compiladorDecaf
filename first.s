.text
.global main
fibonacci1:
/*Obteniendo los parametros y guardandolos en memoria*/
POP {R3}
MOV R4, R11
STR R3, [R4,#0]
@Empieza aqui el If
MOV R3, R11
LDR R3, [R3,#0]
MOV R4, #2
CMP R3, R4
MOVLT R3, #1
MOVGE R3, #0
/*If que hace el salto*/
CMP R3, #0
BEQ label_0_false
@ codigo del if
MOV R4, R11
MOV R5, #1
STR R5, [R4,#12]
B codeIf_0_next
@ codigo del else
label_0_false:
MOV R4, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
PUSH {LR}
MOV R5, R11
LDR R5, [R5,#0]
MOV R6, #1
SUB R5, R5, R6
PUSH {R5}
ADD R11, R11, #16
BL fibonacci1
POP {R6}
POP {R4}
POP {R3}
SUB R11, R11, #16
STR R6, [R5,#4]
MOV R5, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
PUSH {R5}
PUSH {LR}
MOV R6, R11
LDR R6, [R6,#0]
MOV R7, #2
SUB R6, R6, R7
PUSH {R6}
ADD R11, R11, #16
BL fibonacci1
POP {R7}
POP {R5}
POP {R4}
POP {R3}
SUB R11, R11, #16
STR R7, [R6,#8]
MOV R6, R11
MOV R7, R11
LDR R7, [R7,#4]
MOV R8, R11
LDR R8, [R8,#8]
ADD R7, R7, R8
STR R7, [R6,#12]
codeIf_0_next:
MOV R6, R11
LDR R6, [R6,#12]
/*Retornando a donde se llamo al metodo.*/
POP {R7}
PUSH {R6}
MOV PC, R7
BX LR

main:
stmfd sp!, {lr}
LDR R11, =base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, R11
MOV R4, #0
STR R4, [R3,#4]
@Empieza aqui el while
begin_0:
MOV R3, R11
LDR R3, [R3,#4]
MOV R4, #40
CMP R3, R4
MOVLE R3, #1
MOVGT R3, #0
/*If que hace el salto*/
CMP R3, #0
BEQ codeWhile_0_next
MOV R4, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
PUSH {LR}
MOV R5, R11
LDR R5, [R5,#4]
PUSH {R5}
ADD R11, R11, #8
BL fibonacci1
POP {R6}
POP {R4}
POP {R3}
SUB R11, R11, #8
STR R6, [R5,#0]
MOV R5, R11
MOV R6, R11
LDR R6, [R6,#4]
MOV R7, #1
ADD R6, R6, R7
STR R6, [R5,#4]
MOV R5, R11
LDR R5, [R5,#0]
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
int: .asciz "%d\n"
char: .asciz "%s\n"
base:	.space 12
