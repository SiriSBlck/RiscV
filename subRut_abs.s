.data
A:	.word 11
.bss
B:	.zero 4
.text
.global main 
main:
     la a0, A
     lw a0, 0(a0)
     call cuadrado 
     la t1, B
     sw a0 0(t1)
     j fin
cuadrado:
     mul a0, a0, a0
finCuad: ret
fin: nop
