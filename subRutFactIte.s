.data
V:	.word 1,2,1,2,3,1,2,3,-4,-5
N:	.word 10
.bss
Sum: .zero 4
.text
.global main 
main:
    la t0, N
    lw t0, 0(t0)
    call SumaVector 
     
     j fin
SumaVector:
     bge x0, t0, finSV
     la t1, V #puntero elems vector
     la t3, Sum
     lw t3, 0(t3)
     buc:
         lw t2, 0(t1) #elem act de V
         add t3, t3, t2 #acumulador
         addi t1,t1, 4
         addi t0, t0, -1
         bnez t0, buc
     la t2, Sum
     sw t3, 0(t2)
     ret
finSV: li a0, 0
     ret
fin:	nop
