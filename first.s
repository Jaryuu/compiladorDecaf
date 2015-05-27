.data
.balign 4
base:
.word 0

.text
.global main
fib1:
/*Obteniendo los parametros y guardandolos en memoria*/
POP {R0}
MOV R1, R12
STR R0, [R1,#0]
@Empieza aqui el If
MOV R0, R12
LDR R0, [R0,#0]
MOV R1, #0
CMP R0, R1
MOVEQ R0, #1
MOVNE R0, #0
MOV R1, R12
LDR R1, [R1,#0]
MOV R2, #1
CMP R1, R2
MOVEQ R1, #1
MOVNE R1, #0
ORR R0, R0, R1
/*If que hace el salto*/
CMP R0, #0
BEQ label_0_false
@ codigo del if
MOV R1, R12
MOV R2, #1
STR R2, [R1,#4]
B codeIf_0_next
@ codigo del else
label_0_false:
MOV R1, R12
@Agregar estado actual a la pila
PUSH {R0}
PUSH {R1}
PUSH {LR}
ADD R12, R12, #16
MOV R2, R12
LDR R2, [R2,#0]
MOV R3, #1
SUB R2, R2, R3
PUSH {R2}
BL fib1
label0:
POP {R3}
POP {R1}
POP {R0}
SUB R12, R12, #16
STR R3, [R2,#8]
MOV R2, R12
@Agregar estado actual a la pila
PUSH {R0}
PUSH {R1}
PUSH {R2}
PUSH {LR}
ADD R12, R12, #16
MOV R3, R12
LDR R3, [R3,#0]
MOV R4, #2
SUB R3, R3, R4
PUSH {R3}
BL fib1
label1:
POP {R4}
POP {R2}
POP {R1}
POP {R0}
SUB R12, R12, #16
STR R4, [R3,#12]
MOV R3, R12
MOV R4, R12
LDR R4, [R4,#8]
MOV R5, R12
LDR R5, [R5,#12]
ADD R4, R4, R5
STR R4, [R3,#4]
codeIf_0_next:
MOV R3, R12
LDR R3, [R3,#4]
/*Retornando a donde se llamo al metodo.*/
POP {LR}
PUSH {R3}
BX LR

main:
LDR R12, addr_base
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R0, R12
@Agregar estado actual a la pila
PUSH {R0}
PUSH {LR}
ADD R12, R12, #4
MOV R1, #2
PUSH {R1}
BL fib1
label2:
POP {R2}
POP {R0}
SUB R12, R12, #4
STR R2, [R1,#0]
/*Fin codigo main*/
MOV R0, R2
BX LR
addr_base : .word base
