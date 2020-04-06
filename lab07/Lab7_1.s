# Include
  .text
  .include "macros.s"

# DATA segment
  .data
start_val: .double 0.000001
two_val:  .double 2.0
# TEXT segment
  .text
  .globl main

main:
  print_str("input a double: ")
  li $v0, 7
  syscall

  mov.d $f2, $f0
  l.d $f4, start_val
  mov.d $f6, $f0

  .macro body()
    add.d $f8, $f4, $f6
    l.d $f10, two_val
    div.d $f8, $f8, $f10
    mul.d $f10, $f8, $f8
    c.lt.d $f10, $f2

    li $t1, 1
    movt $t1, $0
    bne $t1, 0, else

    mov.d $f4, $f8
    j end_if

  else:
    mov.d $f6, $f8

  end_if:
    nop
  .end_macro

  fori($t0, 1, 10000, body)

  li $v0, 3
  mov.d $f12, $f8
  syscall

exit:
  li $v0, 10
  syscall
