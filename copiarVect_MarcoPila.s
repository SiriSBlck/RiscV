# Sea la siguiente subrutina expresada en lenguaje de alto nivel. 
# Programa en ensamblador Risc V el fragmento de la subrutina función. 
# Para probar que funciona, escribe parte de un programa principal que 
# llama a la subrutina “funcion”, pasándole antes los parámetros en pila, 
# y utilizando marco de pila para las variables locales. Recuerda 
# gestionar dentro de funcion la salvaguarda de la dirección de retorno 
# y fp del llamante.

.data
N: .word 4
Vect: .word  -4, 5, -7, -33
.text
.global main 
main:
    la t0, Vect
    sw t0, 0(sp)
    addi sp, sp, -4 #hacemos push de Vect en pila 
    
    la t0, N
    lw t0, 0(t0) #valor de N
    sw t0, 0(sp)
    addi sp, sp, -4 #hacemos push de N en pila
    
    call funcion
    addi sp, sp, 8 #limpiamos la pila
    
    j fin

funcion:
    addi sp, sp, -8 #reserva espacio para dirección de retorno y fp
    sw ra, 4(sp) #guardamos dr en pila
        #li s0, 1

    sw s0, 8(sp) #guargamos fp en pila
    addi s0, sp, 0
    lw t2, 12(sp) # valor de N
    addi, t1, t2, 1 #reservamos esp para N(núm. elems vect) y otra variable(N+1)
    slli t1, t1, 2
    neg t1, t1
    add sp, sp, t1 #reservamos espacio para las variables locales
    sw x0, 0(sp) #push de i=0
    addi t0, s0, 16 #puntero a dir con la dir del primer elem Vect en pila
    lw t0, 0(t0) #puntero a dir primer elem Vect
    addi t1, s0, -4 #puntero a aux
    buc:
        lw t3, 0(t0) #cargamos elemento de vect
        sw t3, 0(t1) #primera posición de aux
        
        addi t1, t1, -4
        addi t0, t0, 4
        addi t2, t2, -1
    blt x0, t2, buc
    
    addi sp, s0, 0
    lw s0, 0(sp)
    lw ra, 4(sp)
    ret
    
fin:	nop
