.data
.balign 4
base:
.word 0

.text
.global main
main:
/*Obteniendo los parametros y guardandolos en memoria*/
LDR R0, addr_base
MOV R1, #10
STR R1, [R0,#0]
/*Fin codigo*/
bx lr
addr_base : .word base
