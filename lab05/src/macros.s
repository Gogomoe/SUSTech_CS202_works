.macro read_int(%reg)
  li $v0, 5
  syscall
  move %reg, $v0
.end_macro

.macro print_str(%str)
.data
  pstr: .asciiz %str
.text
  la $a0, pstr
  li $v0, 4
  syscall
.end_macro

.macro print_int(%reg)
.text
  move $a0, %reg
  li $v0, 1
  syscall
.end_macro

.macro sbrk(%size, %addr_reg)
.text
  add $a0, $zero, %size
  li $v0, 9
  syscall
  move %addr_reg, $v0
.end_macro

.macro fori(%regIterator, %from, %to, %bodyMacroName)
  add %regIterator, $zero, %from
  loop:
  bgt %regIterator, %to, end_loop
  %bodyMacroName()
  add %regIterator, %regIterator, 1
  j loop
  end_loop:
  nop
.end_macro

.macro fori1(%regIterator, %from, %to, %bodyMacroName)
  add %regIterator, $zero, %from
  loop:
  bgt %regIterator, %to, end_loop
  %bodyMacroName()
  add %regIterator, %regIterator, 1
  j loop
  end_loop:
  nop
.end_macro