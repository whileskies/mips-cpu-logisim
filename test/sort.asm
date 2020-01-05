.data
	

.text
	li $s0, 0 # data addr
	li $s1, 0 # offset
	li $s2, 50 # $s2 : n
	li $sp, 4092
	nloop:
		beq $s2, $zero, exitnloop
		add $t0, $s0, $s1
		
		sw $s2, 0($t0)
		
		add $s1, $s1, 4
		add $s2, $s2, -1
		j nloop
	exitnloop:
		
		li $a0, 0
		li $a1, 50 #排序个数
		jal sort
	
		li $v0, 10
		syscall
		
	


	#void swap(int v[], int k) {
	#	int temp = v[k];
	#	v[k] = v[k+1];
	#	v[k+1] = temp;
	#}
	swap:
		sll $t1, $a1, 2
		add $t1, $t1, $a0 #$t1:v[k]
		
		lw $t0, 0($t1) #$t0:temp
		lw $t2, 4($t1) #$t2:v[k+1]
		
		sw $t2, 0($t1)
		sw $t0, 4($t1)
		
		jr $ra
		
	sort:
		#保存寄存器值
		addi $sp, $sp, -20
		sw $ra, 16($sp)
		sw $s3, 12($sp)
		sw $s2, 8($sp)
		sw $s1, 4($sp)
		sw $s0, 0($sp)
		
		#移动参数
		move $s2, $a0 # $s2 : $a0
		move $s3, $a1 # $s3 : $a1
		
		move $s0, $zero # $s0 : i
	for1tst:
		slt $t0, $s0, $s3
		beq $t0, $zero, exit1
		
		addi $s1, $s0, -1 # $s1 : j
	for2tst:
		slti $t0, $s1, 0
		bne $t0, $zero, exit2
		
		sll $t1, $s1, 2
		add $t2, $s2, $t1 # $t0 : v[j] addr 
		lw $t3, 0($t2) # $t1 : v[j]
		lw $t4, 4($t2) # $t2 : v[j+1]
		
		slt $t0, $t4, $t3
		beq $t0, $zero, exit2
		
		move $a0, $s2
		move $a1, $s1
		jal swap
		
		addi $s1, $s1, -1
		j for2tst
		
	exit2:
		addi $s0, $s0, 1
		j for1tst
		
	exit1:
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $ra, 16($sp)
		addi $sp, $sp, 20
		
		jr $ra
		
		
		
		
		
		
		
		
