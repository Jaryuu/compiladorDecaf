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
metodo0:
/*Obteniendo los parametros y guardandolos en memoria*/
PUSH {LR}
MOV R3, #3
/*Retornando a donde se llamo al metodo.*/
POP {R4}
PUSH {R3}
MOV PC, R4
main0:
/*Obteniendo los parametros y guardandolos en memoria*/
PUSH {LR}
MOV R3, R11
@Agregar estado actual a la pila
PUSH {R3}
ADD R11, R11, #4
BL metodo0
POP {R4}
POP {R3}
SUB R11, R11, #4
STR R4, [R3,#0]
MOV R3, R11
LDR R3, [R3,#0]
LDR R0, =int
MOV R1, R3
BL printf
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
base:	.space 12