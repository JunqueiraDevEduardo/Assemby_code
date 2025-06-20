.data
comp: .asciiz "olá\n"
perg: .asciiz "Em que ano nasceste? "
resp: .asciiz "idade: "
.text 
li $v0,4                                                                           
la $a0,comp
syscall
la $a0,perg  
syscall
li $v0,5
syscall
add $t0,$zero,$v0
li $t1,2022
sub $t0,$t1,$t0
li $v0,4
la $a0,resp
syscall
li $v0,1
add $a0,$zero,$t0
syscall

