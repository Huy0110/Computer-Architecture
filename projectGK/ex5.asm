#----------------------------------------------------------------------------------------------------
# Project 5: Write a program to get decimal numbers, display those numbers in binary and hexadecimal.
#----------------------------------------------------------------------------------------------------
.data
	xauBit: .asciiz "\nBinary: "
	xauHexa: .asciiz "\nHexadecimal: 0x"
	nhapSo: .asciiz "Hay nhap mot so nguyen thuoc [-2^31, 2^31 -1]: "
	loiDinhDang: .asciiz "Sai dinh dang hoac so nguyen qua lon!\nHay nhap lai!"
	loiChuaNhap: .asciiz "Ban chua nhap gi! Hay nhap lai!"
	dangHexa: .space 8
.text
main:
	# Nhap va luu so
	la	$a0, nhapSo		# Hien thi hop thoai nhap
	li 	$v0, 51
	syscall
	add 	$s6, $0, $a1		# s6 = a1 = status value
					# s6 == 0: OK
	bnez 	$s6, input_error	# status != 0 jump input_error
	add 	$t0, $a0, $0		# $t0 = so da nhap
	jal 	print_bin		# in nhi phan
	jal 	print_hexa		# in thap luc pha
	j 	main			# lap lai main cho toi khi an huy
endMain:
	li	$v0, 10			# thoat
	syscall
# =============== kiem tra dau vao ================#
input_error:
	li 	$a1, 2			# hop thoai canh bao
	li 	$v0, 55
	beq	$s6, -2, endMain	# status == -2 => thoat
	beq	$s6, -1, saiDinhDang	# status == -1 => toi error1
	beq	$s6, -3, koNhap		# status == -3 => toi error2
saiDinhDang:
	la 	$a0, loiDinhDang		# loi dinh dang
	syscall
	j 	end_error
koNhap:	
	la 	$a0, loiChuaNhap		# loi chua nhap
	syscall
	j	end_error
end_error:	
	j main	
# =================Print Binary===================== #
print_bin:
	la 	$a0, xauBit		# "Binary"
	li 	$v0, 4
	syscall
	
	addi 	$t2, $0, 1 		# $t2 = 1  
	add 	$t1, $0, $0 		# $t1 = 0                    0000 1010 0000 1011 
	sll 	$t2, $t2, 31 		# dich $t2 31 bit 0x8000     1000 0000 0000 0000 and = 0x1000
	addi 	$t3, $0, 32 		# bien dem
loop1:
	and 	$t1, $t0, $t2		# thuc hien AND so dau vao voi $t2
	beq 	$t1, $0, print1		# AND = 0 thi nhay toi print1
	addi 	$t1, $0, 1 		# AND != 0 thi gan $t1 = 1
print1: 
	move 	$a0, $t1
	li 	$v0, 1
	syscall				# in gia tri cua $t1
	srl 	$t2, $t2, 1		# dich $t2 sang phai 1 bit
	subi 	$t3, $t3, 1		# t3--
	bne 	$t3, $0, loop1		# t3 != 0 => tiep tuc
	jr 	$ra			# tro lai ham main
# ===============Print Hexa================== #	
print_hexa:
	la 	$a0, xauHexa	 	# "Hexadecimal"
	li 	$v0, 4 
	syscall
	la 	$t2, dangHexa		# store dap an
	li 	$t3, 8 			# bien dem
loop2:
	beqz 	$t3, exit 		# thoat neu dem = 0
	rol 	$t0, $t0, 4 		# chuyen 4 bit cao ve cuoi    1010 0000 1011 1000 
	and 	$t1, $t0, 0xf		# AND voi 1111
	ble 	$t1, 9, sum 		# neu <= 9 thi vao sum   => 8
	addi 	$t1, $t1, 55 		# neu > 9 thi +55 (A -> F)
	j 	end
sum: 
	addi 	$t1, $t1, 48 		# them 48 (0-> 9)   56 or  '8'
end: 
	sb 	$t1, 0($t2) 		# luu ky tu vao ket qua
	addi 	$t2, $t2, 1 		# ketqua[i+1]
	subi 	$t3, $t3, 1 		# counter--
	j 	loop2 
exit: 	
	la 	$a0, dangHexa
	li 	$v0, 4
	syscall 
	jr 	$ra
