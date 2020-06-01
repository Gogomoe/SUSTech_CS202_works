.data 0x0000

.text 0x0000
main:
  ori $s3, $zero, 1
  sll $s3, $s3, 31
  sra $s3, $s3, 31
  lw $s0, 0($s3)
  srl $s0, $s0, 20
  ori $t3, $zero, 0
  beq $s0, $t3, flash
  ori $t3, $zero, 4
  beq $s0, $t3, flash
  ori $t3, $zero, 1
  beq $s0, $t3, assign
  ori $t3, $zero, 2
  beq $s0, $t3, plus
  ori $t3, $zero, 3
  beq $s0, $t3, minus
  ori $t3, $zero, 5
  beq $s0, $t3, shift_left
  ori $t3, $zero, 6
  beq $s0, $t3, shift_right_a
  ori $t3, $zero, 7
  beq $s0, $t3, shift_right
  j main
flash:addi $s1, $s1, 1
  andi $t1, $s1, 1
  ori $t3, $zero, 1
  beq $t1, $t3, flash_odd
  j flash_even
flash_odd:ori $t2, $zero, 0xAAAA
  sll $t2, $t2, 8
  ori $t2, $t2, 0xAA
  sw $t2, 0($s3)
  j main
flash_even:ori $t2, $zero, 0x5555
  sll $t2, $t2, 16
  ori $t2, $t2, 0x5555
  sw $t2, 0($s3)
  j main
assign:lw $t1, 0($s3)
  sll $t1, $t1, 16
  srl $t1, $t1, 16
  ori $s2, $t1, 0
  sw $s2, 0($s3)
  j main
plus:addi $s2, $s2, 1
  sw $s2, 0($s3)
  j main
minus:addi $s2, $s2, -1
  sw $s2, 0($s3)
  j main
shift_left:sll $s2, $s2, 1
  sw $s2, 0($s3)
  j main
shift_right_a:sra $s2, $s2, 1
  sw $s2, 0($s3)
  j main
shift_right:srl $s2, $s2, 1
  sw $s2, 0($s3)
  j main
