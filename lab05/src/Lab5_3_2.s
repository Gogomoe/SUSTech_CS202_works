.include "macros.s"

.text
.globl print_int_array
print_int_array:
  move $t0, $a0
  move $t1, $a1

  .macro output_body()
    lw $t2,($t1)
    print_int($t2)
    print_str(" ")
    add $t1, $t1, 4
  .end_macro

  fori($t8, 1, $t0, output_body)

  jr $ra
