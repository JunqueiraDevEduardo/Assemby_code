.data
ano: .space 4
comprimentar: .asciiz "Olá amigo "
pergunta: .asciiz "Qual o teu ano de nascimento ? "
resposta: .asciiz "O meu ano de nascimento é "
solucao: .space 4
.text
main: 
li $v0,4
la $a0,comprimentar
syscall
li $v0, 4
la $a0, pergunta
syscall 
li $v0,5
syscall
sd $v0,ano
li $v0,4
la $a0,resposta
syscall
sd $v0,solucao
li $v0,4
la $a0,resposta
syscall
li $v0,36
ld $a0,ano
syscall

      sd $a0,ano
      add $t0,$zero,$a0  #$t0=ano
      add $t1,$zero,2023  #$t2=2023
      sub $t1,$t1,$t0   #$tl=ano-ano
      syscall
      