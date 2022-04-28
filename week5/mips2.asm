# print the sum of two register $s0 and $s1: “The sum of (s0) and (s1) is (result)”
.data
	theSum:		.asciiz		"The sum of "
	andWord:		.asciiz		" and "
	is:		.asciiz		" is "
.text	
	addi	$s0, $zero, 2019
	addi	$s1, $zero, 4588	
	add	$t0, $s0, $s1
	
	li	$v0, 4			# print string
	la	$a0, theSum		# print The sum of
	syscall
	
	li	$v0, 1			# print number
	la	$a0, 0 ($s0)		# print s0
	syscall
	
	li	$v0, 4			# print string
	la	$a0, andWord		# print and
	syscall
	
	li	$v0, 1			# print number
	la	$a0, 0 ($s1)		# print s1
	syscall
	
	li	$v0, 4			# Print string
	la	$a0, is			# print is
	syscall
	
	li	$v0, 1			# Print number
	la	$a0, 0 ($t0)		# print t0 = s0 + s1
	syscall
