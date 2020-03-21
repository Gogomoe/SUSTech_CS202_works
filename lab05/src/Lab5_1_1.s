.include "Lab5_1_2.s"

# DATA segment
.data

# TEXT segment
.text
.globl main

# Main function
main:
  li $s0, 1

outer:
  bgt $s0, 9, outer_end
  
  li $s1, 1
  inner:
    bgt  $s1, $s0, inner_end

    jal print_num_times_num
    add $s1, $s1, 1

    j inner
  inner_end:

  print_str("\n")
  add $s0, $s0, 1

  j outer

outer_end:
exit:
  li $v0, 10
  syscall
