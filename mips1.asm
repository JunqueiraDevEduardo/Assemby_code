.data
#Criar e Escrever num ficheiro
ficheiro: .asciiz"/Users/eduardojunqueira/Desktop/AESDC/teste 2/Trabalho8.txt"  
expresso: .asciiz"Arquitetura e sistema de Computadores" #39 chars 
.text
#fazer ciclo até que seja 0
#cria ficheiro  #fopen()
li $v0, 13    #open file
la $a0,ficheiro
li $a1,1   
li $a2,0 #leitura: A1=0, escrita:A1=1
syscall
#escreve o ficheiro
move $s0,$v0
li $v0,15     #fwrite()
move $a0,$s0
la $a1,expresso
li $a2,39
syscall
#fclose
li $v0,16
move $a0,$s0
syscall
#exit
li $v0,10
syscall


