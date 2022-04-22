.data
aa: .word 4588
bb: .word 4588

.text

lw $s1, aa	# load aa to s1, result is s3
#lw $s3, bb
li $t0, 4	# case (with s0)
		# case1: abs of num
		# case2: copy value
		# case3: NOT of num
		# case4: branch if s1 <= s2
beq $t0, 1, case1
beq $t0, 2, case2
beq $t0, 3, case3
beq $t0, 4, case4

################ Calculate Abs (||)
case1:	
lw $s2, bb	# load bb to s2, result is s4
bltz $s2, setAbs	# if(s2 < 0) setAbs
# s2 >= 0
addi $s4, $s2, 0	# result to s4
j exit
nop 
# s2 < 0
setAbs:	
sub $s4, $zero, $s2
j exit
#######

################ Copy value
case2:	
lw $s2, bb
addu $s4, $s2, $zero
j exit

case3:
lw $s2, bb
nor $s4, $s2, $zero
j exit

case4:
li $s0,4588
li $s1,1
li $s2,2019
sle $s3, $s1, $s2
bne $s3,$zero,L
j exit

L:
li $s0,0
exit: 
