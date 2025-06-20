#area_círculo pir^2 mais simples com numero float
.data
cump: .asciiz "Olá,utilizador"
raio: .asciiz "\nPorfavor introduza o raio do círculo:"
const: .float 0.0
PI: .float 3,141592653
Area: .asciiz"A area do círculo="
mostraemete: .asciiz"\n(insira o resultado a seguir para guardar no arquivo)A area do triângulo="
decisão: .asciiz"\nSe quiser guardar o resultado no arquivo por favor insira (Y), caso queira sair insira (N):"
ficheiro: .asciiz"/Users/eduardojunqueira/Desktop/AESDC/RESULTADOcirculo.TXT"
erro_op: .asciiz"\nO perador desconhecido!"
constprintfloat: .space 100
.text
#cump
li $v0,4
la $a0,cump
syscall

#pederaio:
la $a0,raio
syscall
#guarda raio
li $v0 6
syscall
#passar int para float
lwc1 $f1,const
add.s $f3,$f1,$f0


#calc:
l.s  $f2,PI   
mul.s $f0,$f3,$f3
mul.s $f0,$f0,$f2

#print_:area
li $v0,4
la $a0,Area
syscall
mov.s $f12,$f0
li $v0,2
syscall

li $v0,4
la $a0,mostraemete
syscall
#guarda em constprintfloat
li $v0,8
la $a0,constprintfloat
la $a1,100
syscall


decidir:
li $v0,4
la $a0,decisão
syscall
li $v0,12 #guardar caracteres
syscall
move $t0,$v0

lbu $t3,0($a0)          #apontador para o endereço
beq $t0,'Y',Sim
beq $t0,'N',Não
bne $t0,'Y',erro
bne $t0,'N',erro


erro:
li $v0,4
la $a0,erro_op
syscall

j decidir #para não ficar em loop infinito


Sim:
#guardar ficheiro
#cria ficheiro  #fopen()

li $v0, 13    
la $a0,ficheiro
li $a1,1   
li $a2,0 #leitura: A1=0, escrita:A1=1
syscall

#escreve o ficheiro #fwrite()
move $s0,$v0
li $v0,15   
move $a0,$s0
#mostrar o reusultado da operação:
la $a1,constprintfloat
#printfloat
li $a2,100 #guardar a quantidade de caracteres pretendidos 
syscall



#fclose
li $v0,16
move $a0,$s0
syscall

#exit
li $v0,10
syscall

Não:
#exit
li $v0,10
syscall
