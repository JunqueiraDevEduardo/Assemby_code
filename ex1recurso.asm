#ex1
.data

array:   .word     5, 10, 20, 15, 18, 3, 0
resultado: .asciiz "Carcters numericos na string: "
media: .asciiz "\nA media do array inserido="
string: .space 9

.text
li $t1,0
la $t2,array
li $v0,8
la $a0,string
li $a1,9
syscall
li $t1,0
la $t2,string
loop:
lbu $t0,0($t2)   #(endereco)
beq $t0,$zero,fim
sgtu $t5,$t0,48    #t5=1=t0>48
beq $t5,$zero,resto
sltiu $t5,$t0,58   #t5=1=t0<58
beq $t5,$zero,resto
contador:
addi $t1,$t1,1    #contador++ 
resto: addi $t2,$t2,1  #apontador++
j loop

fim:
li $v0,4
la $a0,resultado
syscall
li $v0,1
move $a0,$t1
syscall

Media:
la      $t0, array          # carrega endereço de array para $t0
loop1:
        lw      $t1, 0($t0)         # carrega elemento do array para $t1
        beq     $t1, $zero, endloop # se elemento for 0, termina loop
        addi    $t0, $t0, 4         # avança para o próximo elemento
        addi    $s0, $s0, 1         # incrementa contagem
        add     $t2, $t2, $t1       # adiciona elemento à soma
        j       loop1
endloop:
        div     $t3, $t2, $s0       # divide soma por contagem para obter média
        # resultado está em $t3
        li $v0,4
        la $a0,media 
        syscall
        move $a0,$t3
        li $v0,1
        syscall
exit:
li $v0,10
syscall
