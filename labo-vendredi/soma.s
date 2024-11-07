	.eqv PrintInt 1
	.eqv PrintChar 11
	.eqv Exit 10 
.data 
test1:	.string "123" # atoi doit donner 123
test2:	.string "toto" # atoi doit donner 0
test3:	.string "42toto"  # atoi doit donner 42

.text
	mv s0, a0 
	mv s1, a1 
	li s2, 0 # resultat / somme 
loop: 
	beqz s0, end_loop
	ld a0, 0(s1) 
	call atoi 
	
	add s2, s2, a0 
	
	addi s1, s1, 8 
	addi s0, s0, -1 
	j loop 
end_loop:
	
	li a7, PrintInt
	mv a0, s2 
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



	