#Dado um número inteiro positivo,escreva os números inteiros
#de 0 até ao valor lido
.data
espaço: .byte' ' #inserir um espaço
.text
#guarda valor lido
li $v0,5
syscall

move $t0, $v0 # valor lido
move $t1,$zero

loop: 
	bgt $t1,$t0,Sai
	
	#imprimir $t1
	li $v0,1
	move $a0,$t1 
	syscall
	
	
	li $v0,4
	la $a0,espaço
	syscall
	
	addi $t1,$t1,1
	j loop
	
	li $v0,10
	syscall
Sai:	
li $v0,10
syscall
	
