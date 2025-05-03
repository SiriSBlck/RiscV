# Escribe un programa que recorra un vector y sustituya todos los elementos
# con valor negativo por su opuesto. El bucle que recorre el vector estará 
# en el main y el cálculo del opuesto se hará llamando a una función.

.data
V:	.word 90, -80, 70, -60, -50, -40, -30, 20, 10, 5
N:	.word 10
.text
.global main 
main:
     la t0, N 
     lw t0, 0(t0) #número de elementos
     la t1, V #puntero al vector
     
bucleV2:          
     beqz t0, fin 
     lw t2, 0(t1)
     blt x0, t2, act
     call opuesto
     
act: addi t1, t1, 4
     addi t0, t0, -1
      
     j bucleV2
opuesto:
     neg a0, t2
     sw a0, 0(t1)
     ret
fin:	nop   
