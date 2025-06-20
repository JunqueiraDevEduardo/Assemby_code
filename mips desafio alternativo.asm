.data
comp: .asciiz "olá\n"
perg: .asciiz "Em que ano nasceste? "
resp1: .asciiz "tens "
resp2: .asciiz " anos"
.text 
li $v0,4                                                                           
la $a0,comp
syscall
la $a0,perg  
syscall
li $v0,5
syscall
li $t0,2022
sub $t0,$t0,$v0
li $v0,4
la $a0,resp1
syscall
li $v0,1
add $a0,$zero,$t0
syscall
li $v0,4
la $a0,resp2
syscall
