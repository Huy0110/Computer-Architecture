#Laboratory Exercise 3, Home Assignment 1
start:
addi $s1, $0, 0x4588
addi $s2, $0, 0x2019
addi $s5, $0, 0x0001
addi $s6, $0, 0x0002
add $s3, $s1, $s2
add $s7, $s5, $s6
sgt $t0,$s3,$s7 # s3 = i +j > m+n 
bne $t0,$zero,else # branch to else if i+j>0
addi $t1,$t1,1 # then part: x=x+1
addi $t3,$zero,1 # z=1
j endif # skip “else” part
else: addi $t2,$t2,-1 # begin else part: y=y-1
add $t3,$t3,$t3 # z=2*z
endif: