# homework 02

11811712 江川

### 2.1

``` assembly
subi f, h, 5
add  f, f, g
```

### 2.3

``` assembly
sub  $t0, $s3, $s4
add  $t1, $s6, $t0
lb   $t0, ($t1)
sb   $t0, 8($s7)
```

### 2.6

##### 2.6.1

```C
int len = 5;
for (int i = 0; i < len; i++) {
    int min_pos = i;
    for(int j = i + 1; j < len; j++) {
        if(Array[j] < Array[min_pos]) {
            min_pos = j
        }
    }
    int temp = Array[i];
    Array[i] = Array[j];
    Array[j] = temp;
}
```

##### 2.6.2

```assembly
lw $t0, 16($s6)
lw $t1, 0($s6)
lw $t2, 8($s6)
lw $t3, 4($s6)
lw $t4, 12($s6)
sw $t0, 0($6)
sw $t1, 4($6)
sw $t2, 8($6)
sw $t3, 12($6)
sw $t4, 16($6)
```

### 2.12

##### 2.12.1

0x00000000

##### 2.12.2

not, has overflow.

##### 2.12.3

0xB0000000

##### 2.12.4

not overflow

##### 2.12.5

0x00000000

##### 2.12.6

not, has overflow

### 2.16

type : r-type  sub

instruction

```assembly
sub $v1, $v0, $v1
```

binary : 000000 00011 00010 00011 00000 100010

