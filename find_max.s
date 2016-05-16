#PURPOSE:  Finding maximum element in array.
#

#INPUT:    none
#

#OUTPUT:   returns a status code.  This can be viewed
#          by typing
#
#          echo $?
#
#          after running the program
#

#VARIABLES: The registers have the following uses:
#		%edi - holds current examined element index
#          	%ebx - holds current maximum element
#          	%eax - holds current examined element value
#

.section .data

data_array:
	.long 30,56,3,2,100,23,45,75,2,9,0	# last element is 0 just to mark the end of array.

.section .text

.globl _start

_start:
	movl $0, %edi				# starts with index 0.
	movl data_array(,%edi,4), %eax		# load first element to register %eax
	movl %eax, %ebx				# first element is also current max element, so write it to register %ebx

start_loop:
	cmpl $0, %eax				# check if we hit the end of array (last element is 0 as mentioned above)
	je exit_loop				# je - jump is equals - Exit program if last element hit.
	incl %edi				# incl - increment value
	movl data_array(,%edi,4), %eax		# move array element to %eax
	cmpl %ebx, %eax				# compare value in registers
	jle start_loop				# if %eax <= %ebx then jump new to iteration
	
	movl %eax, %ebx				# else copy %eax to %ebx because it's new biggest value
	jmp start_loop				# start new iteration

exit_loop:
	movl $1, %eax				# 1 is exit system call.
	int $0x80
