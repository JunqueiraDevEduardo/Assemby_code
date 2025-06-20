#escrever uma função
.data
perg1: .asciiz"Insira um número:"
par: .asciiz"O número é par"
impar: .asciiz"o número é impar"

.text
#perg1
li $v0,4
la $a0,perg1
syscall
li $v0,5
syscall
move $a0,$v0

#comparação
beq  $v0,$zero,Imprime_Par



#função que retorna se o argumento $a0 é impar
#retorna 1 se for par
#retorna 2 se for impar
eimpar:
li $t0,2
div $a0,$t0

#parte inteira hi
mfhi $v0

#retornar para quem chamar esta função
jr $ra




#função que retorna se o argumento $a0 é par
#retorna 1 se for par
#retorna 2 se for impar
Imprime_Par:
li $t0,2
div $a0,$t0

#exit 
li $v0,10
syscall
