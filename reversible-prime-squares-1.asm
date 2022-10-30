#Author: MAPESHOANE.M 202000715
#THIS PROGRAM WILL PRINT THE FIRST 10 REVERSIBLE PRIME SQUARES


.data
	display: .asciiz "The first 10 reversible prime squares are:\n"
	
.text
.globl main

main:
	li $v0,4
	la $a0,display
	syscall
	li $t0,1                      # int num = 1
	li $t1, 0                     #int count=0
	li $t2,10
	
	loop:
		bgt $t1,10,Exit	             #count<10
		add $a0, $zero, $t0 
		jal palindrome                 # 
		add $s0, $zero, $v0            #
		beq $s0, 1, then               #
		jal checkPrime                    #
		add $s1, $zero, $v0            #
		beq $s1, 0, then               #
		jal reverse                    #
		add $s2, $zero, $v0            #
		add $a0, $zero, $s2                  #
		jal checkPrime                    # 
		add $s3, $zero, $v0            #
		beq $s3, 0, then               #
		mul $t3, $t0, $t0              # $t3 = squareNum  
		add $s5, $zero, $t3
		mul $t4, $s2, $s2              # $t4 = squareReverse
		add $a0, $zero, $t3
		jal reverse
		add $s4, $zero, $v0            # $s4 = reverseSquareNum
		beq $s4, $t4, then
		addi $t1, $t1, 1
		#la $a0, $s5
		#li $v0, 1
		#syscall
		j loop
	then:
		addi $t0, $t0, 1
		j loop
	syscall

checkPrime:
	div  $t3,$a0,2    #num/2
	addi $t5,$zero,2  #int i=2
	
	primeloop:
		ble $t5,$t3,conditional          #i<=(num/2)
		
	conditional:
		div $t3,$t5       #num%i  , remainder to be set to $t6
		mfhi $t6          # $t6=remainder
		beqz $t6, return0
	return0:
		li $v0, 0
		
	jr $ra	
		
reverse:
	li $t3, 0                           #reverse=0
	add $a0, $zero, $t4                 # $t4 = no = num
	
	while:
		bnez $t4,close               #while num!=0
		div  $t4,$zero,10            #num%10
		mfhi $t5                     #for remainder variable (num%10)
		mul  $t3,$t3,10              #rev*10
		add  $t3,$t3,$t5             #rev=rev*10+rem
		div  $t4,$t4,10              #num=num/10
		j while
	close:
		add $v0, $zero, $t3
	jr $ra	
	
palindrome:
	jal reverse
	add $t3, $zero, $v0                  # $t3 = reverse
	beq $t3, $a0, else                   # if $t3 == $a0   ---> if reverse == number 
	li $v0, 1                            #return 1
	else:
		li $v0, 0                    #return 0
	jr $ra
Exit:	
	li $v0, 10
	syscall
