.include "macros.s"
# DATA segment
.data
num: .word 0
odd_bit: .word 0xAAAAAAAA
even_bit: .word 0x55555555
# TEXT segment
.text
.globl main

# Main function
main:
  read_int(num)
  lw $t0, num
  
  li $v0, 35
  move $a0, $t0
  syscall
  print_str("\n")
  
  lw $t7, odd_bit
  and $t1, $t0, $t7
  lw $t7, even_bit
  and $t2, $t0, $t7

  srl $t1, $t1, 1
  sll $t2, $t2, 1
  or $t0, $t1, $t2

  li $v0, 35
  move $a0, $t0
  syscall
  
exit:
  li $v0, 10
  syscall
