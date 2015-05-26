.data
.balign 4
base:
.word 0

.text
.global main
metodo0:
/*Obteniendo los parametros y guardandolos en memoria*/
LDR R0, R12
MOV R1, #12
MOV R2, #15
ADD R1, R1, R2
STR R1, [R0,#4]
LDR R0, R12
LDR R0, [R0,#4]
/*Retornando a donde se llamo al metodo.*/
POP {LR}
PUSH {R0}
BX LR

main:
LDR R12, addr_base
/*Obteniendo los parametros y guardandolos en memoria*/
LDR R0, R12
@Agregar estado actual a la pila
PUSH {R0}
PUSH {LR}
ADD R12, R12, #12
BL metodo0
label0:
POP {R1}
POP {R0}
SUB R12, R12, #12
STR R1, [R0,#8]
/*Fin codigo main*/
MOV R0, R1
BX LR
addr_base : .word base
