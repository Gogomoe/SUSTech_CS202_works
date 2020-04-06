# Include
  .text
  .include "macros.s"

# DATA segment
  .data
scores: .space 120 # 0, 40, 80
zero_val: .double 0.0
three_val: .double 3.0
five_val: .double 5.0
fifteen_val: .double 15.0
all_score: .space 40

# TEXT segment
  .text

  .globl main

main:
  .macro inner_read()
    print_str("input score of student ")
    print_int($t0)
    print_str(" for question ")
    print_int($t1)
    print_str(": ")
    move $t2, $t0
    add $t2, $t2, -1
    mul $t2, $t2, 5
    add $t2, $t2, $t1
    add $t2, $t2, -1

    mul $t2, $t2, 8
    la $t3, scores
    add $t2, $t2, $t3

    li $v0, 7
    syscall
    s.d $f0, 0($t2)
  .end_macro

  .macro outer_read()
    fori1($t1, 1, 5, inner_read)
  .end_macro
 
  fori($t0, 1, 3, outer_read)
  
  # total score for every student
  
  .macro inner_total_score()
    move $t2, $t0
    add $t2, $t2, -1
    mul $t2, $t2, 5
    add $t2, $t2, $t1
    add $t2, $t2, -1

    mul $t2, $t2, 8
    la $t3, scores
    add $t2, $t2, $t3
    
    l.d $f4, 0($t2)
    add.d $f2, $f2, $f4
  .end_macro 
  
  .macro outer_total_score()
    l.d $f2, zero_val
    fori1($t1, 1, 5, inner_total_score)
    print_str("total score of student ")
    print_int($t0)
    print_str(" is ")
    li $v0, 3
    mov.d $f12, $f2
    syscall
    print_str("\n")
  .end_macro
 
  fori($t0, 1, 3, outer_total_score)
  
  # average score
  
    .macro inner_average_score()
    move $t2, $t1
    add $t2, $t2, -1
    mul $t2, $t2, 5
    add $t2, $t2, $t0
    add $t2, $t2, -1

    mul $t2, $t2, 8
    la $t3, scores
    add $t2, $t2, $t3
    
    l.d $f4, 0($t2)
    add.d $f2, $f2, $f4
  .end_macro 
  
  .macro outer_average_score()
    l.d $f2, zero_val
    fori1($t1, 1, 3, inner_average_score)
    l.d $f4, three_val
    div.d $f4, $f2, $f4
    print_str("average score of question ")
    print_int($t0)
    print_str(" is ")
    li $v0, 3
    mov.d $f12, $f4
    syscall
    print_str("\n")
    
    move $t4, $t0
    add $t4, $t4, -1
    mul $t4, $t4, 8
    la $t5, all_score
    add $t4, $t4, $t5
    s.d $f2, 0($t4)
  .end_macro
 
  fori($t0, 1, 5, outer_average_score)
  
  # average all score
  
  l.d $f2, zero_val
  .macro all_average_score()
    move $t4, $t0
    add $t4, $t4, -1
    mul $t4, $t4, 8
    la $t5, all_score
    add $t4, $t4, $t5
    
    l.d $f4, 0($t4)
    add.d $f2, $f2, $f4
  .end_macro 
  fori($t0, 1, 5, all_average_score)
  
  l.d $f4, fifteen_val
  div.d $f4, $f2, $f4
  print_str("average score of all questions is ")
  li $v0, 3
  mov.d $f12, $f4
  syscall
  print_str("\n")
  
  # lower score
  mov.d $f2, $f4
  .macro lower_score()
    move $t4, $t0
    add $t4, $t4, -1
    mul $t4, $t4, 8
    la $t5, all_score
    add $t4, $t4, $t5
    
    l.d $f4, 0($t4)
    l.d $f6, three_val
    div.d $f4, $f4, $f6
    
    c.lt.d $f4, $f2
    li $t1, 1
    movt $t1, $0
    bne $t1, 0, not_less
    
    print_str("question ")
    print_int($t0)
    print_str(" is not so good, average is ")
    li $v0, 3
    mov.d $f12, $f4
    syscall
    print_str("\n")
    
  not_less:
    nop
  .end_macro 
  fori($t0, 1, 5, lower_score)

exit:
  li $v0, 10
  syscall
