
.data

vetor: .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
size: .word   15
min:  .asciiz "\nElemento Minimo: " 
max:  .asciiz "\nElemento Maximo: "
result: .asciiz "\nSoma:"

.text

main:   
    la $a0, vetor
    lw $a1, size
    lw $t2, ($a0) # max
    lw $t3, ($a0) # min
    lw $t4, ($a0)
    li $t0,0
    loop_array:
        beq $a1, $zero, resp
        lw $t0, ($a0)
        bge $t0, $t3, not_min 
        move $t3, $t0
        not_min:
        ble $t0, $t2, not_max 
        move $t2, $t0
        not_max:
        addi $a1, $a1, -1
        addi $a0, $a0, 4
        j loop_array
     loop:
        beq $a1, $zero,resp
        lw $s1,0($a0)
        add $t0, $t0, $s1
        add $t4,4
        subi $a1,$a1,1
        j loop
        
    resp:
    li $v0,4
    la $a0,result
    syscall
    
    li $v0,1
    move $t4,$t0
    syscall
    
    # print minimum
    li $v0, 4
    la $a0, max
    syscall

    li $v0, 1
    move $a0, $t2
    syscall 

    # print maximum
    li $v0, 4
    la $a0, min
    syscall

    li $v0, 1
    move $a0, $t3
    syscall 

    # exit
    li $v0, 10
    syscall
	
