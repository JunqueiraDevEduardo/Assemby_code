.data 
pede_val_1:  .asciiz"Introduza um valor inteiro: "
pede_val_2:  .asciiz"Introduza outro valor inteiro: "
pede_tipo_op:  .asciiz"Introduza o tipo de operação(x,/,%,+,-): "
erro_op: .asciiz"O perador desconhecido !"
msg: .asciiz" Resultado: "
operador: .space 2

.text
main:
li $v0,4
la $a0,pede_val_1
syscall
li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,pede_val_2
syscall
li $v0,5
syscall
move $t1,$v0

li $v0,4
la $a0,pede_tipo_op
syscall
li $v0,8
la $a0,operador
li $a1,2
syscall
#operação:

lbu $t3,0($a0)          #apontador para o endereço
beq $t3,'x',multiplica 
beq $t3,'/',divide
beq $t3,'%',resto
beq $t3,'+',soma
beq $t3,'-',diferença


li $v0,4
la $a0,erro_op
syscall

li $v0,17    #exit
li $a0,1    #return 1
syscall
multiplica: 
mul $t2,$t0,$t1
j fim

divide:
div $t2,$t0,$t1           #opcional mas mais trabalhoso: divide: move $a0,$t0
			#move $a1,$t1
j fim				# jal divide
                               #move $t2,$v0
resto: 
rem $t2,$t0,$t1
j fim

soma:
add $t2,$t0,$t1
j fim

diferença:
sub $t2,$t0,$t1
j fim

fim:
li $v0,4
la $a0,msg 
syscall
move $a0,$t2

li $v0,1       #resulatdo
syscall

li $v0,17
li $a0,0      #return 0
syscall








