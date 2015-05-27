.data
.balign 4
base:
.word 0

.text
.global main
main:
MOV R12, addr_base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R0, R12
MOV R1, #10
STR R1, [R0,#40]
MOV R0, #3
MOV R1, #0
MOV R3, #4
MUL R2, R0,  R3
ADD R0, R1, R2
MOV R1, R12
LDR R1, [R1,#40]
STR R1, [R0,#40]
MOV R0, R12
MOV R1, #3
MOV R2, #0
MOV R4, #4
MUL R3, R1,  R4
ADD R1, R2, R3
STR R1, [R0,#44]
/*Fin codigo main*/
MOV R0, R1
BX LR
addr_base : .word base
