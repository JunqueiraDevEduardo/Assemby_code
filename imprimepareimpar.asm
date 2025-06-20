.data
cumprimento: .asciiz"Olá,utilizador"
perg: .asciiz"Insira um  número inteiro maior que 10:  "
impar: .asciiz"O número que inseriu é impar "
par: .asciiz"O número que inseriu é par"
.text
li $v0,4
la $a0,perg
syscall
li $v0,5
syscall
move $t0,$v0
#operação
li $t1,2
div $t0,$t1
mfhi $t2
beq $t2,$zero,exit
li $v0,4
la $a0,impar
syscall
li $v0,10
syscall
exit:   li $v0,4
	la $a0,par
	syscall
