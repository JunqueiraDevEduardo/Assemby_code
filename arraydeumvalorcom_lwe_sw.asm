#array com sw e lw
.data
array:
	.align 2#alinhar para não dar problemas
	#array de 4 posições cada posição ocupa 4 ou seja 4x4=16
	.space 16
.text
move $t0,$zero#indice do array
move $t1,$zero #valor a ser colocado no array 
li $t2,16 #tamanho max 
loop:
beq $t0,$t2,sai_do_loop #sai do loop quando é igual a 16
sw  $t1,array($t0)#store word do $t1 do array na posição $t0
addi $t0,$t0,4#indice do array 4 em 4
addi $t1,$t1,1#valor a ser colocado no array em uma unidade
j loop


sai_do_loop: 
move $t0,$zero#indice do array
imprime:
beq $t0,$t2,sai_de_imprime #sai do loop quando é igual a 16
li $v0,1
lw  $a0,array($t0)#load word do $a0 do array na posição $t0
syscall

#atualizar indice 
addi $t0,$t0,4#indice do array 4 em 4
j imprime

sai_de_imprime:
li $v0,10
syscall











