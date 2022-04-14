.data
n: .word 7
step: .word 1
A: .word 2019, 4588, 50, 1, 2, 3, -5, -6

.text
# load variable
addi $s1, $zero, 0 	# index i start from zero: $s1 = i = 0
la $s2, A		# $s2 = A[0]'s address
lw $s3, n		# $s3 = n
lw $s4, step		# $s4 = step = 1

addi $s5, $zero, 0	# init max = $s5 = 0

loop:
add $t1, $s1, $s1 	# $t1 = 2 * $s1 = (2 * i)
add $t1, $t1, $t1 	# $t1 = 4 * $s1 = (4 * i)
add $t1, $t1, $s2 	# $t1 store the address of A[i]
lw $t0, 0($t1) 		# load value of A[i] in $t0
slt $t4, $t0, $zero	# if(A[i] < 0 ) t4 = 1;
			# else t4 = 0
bnez $t4, setAbs	# if( A[i] < 0) setAbs
#########
checkMax:		# compare A[i] and max
sgt $t3, $t0, $s5	# if( A[i] > max) t3 = 1
			# else t3 = 0
beqz $t3, checkLoop	# if( A[i] <= max) check loop condition
######## if( A[i] > max )
add $s5, $t0, $zero	# max = A[i}

setAbs: 		# A[i] = abs(A[i])
sub $t0, $zero, $t0	# A[i] = 0 - A[i]
j checkMax

checkLoop:
add $s1, $s1, $s4 	# i = i + step
slt $t2, $s1, $s3	# if(i < n) $t2 = 1
			# else $t2 = 0
bnez $t2, loop		# if( i < n ) loop
# i = n, endloop
j endloop

endloop:
