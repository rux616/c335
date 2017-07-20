# Title: Project 1 Part I				Filename: Project 1 Part I.s
# Author: Dan Cassidy					Date: 2015-02-17
# Description: This program will take a number of integers, add
#              them up, and display the sum.
# Input: A series of integers
# Output: The sum of the integers
################# Data segment #####################
.data
inputMsg:	.asciiz		"Enter an integer: "
outputMsg:	.asciiz		"The total sum is "

################# Code segment #####################
.text
.globl	main
main:									#main program entry
		xor		$s0, $s0, $s0			#initialize sum to 0
		
loop:	li		$v0, 4					#prepare to print string
		la		$a0, inputMsg			#choose string inputMsg
		syscall							#print inputMsg
		li		$v0, 5					#prepare to read input number
		syscall							#read input number
		add		$s0, $s0, $v0			#add the input number to sum
		bne		$v0, $zero, loop		#if (input!=0) continue loop
		
		li		$v0, 4					#prepare to print string
		la		$a0, outputMsg			#choose string outputMsg
		syscall							#print outputMsg
		li		$v0, 1					#prepare to print sum
		addi	$a0, $s0, 0				#set output to sum
		syscall							#print sum
		
		li		$v0, 10					#prepare to exit program
		syscall							#exit program
		