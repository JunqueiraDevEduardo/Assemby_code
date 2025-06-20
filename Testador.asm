.data
value1: .float 3.3
value2: .float 4.4
.text
# Load two single-precision floating-point values into $f2 and $f4
l.s $f2, value1
l.s $f4, value2

# Store the result of the remainder operation in $f6
jal fmodf

# fmodf function implementation
fmodf:
    # Save the return address in $ra
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Load the two input values into $f12 and $f14
    l.s $f12, value1
    l.s $f14, value2

    # Call the fmodf library function
    jal fmodf

    # Restore the return address from $ra
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    # Return the result in $f0
    jr $ra
