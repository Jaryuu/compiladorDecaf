/*Programa Modos de Direccionamiento PRE-INDEX */
/*Nota: Al regresar de printf r3 tiene un valor distinto,
  por eso se utilizo r5 para almacenar la direccion.*/

.data
.align 2

arreglo:    .word   1,2,3,4,5,6,7,8,9,10
formato:    .asciz  "%d\n"

.text
.align 2

.global main
.type main,%function

main:
    
    stmfd sp!,{lr}
    
    ldr r5,=arreglo
    mov r7,#0 
    mov r6,#9
    mov r1,#0

despliegue:

    ldr r1,[r5,#4]!
    ldr r0,=formato
    bl printf
    
    add r7,r7,#1
    cmp r6,r7
    bne despliegue
    
    mov r0,#0
    mov r3,#0
    ldmfd sp!,{lr}
    bx lr
