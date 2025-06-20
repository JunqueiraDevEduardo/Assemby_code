#calculadora compontos float
.data 
pede_val_1:  .asciiz"\nIntroduza um valor real: "
const1: .float 0.0
pede_val_2:  .asciiz"Introduza outro valor real: "
const2: .float 0.0
pede_tipo_op:  .asciiz"Introduza o tipo de operação(x,/,%,+,-): "
erro_op: .asciiz"O perador desconhecido !"
msg: .asciiz" Resultado: "
operador: .space 2
decisão: .asciiz"\nCaso pretenda realizar outra operação insira(S), caso queira sair insira (N):"
erro_op1: .asciiz"\nO perador desconhecido!"
constresto: .float 0.0
.text
main:
li $v0,4
la $a0,pede_val_1
syscall
#guarda 1 valor
li $v0 6
syscall
#passar int para float
lwc1 $f1,const1
add.s $f3,$f1,$f0

li $v0,4
la $a0,pede_val_2
syscall
#guarda altura
li $v0 6
syscall
#passar int para float
lwc1 $f2,const2
add.s $f4,$f2,$f0


li $v0,4
la $a0,pede_tipo_op
syscall
li $v0,8
la $a0,operador
li $a1,2
syscall
#escolhaoperação:
lbu $t3,0($a0)          #apontador para o endereço
beq $t3,'x',multiplica 
beq $t3,'/',divide
beq $t3,'%',resto
beq $t3,'+',soma
beq $t3,'-',diferença

li $v0,4
la $a0,erro_op
syscall

#exit
#return 1
li $v0,17    
li $a0,1    
syscall
multiplica: 
mul.s $f0,$f3,$f4
j fim

divide:
div.s $f0,$f3,$f4        		
j fim				
                               
resto:

div.s $f0,$f3,$f4  
mfhi $t1
mfc1 $t1, $f0
#passar int para float
lwc1 $f1,constresto
add.s $f3,$f1,$f0
mov.s $f0,$f3
j fim

soma:
add.s $f0,$f3,$f4  
j fim

diferença:
sub.s  $f0,$f3,$f4 
j fim

fim:
li $v0,4
la $a0,msg 
syscall

#resulatdo
mov.s $f12,$f0
li $v0,2
syscall


decidir:
li $v0,4
la $a0,decisão
syscall
li $v0,12 #guardar caracteres
syscall
move $t0,$v0

lbu $t3,0($a0)          #apontador para o endereço
beq $t0,'S',Sim
beq $t0,'N',Não
bne $t0,'S',erro
bne $t0,'N',erro


erro:
li $v0,4
la $a0,erro_op1
syscall
j decidir #para não ficar em loop infinito


Sim:
j main
Não:
#exit
li $v0,10
syscall
