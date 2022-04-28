
.data
	string:		.space	50
	message:	.asciiz	"\nChuoi dao nguoc:\n"
.text
	addi	$t1, $zero, 21
	la	$s1, string
read_char:	
	li	$v0, 12
	syscall

	addi	$t1, $t1, -1
	beq 	$v0, 10, end_read_char
	beqz	$t1, end_read_char
	
	add	$t3, $t1, $s1
	sb	$v0, 0 ($t3)
	
	j	read_char
end_read_char:
	li	$v0, 4			# read string $v0 luu charactor
	la 	$a0, message
	syscall
	li	$v0, 4
	la	$a0, 0 ($t3)		# in ra chuoi dao nguoc
	syscall
	


	
	
