.data
constante: .float 2.59375
zerof_constante:  .float 0.0
pedido: .asciiz"Introduza um valor inteiro: "
.text
main:
li $v0,4
la $a0,pedido
syscall
li $v0,5
syscall

mtc1 $v0,$f1
cvt.s.w $f1,$f1      #conversão ctv.s.w

mul.s $f0,$f1,$f2
li $v0,2
mov.s $f12,$f0        	 #print float
syscall

l.s  $f3,zerof_constante       
c.eq.s $f3,$f0			#salva 1 no main se $f3=!0
bc1f main

li $v0,17
li $a0,0   			#return 0
syscall





