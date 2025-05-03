.data
A:	.word 6
.bss
B:	.zero 4
Res: .zero 4
.text
.global main 
main:
     la a0, A
     lw a0, 0(a0)
     call factorial 
     la t0, B
     sw a0, 0(t0)
     j fin
factorial:
     bge x0, a0, finFact
     la t1, Res
     la t2, A
     lw t1, 0(t2)
     addi a0, a0, -1
     li t2, 1
     buc: 
         mul t1, t1, a0
         addi a0, a0, -1
         blt t2, a0, buc
     lw a0, 0(t1)
     ret
     finFact: li a0, -1
     ret
fin:	nop
