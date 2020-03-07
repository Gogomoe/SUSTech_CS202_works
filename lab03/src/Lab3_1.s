.include "macros.s"

# DATA segment
.data

num: .word 0
num2: .word 0

# TEXT segment
.text
.globl main

# Main function
main:
  read_int(num)
  
  lw $t0, num
  la $t1, num2
  sb $t0, 3($t1)
  srl $t0, $t0, 8
  sb $t0, 2($t1)
  srl $t0, $t0, 8
  sb $t0, 1($t1)
  srl $t0, $t0, 8
  sb $t0, 0($t1)
  
  li $v0, 34
  lw $a0, num
  syscall 
  print_str("\n")
  li $v0, 34
  lw $a0, num2
  syscall 

exit:
  li $v0, 10
  syscall

print_char:
  
