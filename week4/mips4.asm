.text
li $t0, 0	# overflow check, default = 0
li $s1, 4588	# load a
li $s2, 2147483600	# load b

addu $s3, $s1, $s2	# s3 = s1 + s2
xor $t1, $s1, $s2	# t1 = s1 xor s2 
bltz $t1, exit		# if(s1 xor s2) < 0 => s1, s2 don't have the same sign => exit)
checkSum:
xor $t1, $s1, $s3	# check if s1 and (s1 + s2) have the same sign or not
bltz $t1, overflow	# if s1 and (s1 + s2) don't have the same sign, then overflow occur
j exit			# else, overflow not occur

overflow:
li $t0 ,1

exit:


