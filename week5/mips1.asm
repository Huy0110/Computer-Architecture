#Laboratory Exercise 5, Home Assignment 1
.data
test: .asciiz "Pham Duc Huy 20194588"
.text
li $v0, 4
la $a0, test
syscall 