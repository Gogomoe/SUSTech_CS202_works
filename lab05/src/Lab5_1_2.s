.include "macros.s"

.text
.globl print_num_times_num
print_num_times_num:
  mul $t0, $s0, $s1
  print_int($s0)
  print_str("*")
  print_int($s1)
  print_str("=")
  print_int($t0)
  print_str(" ")
  jr $ra