
.text
	li $s0, 0
	li $s1, 10
	addi $sp, $zero, 128
	
	loop:
		move $a0, $s0
		jal fib
		
		move $a0, $v0
		li $v0, 34
		syscall
		
		add $s0, $s0, 1
		bne $s0, $s1, loop

	li $v0, 10
	syscall

	fib:
		addi $sp, $sp, -12
		sw $ra, 8($sp)
		sw $s0, 4($sp)
		sw $s1, 0($sp) # $s1 : ret
		add $s0, $a0, $zero # $s0: $a0 : n
		
		bne $s0, $zero, elseif
		addi $v0, $zero, 0
		j return
				
	elseif:
		addi $t0, $zero, 1
		bne $s0, $t0, else
		
		addi $v0, $zero, 1
		j return
		
	else:
		addi $a0, $s0, -1
		jal fib
		add $s1, $v0, $zero
		
		addi $a0, $s0, -2
		jal fib
		add $s1, $s1, $v0
		
		add $v0, $s1, $zero
		j return
		
	return:
		lw $s1, 0($sp)
		lw $s0, 4($sp)
		lw $ra, 8($sp)
		addi $sp, $sp, 12
		jr $ra
	
		
		
		
		
