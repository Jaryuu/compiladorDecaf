.data
.balign 4
base:
message: .asciz "%d\n"
.word 0

.text
.global main
main:
LDR R12, addr_base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, R12
MOV R4, #2
MOV R5, #4
MOV R6, #3
MUL R5, R5, R6
ADD R4, R4, R5
STR R4, [R3,#0]
MOV R3, R12
LDR R0, [R3,#0]
BL printf
/*Fin codigo main*/
BX LR
addr_base : .word base
address_of_message : .word message
.global printf
.global scanf
