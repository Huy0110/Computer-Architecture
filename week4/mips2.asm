#Laboratory Exercise 4, Home Assignment 2
.text

li $s0, 0x20194588 #load test value for these function
andi $t0, $s0, 0x00000000 #Clear $s0
andi $t1, $s0, 0x0400 #Extract bit 10 of $s0
