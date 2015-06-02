.text
.global main
main:
stmfd sp!, {lr}
LDR R11, =_dataGlobal
push {lr}
BL main0
B exit
DivideU32:
	result .req r0
	remainder .req r1
	shift .req r2
	current .req r3
	clz shift,r1
	clz r3,r0
	subs shift,r3
	lsl current,r1,shift
	mov remainder,r0
	mov result,#0
	blt divideU32Return$
	divideU32Loop$:
		cmp remainder,current
		blt divideU32LoopContinue$
		add result,result,#1
		subs remainder,current
		lsleq result,shift
		beq divideU32Return$
	divideU32LoopContinue$:
		subs shift,#1
		lsrge current,#1
		lslge result,#1
		bge divideU32Loop$
	divideU32Return$:
		.unreq current
		mov pc,lr
		.unreq result
		.unreq remainder
		.unreq shift

fibonacci1:
/*Obteniendo los parametros y guardandolos en memoria*/
POP {R3}
STR R3, [R11, #0]
PUSH {LR}
MOV R3, #2
LDR R0, =int
MOV R1, R3
BL printf
@Empieza aqui el If
MOV R4, R11
LDR R4, [R4,#0]
MOV R5, #2
CMP R4, R5
MOVLT R4, #1
MOVGE R4, #0
/*If que hace el salto*/
CMP R4, #0
BEQ label_0_false
@ codigo del if
MOV R5, R11
MOV R6, #1
STR R6, [R5,#12]
B codeIf_0_next
@ codigo del else
label_0_false:
MOV R5, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
PUSH {R5}
MOV R6, R11
LDR R6, [R6,#0]
MOV R7, #1
SUB R6, R6, R7
PUSH {R6}
ADD R11, R11, #16
BL fibonacci1
POP {R7}
POP {R5}
POP {R4}
POP {R3}
SUB R11, R11, #16
STR R7, [R6,#4]
MOV R6, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
PUSH {R5}
PUSH {R6}
MOV R7, R11
LDR R7, [R7,#0]
MOV R8, #2
SUB R7, R7, R8
PUSH {R7}
ADD R11, R11, #16
BL fibonacci1
POP {R8}
POP {R6}
POP {R5}
POP {R4}
POP {R3}
SUB R11, R11, #16
STR R8, [R7,#8]
MOV R7, R11
MOV R8, R11
LDR R8, [R8,#4]
MOV R9, R11
LDR R9, [R9,#8]
ADD R8, R8, R9
STR R8, [R7,#12]
codeIf_0_next:
MOV R7, #3
LDR R0, =int
MOV R1, R7
BL printf
MOV R8, R11
LDR R8, [R8,#12]
/*Retornando a donde se llamo al metodo.*/
POP {R9}
PUSH {R8}
MOV PC, R9
BX LR

main0:
/*Obteniendo los parametros y guardandolos en memoria*/
MOV R3, R11
MOV R4, #0
STR R4, [R3,#4]
MOV R3, R11
LDR R3, [R3,#4]
LDR R0, =int
MOV R1, R3
BL printf
@Empieza aqui el while
begin_0:
MOV R4, R11
LDR R4, [R4,#4]
MOV R5, #40
CMP R4, R5
MOVLE R4, #1
MOVGT R4, #0
/*If que hace el salto*/
CMP R4, #0
BEQ codeWhile_0_next
MOV R5, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
PUSH {R5}
MOV R6, R11
LDR R6, [R6,#4]
PUSH {R6}
ADD R11, R11, #8
BL fibonacci1
POP {R7}
POP {R5}
POP {R4}
POP {R3}
SUB R11, R11, #8
STR R7, [R6,#0]
MOV R6, R11
MOV R7, R11
LDR R7, [R7,#4]
MOV R8, #1
ADD R7, R7, R8
STR R7, [R6,#4]
MOV R6, R11
LDR R6, [R6,#0]
LDR R0, =int
MOV R1, R6
BL printf
B begin_0
codeWhile_0_next:
/*Fin codigo main*/
exit:
mov r0, #0
mov r3, #0
ldmfd sp!, {lr}
BX LR

.section .data
.align 4
int: .asciz "%d\n"
char: .asciz "%s\n"
base:	.space 12
