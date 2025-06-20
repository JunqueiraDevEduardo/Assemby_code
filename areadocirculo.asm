#calculo da área do circulo A=pi r^2; com numero inteiro
.data 
titulo: .asciiz "Calculo da Area do círculo\n"
pede_R: .asciiz "Digite o Raio do circulo: "
mostra_A: .asciiz"A área=  "
PI: .float 3.14159
.text
li $v0,4
la $a0,titulo
syscall
la $a0,pede_R       #nao é necessário fazer com o 4 pois já tenho feito em cima
syscall
li $v0,5
syscall
#$a0=f0
move $a0,$v0#raio
jal calc

li $v0,4
la $a0,mostra_A
syscall
mov.s $f12,$f0
li $v0,2
syscall

li $v0,10 #return 0;
syscall
	
	#calc virgula flutuante
calc:mtc1 $a0,$f0     
	cvt.s.w $f0,$f0
	mul.s $f0,$f0,$f0
	lwc1 $f1,PI
	mul.s $f0,$f0,$f1   #f0,f1 não pode ser f2,f3
	jr $ra #jump pra return adress jal calc
