# Escribe un programa que llamando a una función SumaVector sume dos
# vectores y almacene en memoria el vector resultado. Los parámetros
# de la función son: direcciones de comienzo de los 3 vectores
# (V1, V2, V3), y nº de elementos de los vectores (almacenado en N).

.data
V1:	.word 0,1,2,3,4,5,6,7,8,9
V2:	.word 0,1,2,3,4,5,6,7,8,9
N:	.word 10
.bss
V3:	.zero 40
.text
.global main
main:
la t0, N
lw t0, 0(t0) #numero elems vectores
la t1, V1 #puntero a V1
la t2, V2 #puntero a V2
la t3, V3 #puntero a V3
call SumaVector
j fin
SumaVector:
buc:
lw t4, 0(t1) #carga elementos de V1 y V2
lw t5, 0(t2) 
add t6, t4, t5 #realiza la operación
sw t6, 0(t3) #lo almacena en V3

addi t0, t0, -1 #actualiza número elementos
addi t1, t1, 4 #avanza punteros
addi t2, t2, 4
addi t3, t3, 4

bnez t0, buc
ret
fin:	nop
