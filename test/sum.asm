.text
	#����1+2+.....+100 ����ʾ�м���
	li $t0, 101  #n
	li $t1, 1  #i
	li $t2, 0  #sum
	
	loop:
		# $t2 <- $t1 + $t2
		move $a0, $t1
		move $a1, $t2
		jal sum
		move $t2, $v0
		
		li $v0, 34
		move $a0, $t2
		syscall
		
		add $t1, $t1, 1
		bne $t0, $t1, loop
	
	li $v0, 10
	syscall
	

	sum:
		add $v0, $a0, $a1
		jr $ra