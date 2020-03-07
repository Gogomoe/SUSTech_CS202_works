.include "macros.s"
# DATA segment
.data
num: .word 0
# TEXT segment
.text
.globl main

# Main function
main:
  read_int(num)
  lw $t0, num

  sll $t1, $t0, 3

  add $t2, $t1, $t0
  add $t2, $t2, $t0

  li $v0, 1
  move $a0, $t2
  syscall
  
exit:
  li $v0, 10
  syscall
