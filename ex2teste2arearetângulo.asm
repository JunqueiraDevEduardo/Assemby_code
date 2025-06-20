#Escreva um programa em Assembly para MIPS que calcule a área de um rectângulo de acordo com os seguintes procedimentos:

#1) Peça ao utilizador os valores da largura e da altura (números reais);
#2) Chame a função CALC que calcula a área do rectângulo;
#3) Apresente ao utilizador, o resultado do cálculo;
#4) Pergunte ao utilizador se o resultado deve ser guardado num ficheiro; O utilizador deverá inserir a letra 'Y' para Sim ou 'N' para Não.
#5) Se a resposta à pergunta anterior, for Sim, o programa deverá guardar o resultado num ficheiro com o nome RESULTADO.TXT, numa pasta chamada AESDC e terminar com return(1). Se a resposta for Não, o programa termina com return(0).
#alguem
#area_retângulo largxalt mais simples com numero float
.data

printarea: .asciiz"_______________________Área do retângulo:CxL_____________________________"
pergB: .asciiz"\nIntroduza o comprimento do retângulo em números float:"
pergA: .asciiz"\nIntroduza a largura do retângulo em números float:"
constB: .float 0.0
constA: .float 0.0
mostraArea: .asciiz"A area do retângulo="
mostraemete: .asciiz"\n(insira o resultado a seguir para guardar no arquivo)A area do retângulo="
decisão: .asciiz"\nSe quiser guardar o resultado no arquivo por favor insira (Y), caso queira sair insira (N):"
ficheiro: .asciiz"/Users/eduardojunqueira/Desktop/AESDC/RESULTADOretângulo.TXT"
erro_op: .asciiz"\nO perador desconhecido!"
constprintfloat: .space 100
.text
#printarea:
li $v0,4
la $a0,printarea
syscall
la $a0,pergB
syscall
#guarda base
li $v0 6
syscall

#passar int para float
lwc1 $f1,constB
add.s $f3,$f1,$f0 #f0=0 #f1=constb depois de estar no f3 já o float introduzido
#base guardada em $f3

#pergaltura:
li $v0,4
la $a0,pergA
syscall
#guarda altura
li $v0 6
syscall

#passar int para float
lwc1 $f2,constA
add.s $f4,$f2,$f0 #f0=0 #f2=constb depois de estar no f4 já o float introduzido
#altura guardada em $f4


calc:
mul.s $f0,$f3,$f4
#operação está em $f0


#printmostraArea
li $v0,4
la $a0,mostraArea
syscall

#printfloat
mov.s $f12,$f0 #move $f0 pra $f12
li $v0,2 #mostra em $f12 
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
