# 计算机组成原理实验报告

姓名：江川  

学号：11811712

### 实验目的

Learn the difference between exception and interruption,practice on the trap,eret,mfc0,mtc0 instructions.Learn the kernal spcace and special register such as epc,cause and vaddress in Coprocess 0 ,Practice to rewrite the exception handler.

### 实验内容

1. Implementing a Simple arithmetic calculator for 31-bits Unsigned Numbers:
   1. Read the operators and operands in the main method, call the function to implement the arithmetic calculator

   2. If the above abnormal situation does not occur, output the result of the operation.  
   3. In following situation a exception will be triggered:
      1>the value of input is out of the range of 31-bits unsigned number
      2>the addition overflow
      3>the multiplication result exceeds the width of a word
      4>the divisor is zero
      The exception handler do the following things:
      1>stop the program running
      2>output prompt information, including “Runtime exception at 0x_(the address of the instruction which triggered the exception)”, and the cause of the exception (illegal input , arithmetic overflow , divide by zero)
      3>exit the program.

### 实验步骤

用 .ktext 覆盖默认的异常处理方法

这里做了一点额外处理，如果是输入数组不合法的情况，不会直接退出程序，而是要求重新输入数字

### 实验结果

input and output:

```plain
please input a int: 5
please input a operator: *
please input a int: 1000000000
Runtime exception at 0x_4194632
multiplication overflow
```

```plain
please input a int: 1000000000
please input a operator: +
please input a int: 2000000000
Runtime exception at 0x_4194580
addition overflow
```

```plain
please input a int: 5
please input a operator: /
please input a int: 0
Runtime exception at 0x_4194652
divisor is zero
```

```plain
please input a int: 3000000000
Runtime exception at 0x_4194464
input error
please input a int: 150
please input a operator: +
please input a int: 78
150+78=228
```

```plain
please input a int: 123
please input a operator: *
please input a int: 3
123*3=369
```

### 实验分析与总结

