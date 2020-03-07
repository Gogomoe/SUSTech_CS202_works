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

  rol $t1, $t0, 1
  and $t1, $t1, 1

  beqz $t1, end_branch
  xori $t0, 0xFFFFFFFF
  addi $t0, $t0, 1

end_branch:

  li $v0, 1
  move $a0, $t0
  syscall
  
exit:
  li $v0, 10
  syscall
