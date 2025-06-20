#ir ao ficheiro e indicar o numero de caracteres e dizer o que tem 
.data 
ficheiro: .asciiz"/Users/eduardojunqueira/Desktop/AESDC/testecontadordecaracteres.txt"
armazem: .space 200
mostrar_n_char: .asciiz"Número de caracteres do ficheiro: "
newline: .asciiz "\n"
.text

#file open
li $v0, 13    #open file
la $a0,ficheiro
li $a1,0  
li $a2,0 #leitura: A1=0, escrita:A1=1
syscall
move $s0,$v0

#read from file
li $v0,14 
move $a0,$s0
la $a1,armazem
li $a2,200 #leitura: A1=0, escrita:A1=1
syscall

move $t0,$v0
li $v0,4
la $a0,mostrar_n_char
syscall

 # print_int()
li $v0,1
move $a0,$t0
syscall

#print string()
li $v0,4
la $a0,newline
syscall

#print string()
li $v0,4
la $a0,armazem
syscall

#fclose
li $v0,16
move $a0,$s0
syscall

#exit
li $v0,10
syscall
