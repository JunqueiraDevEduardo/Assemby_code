#Abrir arquivo e mostrar o que tem lá dentro
.data
ficheiro: .asciiz"/Users/eduardojunqueira/Desktop/AESDC/RESULTADOtriângulo.txt"
conteudo_arquivo: .space 1024
.text
#file open
li $v0,13 #open file
la $a0,ficheiro
li $a1,0
syscall
move $s0,$v0
move $a0,$s0
#read from file
li $v0,14
la $a1,conteudo_arquivo
li $a2,1024 #leitura: A1=0, escrita:A1=1
syscall
#imprimir conteúdo do arquivo
li $v0,4
move $a0,$a1
syscall

#fclose
li $v0,16
move $a0,$s0
syscall
li $v0,10
syscall