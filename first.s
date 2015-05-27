.data
.balign 4
base:
.word 0

.text
.global main
metodo1:
/*Obteniendo los parametros y guardandolos en memoria*/
POP {R0}
MOV R1, R12
STR R0, [R1,#0]
MOV R0, R12
MOV R1, #90
STR R1, [R0,#0]
MOV R0, R12
MOV R1, #11
STR R1, [R0,#4]
MOV R0, R12
MOV R1, #12
STR R1, [R0,#0]
MOV R0, R12
LDR R0, [R0,#0]
/*Retornando a donde se llamo al metodo.*/
POP {PC}
PUSH {R0}
BX LR

metodo21:
/*Obteniendo los parametros y guardandolos en memoria*/
POP {R0}
MOV R1, R12
STR R0, [R1,#0]
MOV R0, #56
/*Retornando a donde se llamo al metodo.*/
POP {PC}
PUSH {R0}
BX LR

main:
LDR R12, addr_base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R0, R12
MOV R1, #1
STR R1, [R0,#0]
MOV R0, R12
@Agregar estado actual a la pila
PUSH {R0}
PUSH {LR}
MOV R1, #12
PUSH {R1}
ADD R12, R12, #12
BL metodo1
label0:
POP {R2}
POP {R0}
SUB R12, R12, #12
STR R2, [R1,#8]
/*Fin codigo main*/
MOV R0, R2
BX LR
addr_base : .word base
