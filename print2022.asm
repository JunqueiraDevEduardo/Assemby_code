.data
perg: .asciiz  "Em que ano estamos? "
resp: .asciiz "Estamos no ano "
.text
li $v0,4
la $a0,perg
syscall
li $v0,5
syscall
move $t0,$v0 #add $t0,zero,$v0
li $v0,4
la $a0,resp
syscall
li $v0,1
move $a0,$t0
syscall



 