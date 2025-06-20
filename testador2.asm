.data
width: .float 0.0
height: .float 0.0
result: .float 0.0
save_prompt: .asciiz "Save result to file? (Y/N): "
result_file: .asciiz "AESDC/RESULTADO.TXT"
.text
main:
    # Get width and height from user
    li $v0, 6  # syscall code for reading float
    la $a0, width  # address of width variable
    syscall
    la $a0, height  # address of height variable
    syscall

    # Call CALC function to calculate area
    la $a0, width  # load width into $a0
    la $a1, height  # load height into $a1
    jal CALC  # jump to CALC function

    # Print result to user
    li $v0, 2  # syscall code for printing float
    l.s $f12, result  # load result into $f12
    syscall

    # Ask user if they want to save result to file
    li $v0, 4  # syscall code for printing string
    la $a0, save_prompt  # address of save_prompt string
    syscall

    # Read user's response
    li $v0, 12  # syscall code for reading char
    syscall
    move $t0, $v0  # move char to $t0

    # Check if user wants to save result to file
    bne $t0, 'Y', end  # if response is not 'Y', jump to end
    li $v0, 13  # syscall code for opening file
    la $a0, result_file  # address of result_file string
    li $a1, 0  # open file for writing
    li $a2, 0  # default permissions
    syscall
    move $s0, $v0  # move file descriptor to $s0
    # Write result to file
    li $v0, 15  # syscall code for writing float
    l.s $f12, result  # load result into $f12
    move $a0, $s0  # move file descriptor to $a0
    syscall

    # Close file
    li $v0, 16  # syscall code for closing file
    move $a0, $s0  # move file descriptor to $a0
    syscall
    li $v0, 1  # syscall code for exit
    li $a0, 1  # return value
    syscall
end:
    li $v0, 1  # syscall code for exit
    li $a0, 0  # return value
    syscall
CALC:
    # Area = width * height
    mul.s $f12, $f0, $f1  # multiply width and height and store result in $f12
    s.s $f12, result  # store result in result variable
    jr $ra  # return to main