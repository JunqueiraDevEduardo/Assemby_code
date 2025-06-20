.data 
far: .asciiz"Insira o valor da temperatura em Fahrenheit: "
resultado: .asciiz"O valor da operação= "
cinco: .float  5.0
nove: .float 9.0
constante: .float 32.0    #no  teste sai constante  pi
.text
li $v0,4
la $a0,far
syscall
li $v0,5
syscall
mtc1 $t0,$f5
cvt.s.w $f5,$f5

lw $t0,cinco
mtc1  $t0,$f1           //$f0=5.0
cvt.s.w $f0,$f0

lw $t0,nove
mtc1 $t0,$f1           //$f1=9.0
cvt.s.w $f1,$f1


lw $t0,constante
mtc1 $t0,$f1             //$f2=32.0
cvt.d.w $f2,$f2

div.s $f2,$f1,$f0
sub.s $f3,$f5,$f5
mul.s $f12,$f2,$f3

li $v0,4
la $a0,resultado

syscall

li $v0,2
la $12,resultado

syscall





