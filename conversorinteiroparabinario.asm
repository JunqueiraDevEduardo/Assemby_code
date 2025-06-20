.data
str1: .asciiz "intruduza um numero inteiro: " 
str2: .asciiz "=valor binario: "
bin1: .asciiz "0"
bin2: .asciiz "1"
.text
	la $a0,str1
	add $v0,$zero,4
	syscall
	
	add $v0,$zero,5
	syscall
        
        add $t1,$zero,$v0
        
        li $t0,32
        add $t2,$zero,0x80000000 
#cicle if/else
if:
	and $t3,$t2,$t1
	beq $t3,$zero,else
		li $v0,4
		la $a0,bin2
		syscall
		j exit
	else:
		li $v0,4
		la $a0,bin1
		syscall	
exit:
     sll $t1,$t1,1
     subi $t0,$t0,1
     bne $t0,$zero,if       
        
