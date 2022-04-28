#Laboratory Exercise 5, Home Assignment 3
.data
string:		.space	50
Message1:	.asciiz	"Nhap xau: "
Message2:	.asciiz	"Do dai la: "
.text
main:
get_string:
li $v0, 54
la $a0, Message1
la $a1, string	
la $a2, 100
syscall
get_length:
la  $a0, string	# a0 = Address(string[0])
add $v1, $zero, $zero# v1 = length = 0
add $t0, $zero, $zero# t0 = i
check_char:
add $t1, $a0, $t0	# t1 = string[i]'s address
lb  $t3, 0 ($t1)	# t3 =  string[i]
	
beq $t3, $zero, end_get_length
	
addi $v1, $v1, 1	# v1 = length ++
addi $t0, $t0, 1	# t0 = i ++
j	check_char
end_get_length:
li $v0, 56	
la $a0, Message2	# Print the string
addi $v1, $v1, -1
la $a1, 0 ($v1)	# Print the length of string
syscall
