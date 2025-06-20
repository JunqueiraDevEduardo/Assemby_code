#Dado um número inteiro positivo,escreva os números inteiros
#de 0 até ao valor lido
.data
espaço: .byte' ' #inserir um espaço
#escrever uma função
perg: .asciiz"Insira um  número inteiro:  "
.text
li $v0,4
la $a0,perg
syscall
li $v0,5
syscall
move $t0, $v0 # valor lido
move $t1,$zero
#operação
li $t2,2
div $t0,$t2
mfhi $t3
beq $t3,$zero,looppar
#resto diferente de zero
loopimpar:
li $v0,1
move $a0,$t1 #printa só os impares
syscall
	
li $v0,4
la $a0,espaço
syscall	
addi $t1,$t1,1#printar impar
j loopimpar
li $v0,10
syscall

looppar:  
	bgt $t1,$t0,Sai
	
	#imprimir $t1
	li $v0,1
	move $a0,$t1 #printa só os pares
	syscall
	
	
	li $v0,4
	la $a0,espaço
	syscall
	
	addi $t1,$t1,2#printar par
	j looppar
	
	li $v0,10
	syscall
Sai:	
li $v0,10
syscall