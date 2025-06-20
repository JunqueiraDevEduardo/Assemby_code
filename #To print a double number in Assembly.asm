#To print a double number in Assembly
.data
double1: .double 2.3568978569856356
espaço: .byte' ' #inserir um espaço
mudalinha: .byte '\n'
double2: .double 4.3568978569856356
#double anda em pares float
.text
l.d $f12,double1 #até 14
li $v0,3
syscall
mov.d $f2,$f12

li $v0,4
	la $a0,espaço
	syscall


l.d $f12,double2 #até 14
li $v0,3
syscall
mov.d $f4,$f12

operação: 
li $v0,4
	la $a0,mudalinha
	syscall
div.d $f12,$f4,$f2 
li $v0,3
syscall
end:
li $v0,10
syscall