.macro read_int (%addr)
  li $v0, 5
  syscall
  sw $v0, %addr
.end_macro

.macro print_str (%str)
.data
  pstr: .asciiz %str
.text
  la $a0, pstr
  li $v0, 4
  syscall
.end_macro