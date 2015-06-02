.section .data
.align 4
int: .asciz "%d\n"
char: .asciz "%s\n"
base: .word 0

.text
.global main
main:
stmfd sp!, {lr}
LDR R11, =addr_base
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
@Empieza aqui el If
MOV R3, R11
LDR R3, [R3,#0]
MOV R4, #2
CMP R3, R4
MOVLT R3, #1
MOVGE R3, #0
/*If que hace el salto*/
CMP R3, #0
BEQ label_0_false
@ codigo del if
MOV R4, R11
MOV R5, #1
STR R5, [R4,#12]
B codeIf_0_next
@ codigo del else
label_0_false:
MOV R4, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
MOV R5, R11
LDR R5, [R5,#0]
MOV R6, #1
SUB R5, R5, R6
PUSH {R5}
ADD R11, R11, #16
BL fibonacci1
POP {R6}
POP {R4}
POP {R3}
SUB R11, R11, #16
STR R6, [R5,#4]
MOV R5, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
PUSH {R5}
MOV R6, R11
LDR R6, [R6,#0]
MOV R7, #2
SUB R6, R6, R7
PUSH {R6}
ADD R11, R11, #16
BL fibonacci1
POP {R7}
POP {R5}
POP {R4}
POP {R3}
SUB R11, R11, #16
STR R7, [R6,#8]
MOV R6, R11
MOV R7, R11
LDR R7, [R7,#4]
MOV R8, R11
LDR R8, [R8,#8]
ADD R7, R7, R8
STR R7, [R6,#12]
MOV R6, R11
LDR R6, [R6,#12]
LDR R0, =int
MOV R1, R6
BL printf
codeIf_0_next:
MOV R7, R11
LDR R7, [R7,#12]
/*Retornando a donde se llamo al metodo.*/
POP {R8}
PUSH {R7}
MOV PC, R8
main0:
/*Obteniendo los parametros y guardandolos en memoria*/
PUSH {LR}
MOV R3, R11
MOV R4, #0
STR R4, [R3,#4]
@Empieza aqui el while
begin_0:
MOV R3, R11
LDR R3, [R3,#4]
MOV R4, #40
CMP R3, R4
MOVLE R3, #1
MOVGT R3, #0
/*If que hace el salto*/
CMP R3, #0
BEQ codeWhile_0_next
MOV R4, R11
@Agregar estado actual a la pila
PUSH {R3}
PUSH {R4}
MOV R5, R11
LDR R5, [R5,#4]
PUSH {R5}
ADD R11, R11, #8
BL fibonacci1
POP {R6}
POP {R4}
POP {R3}
SUB R11, R11, #8
STR R6, [R5,#0]
MOV R5, R11
MOV R6, R11
LDR R6, [R6,#4]
MOV R7, #1
ADD R6, R6, R7
STR R6, [R5,#4]
B begin_0
codeWhile_0_next:
POP {PC}
exit:
mov r0, #0
mov r3, #0
ldmfd sp!, {lr}
BX LR

addr_base: .word base
