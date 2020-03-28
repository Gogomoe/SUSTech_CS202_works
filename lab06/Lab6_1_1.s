# Include
  .text
  .include "macros.s"

# Exception handler
  .ktext 0x80000180
  lw $t0, error_type

  li $v0, 4
  la $a0, exception_at
  syscall

  li $v0, 36
  mfc0 $a0, $14
  syscall

  li $v0, 4
  la $a0, newline
  syscall

  beq $t0, 1001, input_error
  la $a0, addition_error_msg
  beq $t0, 1002, calc_error
  la $a0, subduction_error_msg
  beq $t0, 1003, calc_error
  la $a0, multiplication_error_msg
  beq $t0, 1004, calc_error
  la $a0, division_error_msg
  beq $t0, 1005, calc_error

  li $v0, 4
  la $a0, uncatched_error_msg
  syscall

  la $v0, exit
  jr $v0

input_error:
  li $v0, 4
  la $a0, input_error_msg
  syscall
  la $v0, read_num
  jr $v0

calc_error:
  li $v0, 4
  syscall
  la $v0, exit
  jr $v0

# Exception data
  .kdata
exception_at: .asciiz "Runtime exception at 0x_"
uncatched_error_msg: .asciiz "Trap generated\n"
input_error_msg: .asciiz "input error\n"
addition_error_msg: .asciiz "addition overflow\n"
subduction_error_msg: .asciiz "subduction overflow\n"
multiplication_error_msg: .asciiz "multiplication overflow\n"
division_error_msg: .asciiz "divisor is zero\n"
error_type: .word 0

# DATA segment
  .data
operator: .word 0
newline: .asciiz "\n"

# TEXT segment
  .text
  .globl main

main:
  add $sp, $sp, -12

  jal read_num
  sw $v0, 0($sp)

  jal read_oper
  sw $v0, 4($sp)

  jal read_num
  sw $v0, 8($sp)

  lw $a0, 0($sp)
  lw $a1, 4($sp)
  lw $a2, 8($sp)

  jal calc
  move $s3, $v0

  lw $s0, 0($sp)
  lw $s2, 8($sp)

  print_int($s0)
  li $v0, 11
  lw $a0, 4($sp)
  syscall
  print_int($s2)
  print_str("=")
  li $v0, 36
  move $a0, $s3
  syscall

exit:
  li $v0, 10
  syscall

read_num:
  li $v0, 1001 # input error
  sw $v0, error_type
  print_str("please input a int: ")
  li $v0, 5
  syscall
  tlti $v0, 0
  jr $ra

read_oper:
  print_str("please input a operator: ")
  li $v0, 8
  la $a0, operator
  li $a1, 4
  syscall
  lb $v0, operator
  jr $ra

calc:
  beq $a1, 43, plus
  beq $a1, 45, minus
  beq $a1, 42, times
  beq $a1, 47, divs
calc_return:
  move $v0, $s0
  jr $ra
plus:
  addu $s0, $a0, $a2
  swi(error_type, 1002) # plus overflow
  tlti $s0, 0
  j calc_return
minus:
  subu $s0, $a0, $a2
  swi(error_type, 1003) # minus overflow
  tlti $s0, 0
  j calc_return
times:
  mul $s0, $a0, $a2
  swi(error_type, 1004) # times overflow
  mfhi $t0
  tnei $t0, 0
  j calc_return
divs:
  swi(error_type, 1005) # div zero
  teqi $a2, 0
  div $s0, $a0, $a2
  j calc_return
  
