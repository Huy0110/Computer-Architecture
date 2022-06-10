# Group 4: Pham Duc Huy - Nguyen Thi Thuy
.data
	string1: .space 100
	string2: .space 100
	mess_input_1: .asciiz "Nhap ten nguoi thu 1: "
	mess_input_2: .asciiz "Nhap ten nguoi thu 2: "
	mess_output_1: .asciiz "Ten nguoi thu 1 sau xu li: "
	mess_output_2: .asciiz "Ten nguoi thu 2 sau xu li: "
	mess_nhapLai: .asciiz "Nhap sai cu phap\nYeu cau nhap lai\n"
	space: .asciiz " " 
	newLine: .asciiz "\n"
.text

j input

input_again:
	li $v0, 4					# In ra yeu cau nhap lai
	la $a0, mess_nhapLai
	syscall
#---Nhap va doc chuoi-----------------------------------------------------------
input:	
	li $v0, 4					# in ra yeu cau nhap chuoi
	la $a0, mess_input_1
	syscall
	
	li $v0, 8					# doc chuoi tu ban phim
	la $a0, string1				
	li $a1, 100					
	syscall
	
	li $v0, 4					# in ra yeu cau nhap chuoi
	la $a0, mess_input_2
	syscall
	
	li $v0, 8					# doc chuoi tu ban phim
	la $a0, string2				
	li $a1, 100					
	syscall

li $t0,0 						# i=0
check_without_digit_1:
	la $a1, string1					# load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri dau tien cua string
	lb $a0, 0($a1)
			
	#li $v0, 1					# in integer
	#syscall
		
	beq $a0, 0x0a, exit_check_without_digit_1		# neu phan tu a[i]='\n' thi exit (0x0a = '\n')
	li $t2, 'z'
	li $t3,'a'
	li $t4,'Z'
	li $t5,'A'
	li $t6,' '
	sle $t8, $a0, $t6 				#2 dong nay de xet a0 = ' '
	sle $t9, $t6, $a0
	sle $t1, $a0, $t2				# a0 <='z' -> t1 =1
	sle $t2, $t3, $a0 				# a0 >='a' -> t2 =1
	sle $t3, $a0, $t4 				# a0 <='Z' -> t3 =1
	sle $t4, $t5, $a0 				# a0 >='A' -> t4 =1
	and $t5, $t1, $t2 				# t5 = a0 <= 'z' && a0 >= 'a'
	and $t6, $t3, $t4 				# t6 = a0 <= 'Z' && a0 >= 'A'
	and $t7, $t8, $t9 				# t7 = a0 == ' '
	or $t8, $t6, $t5 
	or $t9, $t7, $t8  				# t9 = t5 || t6 || t7
	bne $t9, 1, input_again				# neu khong thoa man thi yeu cau nhap lai
	addi $t0,$t0, 1					# i++
			
	j check_without_digit_1	
exit_check_without_digit_1:				# ket thuc vong while

li $t0,0 						# i=0
check_without_digit_2:
	la $a1, string2					# load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri dau tien cua string
	lb $a0, 0($a1)
			
	#li $v0, 1					# in integer
	#syscall
		
	beq $a0, 0x0a, exit_check_without_digit_2		# neu phan tu a[i]='\n' thi exit (0x0a = '\n')
	li $t2, 'z'
	li $t3,'a'
	li $t4,'Z'
	li $t5,'A'
	li $t6,' '
	sle $t8, $a0, $t6 				#2 dong nay de xet a0 = ' '
	sle $t9, $t6, $a0
	sle $t1, $a0, $t2				# a0 <='z' -> t1 =1
	sle $t2, $t3, $a0 				# a0 >='a' -> t2 =1
	sle $t3, $a0, $t4 				# a0 <='Z' -> t3 =1
	sle $t4, $t5, $a0 				# a0 >='A' -> t4 =1
	and $t5, $t1, $t2 				# t5 = a0 <= 'z' && a0 >= 'a'
	and $t6, $t3, $t4 				# t6 = a0 <= 'Z' && a0 >= 'A'
	and $t7, $t8, $t9 				# t7 = a0 == ' '
	or $t8, $t6, $t5 
	or $t9, $t7, $t8  				# t9 = t5 || t6 || t7
	bne $t9, 1, input_again				# neu khong thoa man thi yeu cau nhap lai
	addi $t0,$t0, 1					# i++
			
	j check_without_digit_2	
exit_check_without_digit_2:				# ket thuc vong while

#-----xu ly xau 1---------
#---Tim do dai chuoi-------------------------------------------------------------
	li $t0,0 					# i=0		
while_name_1:						# vong lap while tim do dai chuoi string
	la $a1, string1					# load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri dau tien cua string
	lb $a0, 0($a1)
			
	#li $v0, 1					# in integer
	#syscall			
	beq $a0, 0x0a, exit_while_name_1			# neu phan tu a[i]='\n' thi exit (0x0a = '\n')
	addi $t0,$t0, 1					# i++
	j while_name_1						
exit_while_name_1:					# ket thuc vong while
	add $s0, $t0, $zero				# s0 luu do dai string

#---Duyet tu cuoi chuoi len dau tim vi tri FINISH--------------------------------
	addi $t0, $s0, -1  				# i= s - 1 (=strlen)
for1_name_1:
	blt  $t0, $zero, exit_for1_name_1			# if i<0 => exit 
	la $a1, string1					# load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri cuoi cung cua string		
	lb $a0, 0($a1) 						
	addi $t0, $t0, -1 				# i--
	bne $a0, 0x20, for1_name_1			# if a[i]!=' '
	addi $s2, $t0, 1					# $s2 = i +1 ,$s2 se luu vi tri FINISH
exit_for1_name_1:

#---In ra mess_output_1-----------------------------------------------------
	li $v0, 4						
	la $a0, mess_output_1
	syscall
	
#---In ten tu Finish den het chuoi------------------------------------------------
	addi $t0, $s2, 1 				# i=finish+1 
for2_name_1:
	beq $t0, $s0, exit_for2_name_1			# if i == strlen => exit
	la $a1, string1					#load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri cua ky tu dau tien trong ten
							#(finish +1) cua string
	lb $a0, 0($a1) 
	li $v0, 11  					# printf(a[i])
	syscall
	addi $t0, $t0, 1 				# i++
	j for2_name_1
exit_for2_name_1:
	li $v0, 4					# in ra ki tu space " "
	la $a0, space
	syscall

#---In ho va ten dem tu 0 den FINISH-----------------------------------------------
	addi $t0, $zero, 0  				# i=0
for3_name_1:
	beq $t0, $s2, exit_for3_name_1			# if i == FINISH => exit 
	la $a1, string1					#load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri dau tien cua string
	lb $a0, 0($a1) 
	li $v0, 11  					# printf(a[i])
	syscall
	addi $t0, $t0, 1 				# i++
	j for3_name_1
exit_for3_name_1:



li $v0, 4						# in ra ki tu newLine "\n"
la $a0, newLine
syscall

#-------xy ly xau 2---------------
#---Tim do dai chuoi-------------------------------------------------------------
	li $t0,0 					# i=0		
while_name_2:						# vong lap while tim do dai chuoi string
	la $a1, string2					# load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri dau tien cua string
	lb $a0, 0($a1)					
	beq $a0, 0x0a, exit_while_name_2			# neu phan tu a[i]='\n' 0x0a = '\n'
	addi $t0,$t0, 1					# i++
	j while_name_2						
exit_while_name_2:						# ket thuc vong while
	add $s0, $t0, $zero				# s0 luu do dai string

#---Duyet tu cuoi chuoi len dau tim vi tri FINISH--------------------------------
	addi $t0, $s0, -1  				# i=strlen 
for1_name_2:
	blt  $t0, $zero, exit_for1_name_2			# if i<0 => exit 
	la $a1, string2					# load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri cuoi cung cua string		
	lb $a0, 0($a1) 						
	addi $t0, $t0, -1 				# i--
	bne $a0, 0x20, for1_name_2			# if a[i]!=' ' => Ti?p t?c l?p
	addi $s2, $t0, 1					# $s2 luu vi tri FINISH
exit_for1_name_2:

#---In ra mess_output_1-----------------------------------------------------
	li $v0, 4						
	la $a0, mess_output_2
	syscall
	
#---In ten tu Finish den het chuoi------------------------------------------------
	addi $t0, $s2, 1 				# i=finish+1 
for2_name_2:
	beq $t0, $s0, exit_for2_name_2			# if i == strlen => exit
	la $a1, string2					#load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri cua ky tu dau tien trong ten
							#(finish +1) cua string
	lb $a0, 0($a1) 
	li $v0, 11  					# printf(a[i])
	syscall
	addi $t0, $t0, 1 				# i++
	j for2_name_2
exit_for2_name_2:
	li $v0, 4					# in ra ki tu space " "
	la $a0, space
	syscall

#---In ho va ten dem tu 0 den FINISH-----------------------------------------------
	addi $t0, $zero, 0  				# i=0
for3_name_2:
	beq $t0, $s2, exit_for3_name_2			# if i == FINISH =>finish
	la $a1, string2					#load address string vao a1
	add $a1, $a1, $t0				# $a1 chua dia chi co so cua string
							# thoi diem bat dau: $a1 chua dia chi
							# tai vi tri dau tien cua string
	lb $a0, 0($a1) 
	li $v0, 11  					# printf(a[i])
	syscall
	addi $t0, $t0, 1 				# i++
	j for3_name_2
exit_for3_name_2:

	
	

	 
