# Define os dois números de ponto flutuante a serem divididos
.data
num1: .float 8.3
num2: .float 2.1

# Código para calcular o resto da divisão
.text
li $t0, 0
li $t1, 0
l.s $f0,num1
l.s $f1,num2
cvt.w.s $f0, $f0
cvt.w.s $f1, $f1
div.s $f0, $f1
mfc1 $t0, $f0
mflo $t1
mul.s $f1, $f0
sub.s $f0, $f1
