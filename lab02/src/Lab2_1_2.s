# DATA segment
.data
h1: .word 1
w1: .word 20
s: .word 220
r: .word 240

please_input: .asciiz "please input h1 w1 s r, split number by new line \n"
takes: .asciiz "takes "
hours_and: .asciiz " hours and "
minutes: .asciiz " minutes\n"

# TEXT segment
.text
.globl main

# Main function
main:
  li $v0, 4
  la $a0, please_input
  syscall

  # read date
  li $v0, 5
  syscall
  sw $v0, h1
  li $v0, 5
  syscall
  sw $v0, w1
  li $v0, 5
  syscall
  sw $v0, s
  li $v0, 5
  syscall
  sw $v0, r

  # h1 * 60 -> t0
  lw $t1, h1
  li $t2, 60
  mult $t1, $t2
  mflo $t0

  # t0 + w1 -> $t0
  lw $t1, w1
  add $t0, $t0, $t1

  # s * 60 -> t3
  lw $t1, s
  li $t2, 60
  mult $t1, $t2
  mflo $t3

  # t0 += t3 / r
  lw $t4, r
  div $t3, $t4
  mflo $t1
  add $t0, $t0, $t1

  # t2 = t0 / 60, t3 = t0 % 60
  li $t1 60
  div $t0, $t1
  mflo $t2
  mfhi $t3

  # print
  li $v0, 4
  la $a0, takes
  syscall
  li $v0, 1
  move $a0, $t2
  syscall
  li $v0, 4
  la $a0, hours_and
  syscall
  li $v0, 1
  move $a0, $t3
  syscall
  li $v0, 4
  la $a0, minutes
  syscall

  li $v0, 10
  syscall


