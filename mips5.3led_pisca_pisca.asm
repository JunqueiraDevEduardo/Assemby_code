
#off
.data 
ponto: .asciiz  "/dev/ttyUSB0" #ler a entrada usb do arduino
LED_ON: .byte 0x80
LED_OFF: .byte 0x00
.text
#file open
li $v0, 13    #open file
la $a0,ponto
li $a1,1 
li $a2,0 #leitura: A1=0, escrita:A1=1
syscall
move $s0,$v0
jal delay_3s
#acende um led espera 1s 
ciclo:
li $v0,15
move $a0,$s0
la $a1,LED_ON
li $a2,1
syscall
jal delay_1s

#apaga o led espera 1s
li $v0,15
move $a0,$s0
la $a1,LED_OFF
li $a2,1
syscall
jal delay_1s
j ciclo



delay_1s:li $v0,32
	li $a0,1000
	syscall
	
delay_3s:li $v0,32
	li $a0,3000
	syscall
	
