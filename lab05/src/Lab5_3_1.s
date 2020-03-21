.include "Lab5_3_2.s"

# DATA segment
.data

# TEXT segment
.text
.globl main

# Main function
main:
  print_str("input the count of nums: ")
  read_int($s0)
  sll $s1, $s0, 2
  sbrk($s1, $s2)
  
  print_str("input the int array\n")
  .macro read_input_body()
    read_int($t2)
    sw $t2, ($t1)
    add $t1, $t1, 4
  .end_macro 
  move $t1, $s2
  fori($t0, 1, $s0, read_input_body)
  
  .macro sort_outer()
    move $t4, $t1 # t4 min pos
    lw $t5,($t4)  # t5 min value
    lw $t7,($t4)  # it val
    
    move $t3, $t1 # t3 itor inner
    move $t2, $t0
    
      sort_inner:
      bgt $t2, $s0, end_loop
      lw $t6, ($t3) # t6 now val
      bge $t6, $t5, sort_inner_continue
      move $t5, $t6
      move $t4, $t3
      sort_inner_continue:
      add $t3, $t3, 4
      add $t2, $t2, 1
      j sort_inner
      
      end_loop:
      nop
    
    sw $t5, ($t1)
    sw $t7, ($t4)
    
    add $t1, $t1, 4
  .end_macro 
  move $t1, $s2
  fori($t0, 1, $s0, sort_outer)
  
  move $a0, $s0
  move $a1, $s2

  jal print_int_array

exit:
  li $v0, 10
  syscall
