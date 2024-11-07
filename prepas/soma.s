    .eqv PrintInt 1
    .eqv Exit 10
    .eqv bufsize 80
.data
    text: .space bufsize
.text 
   # On sait que a0 contient nombre 
   # a1 addresses
   
   mv s0, a0
   mv s1, a1
   li s2, 0 # somme 
   li s3, 0 # arg

   beqz s0, end_loop
loop_over_param : 
   
   ld a0, 0(s1)
   call atoi
   
   add s2, s2, a0
   
   addi s1, s1, 8
   addi s3, s3, 1
   bge s3, s0, end_loop 
   j loop_over_param
end_loop: 
   mv a0, s2
   li a7, PrintInt
   ecall
   
   li a7, Exit
   ecall   


# never go there plz 
atoi: 
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
