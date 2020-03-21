.include "macros.s"

# DATA segment
.data

# TEXT segment
.text
.globl main

# Main function
main:
  print_str("input a integer: ")
  read_int($s0)
  
  li $s2, 10
  move $a0, $s0
  jal print_reverse

  li $v0, 10
  syscall

print_reverse:
  beq $a0, 0, return
  div $a0, $s2
  mflo $t1
  mfhi $t0
  print_int($t0)
  move $a0, $t1
  add $sp, $sp, -4
  sw $ra, ($sp)
  jal print_reverse
  lw $ra, ($sp)
  add $sp, $sp, 4
  return:
  jr $ra

