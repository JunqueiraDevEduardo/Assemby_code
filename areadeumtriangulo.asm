.data 
pede_largura: .asciiz "Digite a largura do retângulo:"
pede_altura: .asciiz "Digite altura do retângulo:"
perg:.asciiz "Quer guardar o resultado  num ficheiro "
mostra_A: .asciiz"A área=  "
Y: .word Sim
N: .word Não
ficheiro: .asciiz"/Users/eduardojunqueira/Desktop/AESDC/teste 2/Trabalho8.txt"  
expresso: .asciiz"Area" #5 chars 
.text
#largura
li $v0,4
la $a0,pede_largura      
syscall
li $v0,5
syscall
move $a0,$v0

#altura
li $v0,4
la $a0,pede_altura      
syscall
li $v0,5
syscall
move $a1,$v0
jal calc

#perg
li $v0,4
la $a0,perg     
syscall


#não sei como mostrar dizendo Y e N
li $v0,4
la $a0,mostra_A
syscall
mov.s $f12,$f0
li $v0,2
syscall

li $v0,10 #return 0;
syscall
	
	#calc area do retângulo
calc:	
	mtc1 $a0,$f0 
	mtc1 $a1,$f1 
	mtc1 $t1,$f1   
	mtc1 $t2,$f1 
	cvt.s.w $f0,$f1
	mul.s $f0,$f0,$f1
	jr $ra #jump pra return adress jal calc