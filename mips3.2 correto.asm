.data
pedir:    .asciiz     "Introduza o valor em graus Fahrenheit: "
res:    .asciiz     "Valor em Celsius: "

v5:    .float    5.0
v9:    .float    9.0
v32:    .float     32.0
    
    .text
main:
    # Pedir valor em Fahrenheit
    li $v0, 4
    la $a0, pedir
    syscall
    
    # Read Float
    li $v0, 6
    syscall
    
    jal f2c
    
    
    li $v0, 4
    la $a0, res
    syscall
    
    li $v0, 2
    mov.s $f12, $f0
    syscall
    
    
    j exit
    
f2c:
    l.s $f1, v5
    l.s $f2, v9
    div.s $f1, $f1, $f2
    l.s $f2, v32
    sub.s $f0, $f0, $f2
    mul.s $f0, $f0, $f1
    jr $ra
    
exit:
    li $v0, 11
    syscall