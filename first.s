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
MOV R3, R12
MOV R4, #90
STR R4, [R3,#0]
MOV R3, R12
MOV R4, #11
STR R4, [R3,#4]
MOV R3, R12
MOV R4, #12
STR R4, [R3,#0]
MOV R3, R12
LDR R3, [R3,#0]
/*Retornando a donde se llamo al metodo.*/
POP {LR}
PUSH {R3}
BX LR

metodo21:
/*Obteniendo los parametros y guardandolos en memoria*/
POP {R3}
MOV R4, R12
STR R3, [R4,#0]
MOV R3, #56
/*Retornando a donde se llamo al metodo.*/
POP {LR}
PUSH {R3}
BX LR

main:
LDR R12, addr_base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, R12
MOV R4, #1
STR R4, [R3,#0]
MOV R3, R12
@Agregar estado actual a la pila
PUSH {R3}
PUSH {LR}
MOV R4, #12
PUSH {R4}
ADD R12, R12, #12
BL metodo1
label0:
POP {R5}
POP {R3}
SUB R12, R12, #12
STR R5, [R4,#8]
MOV R4, R12
LDR R4, [R4,#8]
MOV R0, R4
BL printf
/*Fin codigo main*/
BX LR
addr_base : .word base
