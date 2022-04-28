#Laboratory Exercise 5, Home Assignment 2
.data
x:	.space	1000
y: 	.asciiz	"Pham Duc Huy"
.text	
la	$a0, x
la	$a1, y
strcpy:	add	$s0, $zero, $zero
L1: add	$t1, $s0, $a1
lb	$t3, 0 ($t1)
	
add	$t0, $s0, $a0
sb	$t3, 0 ($t0)
	
beq	$t3, $zero, endOfStrcpy	
nop	
addi	$s0, $s0, 1
j	L1
endOfStrcpy: li	$v0, 4			# Print string
la	$a0, x			# print the sum of
syscall
	
