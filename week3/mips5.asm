.data
arr: .word 0, 0, 2019, 4588, 1, 2, 3, 5
.text
	add	$s1,$zero,-1	# Luu i = 0 
	la	$s2,arr		# Dia chi A[0]
	addi	$s3,$zero,6	# Luu gia tri cua n
	addi	$s4,$zero,1	# Luu step 
	addi	$s5,$zero,0	# Luu sum = A[0]
loop: add $s1,$s1,$s4 #i=i+step
add $t1,$s1,$s1 #t1=2*s1
add $t1,$t1,$t1 #t1=4*s1
add $t1,$t1,$s2 #t1 store the address of A[i]
lw $t0,0($t1) #load value of A[i] in $t0
add $s5,$s5,$t0 #sum=sum+A[i]
beq $t2,$t0,loop #if A[i] == 0, loopp