.data

# initialize array X
X: .word 5, 4, 8, 12, 13, 16, 18, 20, 24, 23, 0

# messages
message1: .asciiz "The number of values that are divisible by 4 = "
message2: .asciiz "The number of ones in the binary number = "
return: .asciiz "\n"

.text
.globl main

#main function
main:	
  la $s0, X
  li $s1, 11
  li $s2, -1
  li $t6, 0
  li $a3, 3
  li $a2, 1
  b skip

#loop function
loop:
  # load array element into t2
  lw $t2, 0($s0)
  # increment
  add $s0, $s0, 4
  # AND the element with 3, then save result
  and $t0, $t2, $a3
  # boolean
  bnez $t0, skip
  # increment
  addi $s2, $s2, 1

skip:
  #loop again
  addi $s1, $s1, -1
  bgez $s1, loop

print1:
  move $t4, $s2

  # print message 
  addi $v0, $0, 4
  la $a0, message1
  syscall

  # printing results
  addi $v0, $0, 1
  add $a0, $s2, $0
  syscall

  # new space
  addi $v0, $0, 4
  la $a0, return
  syscall

loop2:
  #second loop
  andi $t1, $t4, 1
  add $t6, $t6, $t1
  srl $t4, $t4, 1
  bne $t4, $zero, loop2

print2:
  move $s3, $t6	

  # print message
  addi $v0, $0, 4
  la $a0, message2
  syscall

  # print results
  addi $v0, $0, 1
  add $a0, $s3, $0
  syscall

  # new space
  addi $v0, $0, 4
  la $a0, return
  syscall

# end
jr $ra
.end main
