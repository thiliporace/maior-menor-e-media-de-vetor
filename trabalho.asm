# Thiago Leandro Liporace - 42128481
# Kenny Jun Takahashi - 42146143
# Lucas Goulart de Farias Meres - 42127459

.data
max: .asciiz "\nMaior elemento: "
min: .asciiz "\nMenor elemento: "
resp: .asciiz "\nMedia dos elementos: "
vetor: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
size: .word 15

.text
main:   la $a0, vetor
    	lw $a1, size
    	
    	li $t2, 0
    	li $t3, 100
    	
    	jal leVetor
    	li $v0, 10  
    	syscall 
    	
    	
leVetor:
    li $t0, 0
    li $t1, 0
    
loop:    bge $t0, $a1, final 	
    lw $a0, vetor($t1) 		
    
    blt $a0, $t3, novo_min	
    j max_check
    novo_min: move $t3, $a0		
    j att_cont
    
    max_check:
    bgt $a0, $t2, novo_max	
    j att_cont
    
    novo_max: move $t2, $a0		
    
    att_cont:
    addi $t1, $t1, 4    	
    addi $t0, $t0, 1    	
    b loop       		
final:  
        la $a0, max   	
    	li $v0, 4       	               
    	syscall
    	
	li $v0, 1		
	move $a0, $t2		
	syscall			

	la $a0, min   	
    	li $v0, 4       	              
    	syscall
	
	li $v0, 1		
	move $a0, $t3		
	syscall			
	
	la $a0, resp   	
    	li $v0, 4       	               
    	syscall

	add $t4, $t2, $t3	
	div $t5, $t4, 2		
	li $v0, 1		
	move $a0, $t5		
	syscall
    	jr $ra      		

	
