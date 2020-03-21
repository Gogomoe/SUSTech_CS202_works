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

  loop:
  beq $s0, 0, end_loop
  div $s0, $s2
  mfhi $s1
  mflo $s0
  print_int($s1)
  j loop
  end_loop:
  li $v0, 10
  syscall
