.data
.balign 4
base:
.word 0

.text
.global main
main:
/*Obteniendo los parametros y guardandolos en memoria*/
LDR R0, addr_base
MOV R1, #1
MOV R2, #2
CMP R1, R2
MOVGT R1, #1
MOVLE R1, #0
MOV R2, #3
MOV R3, #4
CMP R2, R3
MOVGT R2, #1
MOVLE R2, #0
MOV R3, #5
MOV R4, #6
ADD R3, R3, R4
MOV R4, #7
CMP R3, R4
MOVGT R3, #1
MOVLE R3, #0
AND R2, R2, R3
ORR R1, R1, R2
STR R1, [R0,#0]
MOV R0 R1
/*Fin codigo*/
bx lr
addr_base : .word base
