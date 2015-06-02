.data
.balign 4
base:
.word 0

.text
.global main
metodo1:
/*Obteniendo los parametros y guardandolos en memoria*/
POP {R3}
MOV R4, R12
STR R3, [R4,#0]
@Empieza aqui el If
MOV R3, R12
LDR R3, [R3,#0]
MOV R4, #4
CMP R3, R4
MOVEQ R3, #1
MOVNE R3, #0
/*If que hace el salto*/
CMP R3, #0
BEQ label_0_false
@ codigo del if
MOV R4, R12
MOV R5, #10
STR R5, [R4,#4]
B codeIf_0_next
@ codigo del else
label_0_false:
MOV R4, R12
MOV R5, #15
STR R5, [R4,#4]
codeIf_0_next:
MOV R4, R12
LDR R4, [R4,#4]
/*Retornando a donde se llamo al metodo.*/
POP {LR}
PUSH {R4}
BX LR

main:
LDR R12, addr_base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, R12
@Agregar estado actual a la pila
PUSH {R3}
PUSH {LR}
MOV R4, #4
PUSH {R4}
ADD R12, R12, #4
BL metodo1
label0:
POP {R5}
POP {R3}
SUB R12, R12, #4
STR R5, [R4,#0]
MOV R4, R12
LDR R0, [R4,#0]
BL printf
MOV R5, R12
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
PUSH {R5}
PUSH {LR}
MOV R6, #8
PUSH {R6}
ADD R12, R12, #4
BL metodo1
label1:
POP {R7}
POP {R5}
POP {R4}
POP {R3}
SUB R12, R12, #4
STR R7, [R6,#0]
MOV R6, R12
LDR R0, [R6,#0]
BL printf
/*Fin codigo main*/
BX LR
addr_base : .word base
