.data
.balign 4
base:
.word 0

.text
.global main
metodo0:
/*Obteniendo los parametros y guardandolos en memoria*/
LDR R0, addr_base
MOV R1, #12
MOV R2, #15
ADD R1, R1, R2
STR R1, [R0,#4]
LDR R0, addr_base
LDR R0, [R0,#4]
/*Retornando a donde se llamo al metodo.*/
POP LR
PUSH R0
BX LR

main:
/*Obteniendo los parametros y guardandolos en memoria*/
LDR R0, addr_base
@Agregar estado actual a la pila
PUSH R0
PUSH R1
@PUSH label0 esto no
PUSH LR
BL metodo0
label0:
POP R1
POP R0
STR R1, [R0,#8]
LDR R0, [R0,#8]
/*Fin codigo*/
bx lr
addr_base : .word base