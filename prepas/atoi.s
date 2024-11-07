    .eqv PrintInt 1
    .eqv Exit 10
.data
    test1:	.string "123"  
    test2:	.string "toto" 
    test3:	.string "42toto"
.text 
    li a7, PrintInt

    la a0, test1
    call atoi 
    ecall 

    la a0, test2 
    call atoi 
    ecall

    la a0, test3 
    call atoi 
    ecall

    li a7, Exit 
    ecall
    
    
    
###################################################################3
## Routines :D 

atoi: 
     # a0 -> adresse du string
     addi sp, sp, -4 
     sw s0, 0(sp) 
     li s0, 0 
     li t0, 0

     li t1, '0'
     li t2, '9'
     li t4, 10 

read:
    
     lbu t3, 0(a0)
     blt t3, t1, end 
     bgt t3, t2, end 
     beqz t3, end 

     mul t0, t0, t4
     addi t3, t3, -48
     add t0, t0, t3
     addi a0, a0, 1

     j read
end:

     lw s0, 0(sp)
     mv a0, t0 
     ret 
