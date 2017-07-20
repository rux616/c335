# Title: HW4 Bonus						Filename: HW4 Bonus.s
# Author: Dan Cassidy					Date: 2015-03-05
# Description: Performs a bubble sort on the hard coded data
# Input: Nothing
# Output: 
################# Data segment #####################
.data
size:	.word		5
array:	.word		1, 5, 3, 2, 4

################# Code segment #####################
.text
.globl	main
main:									#main program entry
		la		$s0, size				#load
		lw		$s0, 0($s0)
		la		$s3, array

		addi	$s1, $zero, 0			#initialize i to 0
		addi	$t0, $s0, -1			#temporarily store n-1
loopO:	slt		$t9, $s1, $s0			#set if (i<n-1)
		beq		$t9, $zero, endO		#if (i>=n-1), jump to endO
			addi	$s2, $zero, 0			#initialize j to 0
			sub		$t1, $t0, $s1			#$t1=(n-1)[$t1]-i[$s0]
loopI:		slt		$t9, $s2, $t1			#set if (j<n-1-i)
			beq		$t9, $zero, endI		#if (j>n-1-i), jump to endI
				sll		$t2, $s2, 2				#$t2=j*4 (word count of j)
				add		$t2, $t2, $s3			#$t2=address(array[j])
				lw		$t3, 0($t2)				#$t3=array[j]
				lw		$t4, 4($t2)				#$t4=array[j+1]
				slt		$t9, $t4, $t3			#set if (array[j+1]<array[j])
				beq		$t9, $zero, skip			#if (array[j]<array[j+1]), jump to skip
					sw		$t3, 4($t2)				#array[j+1]=array[j]
					sw		$t4, 0($t2)				#array[j]=original(array[j+1])
skip:			addi	$s2, $s2, 1				#increment j by 1
				j		loopI					#jump to loopI
endI:		addi	$s1, $s1, 1				#increment i by 1
			j		loopO					#jump to loopO
endO:	li		$v0, 10						#prepare to exit program
		syscall								#exit program
