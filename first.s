.text
.global main
main:
stmfd sp!, {lr}
LDR R11, =base
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
factorial1:
/*Obteniendo los parametros y guardandolos en memoria*/
POP {R3}
STR R3, [R11, #0]
PUSH {LR}
@Empieza aqui el If
LDR R3, [R11, #0]
MOV R4, #0
CMP R3, R4
MOVEQ R3, #1
MOVNE R3, #0
/*If que hace el salto*/
CMP R3, #0
BEQ label_0_false
@ codigo del if
MOV R5, #1
STR R5, [R11, #8]
B codeIf_0_next
@ codigo del else
label_0_false:
@Agregar estado actual a la pila
/*Guardando todas las var. locales*/
LDR R5, [R11, #0]
PUSH {R5}
LDR R5, [R11, #4]
PUSH {R5}
LDR R5, [R11, #8]
PUSH {R5}
LDR R5, [R11, #0]
MOV R6, #1
SUB R5, R5, R6
PUSH {R5}
BL factorial1
POP {R6}
POP {R7}
STR R7, [R11, #8]
POP {R7}
STR R7, [R11, #4]
POP {R7}
STR R7, [R11, #0]
LDR R7, [R11, #0]
MUL R6, R6, R7
STR R6, [R11, #8]
codeIf_0_next:
LDR R5, [R11, #8]
/*Retornando a donde se llamo al metodo.*/
POP {R6}
PUSH {R5}
MOV PC, R6
main0:
/*Obteniendo los parametros y guardandolos en memoria*/
PUSH {LR}
MOV R4, #0
STR R4, [R11, #4]
@Empieza aqui el while
begin_0:
LDR R3, [R11, #4]
MOV R4, #10
CMP R3, R4
MOVLE R3, #1
MOVGT R3, #0
/*If que hace el salto*/
CMP R3, #0
BEQ codeWhile_0_next
@Agregar estado actual a la pila
/*Guardando todas las var. locales*/
LDR R5, [R11, #0]
PUSH {R5}
LDR R5, [R11, #4]
PUSH {R5}
LDR R5, [R11, #4]
PUSH {R5}
BL factorial1
POP {R6}
POP {R7}
STR R7, [R11, #4]
POP {R7}
STR R7, [R11, #0]
STR R6, [R11, #0]
LDR R5, [R11, #0]
LDR R0, =int
MOV R1, R5
BL printf
LDR R7, [R11, #4]
MOV R8, #1
ADD R7, R7, R8
STR R7, [R11, #4]
B begin_0
codeWhile_0_next:
POP {PC}
exit:
mov r0, #0
mov r3, #0
ldmfd sp!, {lr}
BX LR

.section .data
.align 4
int: .asciz "%d\n"
char: .asciz "%s\n"
base:	.space 1024