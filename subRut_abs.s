# Escribe un programa que llamando a una función “abs” devuelva el 
# valor absoluto de un número dado.
.data
A:	.word -38
.bss
B:	.zero 4
.text
.global main
main:
la a0, A
lw a0, 0(a0)
call abs
la t0, B
sw a0, 0(t0)
j fin
abs:
bge a0, zero, finAbs
neg a0, a0
finAbs: 
ret
fin:	nop