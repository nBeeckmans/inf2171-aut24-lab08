	.eqv PrintInt 1
	.eqv PrintChar 11
	.eqv Exit 10 
	.eqv PrintString 4
	.eqv ReadInt 5
.data 
debut :   .string "Deplacer le disque de "
milieux : .string " vers "
fin :	  .string " .\n"
.text
	
	li a7, ReadInt
	ecall

	li a1, 1 
	li a2, 3
	li a3, 2
		
	call hanoi
		
	li a7, Exit
	ecall 

#####################################################################################				
hanoi : 	
	addi sp, sp, -40
	sd s0, 0(sp)
	sd s1, 8(sp)
	sd s2, 16(sp)
	sd s3, 24(sp)
	sd ra, 32(sp)
	mv s0, a0 
	mv s1, a1
	mv s2, a2 
	mv s3, a3 
	blez s0, fin_hanoi
	addi s0, s0, -1 
	
	mv a0, s0 
	mv a1, s1
	mv a2, s3 
	mv a3, s2 
	
	call hanoi 
	
	# logique du printf 
	
	li a7, PrintString 
	la a0, debut 
	ecall 
	
	li a7, PrintInt
	mv a0, s1 
	ecall  
	
	li a7, PrintString 
	la a0, milieux  
	ecall 
	
	li a7, PrintInt
	mv a0, s2  
	ecall 
	
	li a7, PrintString 
	la a0, fin   
	ecall  	
	
	mv a0, s0 
	mv a1, s3
	mv a2, s2 
	mv a3, s1 
	
	call hanoi 

fin_hanoi : 
	ld s0, 0(sp)
	ld s1, 8(sp)
	ld s2, 16(sp)
	ld s3, 24(sp)
	ld ra, 32(sp)
	addi sp, sp, 40

	
		
	ret 



	