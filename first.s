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
STR R1, [R0,#0]
LDR R0, addr_base
MOV R1, #0
STR R1, [R0,#1]
LDR R0, addr_base
MOV R1, #1
STR R1, [R0,#2]
@Empieza aqui el If
LDR R0, addr_base
LDR R0, [R0,#0]
LDR R1, addr_base
LDR R1, [R1,#1]
ORR R0, R0, R1
CMP R0, #0
MOVEQ R0, #1
MOVNE R0, #0
LDR R1, addr_base
LDR R1, [R1,#2]
ORR R0, R0, R1
/*If que hace el salto*/
CMP R0, #0
BEQ label_0_false
@ codigo del if
LDR R1, addr_base
MOV R2, #12
STR R2, [R1,#7]
LDR R1, addr_base
MOV R2, #100
STR R2, [R1,#3]
B codeIf_0_next
@ codigo del else
label_0_false:
LDR R1, addr_base
MOV R2, #19
STR R2, [R1,#11]
LDR R1, addr_base
MOV R2, #200
STR R2, [R1,#3]
codeIf_0_next:
/*Fin codigo main*/
MOV R0, R2
bx lr
addr_base : .word base
