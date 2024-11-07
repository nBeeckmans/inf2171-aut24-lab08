	.eqv PrintInt 1
	.eqv PrintChar 11
	.eqv Exit 10 
.data 
test1:	.string "123" # atoi doit donner 123
test2:	.string "toto" # atoi doit donner 0
test3:	.string "42toto"  # atoi doit donner 42

.text
	
	
	la a0, test1
	call atoi 
	
	li a7, PrintInt
	ecall 
	
	li a7, PrintChar
	li a0, '\n'
	ecall
	
	la a0, test2
	call atoi 
	
	li a7, PrintInt
	ecall 
	
	li a7, PrintChar
	li a0, '\n'
	ecall
	
	la a0, test3
	call atoi 
	
	li a7, PrintInt
	ecall 
	
	li a7, Exit
	ecall
			


#####################################################################################				
atoi : 	
	# a0, addresse de la chaine 
	addi sp, sp, -8
	sd s0, 0(sp)
	li s0, 0 
	li t0, '0'
	li t1, '9'
	li t3, 10 
	
loop_atoi: 
	lbu t2, 0(a0)
	beqz t2, end_loop_atoi
	blt t2, t0, end_loop_atoi
	bgt t2, t1, end_loop_atoi
	
	sub t2, t2, t0
	mul s0, s0, t3
	add s0, s0, t2
	
	addi a0, a0, 1 
	
	j loop_atoi 

end_loop_atoi:
	mv a0, s0 
	ld s0, 0(sp)
	addi sp, sp, 8 
	ret 



	