# 计算机组成原理实验报告

姓名：江川  

学号：11811712

### 实验目的

Practice the instructions related to shift operation, arithmetic operation and logic operation, master the details of data processing.

### 实验内容

1. get an integer  from user, put is in a word, print it in hexdecimal as big-endian representation and small-endian representation seperately.

2. get an integer  from user, put is in a word, print it in binary, exchange the its bit on 2n + 1 index with bit on 2n index (in a word n ​​is an integer from 0 to 15), print the exchanged word in binary.

3. get an integer  from user, calculate the result of 10 times of the integer.

1) DO NOT use mult/mul/multu in your code. 

2) add 9 times is also not suggested. try to make your program with higher performance.

3) if the result is overflowed, invoke an arithmetic exception is expected.

4. get the value of a word, Calculate the absolute value of it by basic operations other than use abs instruction. print out the result.

### 实验步骤

##### 1

使用 sb 将字节反序存放进内存，然后load输出

##### 2

使用 10101010 , 01010101 取 and ，获取奇数位和偶数位，偶数位右移一位，奇数位左移一位，使用 or 合并

##### 3

使用左移三位得到 8 倍，然后再相加两次

##### 4

对符号位取 and 获取符号位，使用 beq 判断分支，对负数取反加一

### 实验结果

##### 1

```plain
input:123456
0x0001e240
0x40e20100
```

##### 2

```plain
input:123456
00000000000000011110001001000000
00000000000000101101000110000000
```

##### 3

```plain
input:123456
1234560
```

##### 4

```plain
input:-123456
123456
```

### 实验分析

正常实现了要求的功能

### 实验小结与体会

多翻文档
