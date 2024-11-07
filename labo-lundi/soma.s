	.eqv PrintInt 1
	.eqv Exit 10
.text 
	li s0, 0
	mv s1, a0
	mv s2, a1
loop_args:
	beqz s1, end_loop_args
	ld a0, 0(s2)
	call atoi 
	add s0, s0, a0
	
	addi s1, s1, -1 
	addi s2, s2, 8
	j loop_args 
end_loop_args: 
	
	mv a0, s0
	li a7, PrintInt
	ecall
	
	li a7, Exit
	ecall
	
atoi:
	# entree : a0 == adresse vers un string 
	# sortie : a0 == int 
	addi sp, sp, -8
	sd s0, 0 (sp)
	li s0, 0
	
loop_atoi: 
	lbu t0, 0(a0)
	
	li t1, '0'
	li t2, '9'
	bgt t0, t2, end_loop_atoi
	blt t0, t1, end_loop_atoi
	
	sub t0, t0, t1
	
	li t3, 10
	mul s0, s0, t3
	add s0, s0, t0 
	
	addi a0, a0, 1 
	j loop_atoi
end_loop_atoi:
	mv a0, s0
	ld s0, 0(sp)
	addi sp, sp, 8
	ret 
