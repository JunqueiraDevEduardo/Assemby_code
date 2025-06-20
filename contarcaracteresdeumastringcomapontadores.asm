#com contador e apontador
.data

array:   .word     13, 17, 13, 32, 29, 15, 2, 31, 0
resultado: .asciiz "Carcters numericos na string: "
string: .space 9

.text
li $t1,0
la $t2,array
li $v0,8
la $a0,string
li $a1,9
syscall
li $t1,0
la $t2,string
loop:
lbu $t0,0($t2)   #(endereco)
beq $t0,$zero,fim
sgtu $t5,$t0,48    #t5=1=t0>48
beq $t5,$zero,resto
sltiu $t5,$t0,58   #t5=1=t0<58
beq $t5,$zero,resto
addi $t1,$t1,1    #contador++ 
resto: addi $t2,$t2,1  #apontador++
j loop

fim:
li $v0,4
la $a0,resultado
syscall
li $v0,1
move $a0,$t1
syscall
