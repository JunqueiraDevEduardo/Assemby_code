#atoi com sl e lw
	
			.data
str:	.asciiz "2001 Odisseia no espaco"	
	.text
main:		la $a0,str
		jal atoi
		move $a0,$v0
		li $v0,1
		syscall
		li $a0,0
		li $v0,17
		syscall
		
atoi:		addi $sp,$sp,-4
		sw $s0,0($sp)		#$s0=S
		addi $sp,$sp,-4		
		sw $s1,0($sp)		#$s1=digit
		addi $sp,$sp,-4
		sw $s2,0($sp)		#$s2=res
		li $s2,0		#res=0
		
while:		lbu $s0,0($a0)
		bge $s0,48,continua
		j termina
		
continua:	ble $s0,57,continua2
		j termina
		
continua2:	sub $s1,$s0,48
		addi $a0,$a0,1
		li $t0,10
		mul $s2,$s2,$t0		#res=res*10
		add $s2,$s2,$s1		#res=res+digit
		j while
termina:	move $v0,$s2
		lw $s2,0($sp)
		addi $sp,$sp,+4
		lw $s1,0($sp)
		addi $sp,$sp,+4
		lw $s0,0($sp)
		jr $ra
