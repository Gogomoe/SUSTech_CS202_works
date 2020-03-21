11811712江川

### 2.19

##### 2.19.1

$t2 = 0xAAAAAAA0

$t2 = 0xBABEFEF8

##### 2.19.2

$t2 = 0xAAAAAAA0

$t2 = 0xAAAAAAA0

##### 2.19.3

$t2 = 0x15555555

$t2 = 0x15555545

### 2.26

##### 2.26.1

$s2=20

##### 2.26.2

```c
temp = i > 0;
while( temp != 0 ) {
	i = i - 1;
    B = B + 2;
    temp = i > 0;
}
```

##### 2.26.3

5N+2 instructions.

### 2.31

```assembly
fib: 
	beq $a0, 0, fib_return_0
	beq $a0, 1, fib_return_1
	
	addi $sp, -8
	sw $a0, 4($sp)
	addi $a0, -1
	jal fib
	
	lw $a0, 4($sp)
	sw $v0, 0($sp)
	addi $a0, -2
	jal fib
	
	lw $t0, 0($sp)
	addi $sp, 8
	add $v0, $v0, $t0
	jr $ra
	
fib_return_0:
	li $v0, 0
	jr $ra
fib_return_1:
	li $v0, 1
	jr $ra
```

count(0) = 3

count(1) = 4

count(n) = count(n-1) + count(n-2) + 14 instructions.