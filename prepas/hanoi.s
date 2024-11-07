	.eqv PrintInt 1
	.eqv PrintString 4
	.eqv ReadInt 5
	.eqv Exit 10
.data 
start : .string "Deplacer le disque de "
middle : .string " vers "
end :	.string " .\n"
.text 
	
	li a7, ReadInt
	ecall
	
	li a1, 1 
	li a2, 3
	li a3, 2
	
	call hanoi

	li a7, Exit
	ecall
	 
hanoi : 
	addi sp, sp, -40
	sd a0, 0(sp)
	sd a1, 8(sp)
	sd a2, 16(sp)
	sd a3, 24(sp)
	sd ra, 32(sp)
	blez a0, end_hanoi
	addi a0, a0, -1
	ld a2, 24(sp)
	ld a3, 16(sp) 
	call hanoi 
	
	li a7, PrintString
	la a0, start
	ecall 
	
	li a7, PrintInt
	ld a0, 8(sp)  
	ecall 
	
	li a7, PrintString
	la a0, middle 
	ecall 
	
	li a7,PrintInt
	ld a0, 16(sp)
	ecall 
	
	li a7, PrintString 
	la a0, end
	ecall 
	
	ld a0, 0(sp)
	addi a0, a0, -1
	ld a1, 24(sp)
	ld a2, 16(sp)
	ld a3, 8(sp)
	
	call hanoi
end_hanoi:
	ld a0,0(sp)
	ld a1,8(sp)
	ld a2,16(sp)
	ld a3,24(sp)
	ld ra, 32(sp)
	addi sp, sp, 40
	ret  
