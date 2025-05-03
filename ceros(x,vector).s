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
      j fin
   abs:
      bge zero, a0, finAbs
      neg a0, a0
   finAbs: ret
fin:	nop

