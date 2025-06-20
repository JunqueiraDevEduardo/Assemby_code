#fazer um  progama que copie o o ficheiro 1 e para o ficheiro 2 que terá de ser criado
.data
entrada_ficheiro1:.asciiz"/Users/eduardojunqueira/Desktop/AESDC/RESULTADOtriângulo.txt"
saida_ficheiro2: .asciiz"/Users/eduardojunqueira/Desktop/AESDC/CopiadoRESULTADOt.txt"
buffer: .space 100

.text
 #abre o aqrivo 1
 #read arquivo 1
 #write arquivo 1 para buffer
 #abre arquivo 2
 #write buffer no arquivo 2
 #fecha arquivo1
 #fecha arquivo2
 #return 0
 
 
# Open file 
li   $v0, 13      # system call for open file
la   $a0, entrada_ficheiro1  # address of the source file name
li   $a1, 0       # file open for reading
li   $a2, 0       # open the file with default permissions
syscall           # call the operating system
move $s0, $v0     # save the file descriptor in $s0


move $a0,$s0

#read from file
li $v0,14 
la $a1,buffer
li $a2,100 #leitura: A1=0, escrita:A1=1
syscall


file2:
# Open file 
li   $v0, 13      # system call for open file
la   $a0, saida_ficheiro2  # address of the source file name
li   $a1, 0       # file open for reading
li   $a2, 0       # open the file with default permissions
syscall           # call the operating system
move $s0, $v0     # save the file descriptor in $s0

#escreve o ficheiro
move $s0,$v0
li $v0,15     #fwrite()
move $a0,$s0
la $a1,buffer
li $a2,100
syscall

#fclose
li $v0,16
move $a0,$s0
syscall


#fclose
li $v0,16
move $a0,$s0
syscall


#exit
li $v0,10
syscall

