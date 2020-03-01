# DATA segment
.data
abc: .asciiz "abc"
next: .word 0
# TEXT segment
.text
.globl main

# Main function
main:
    la $t0, abc
    la $t9, next

    lb $t1, 0($t0)
    sb $t1, 0($t9)
    subi $t1, $t1, 32
    sb $t1, 1($t9)

    lb $t1, 1($t0)
    sb $t1, 2($t9)
    subi $t1, $t1, 32
    sb $t1, 3($t9)

    lb $t1, 2($t0)
    sb $t1, 4($t9)
    subi $t1, $t1, 32
    sb $t1, 5($t9)

    li $t1, 0x20
    sb $t1, 6($t9)

    li $v0, 4
    la $a0, next
    syscall

    li $v0, 10
    syscall