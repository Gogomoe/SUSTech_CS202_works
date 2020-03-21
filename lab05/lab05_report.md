# 计算机组成原理实验报告

姓名：江川  

学号：11811712

### 实验目的

练习方法调用、循环

### 实验内容

1. Print out a 9*9 multiplication table.

    1. Submit 2 files: one got a global main label as the entrance of the program, another is used to define a function to print.

    2. The function is used to print item a*b = c, the value of “a” is from $a0, the value of “b” is from $a1.

    3. calculate the number of MIPS basic instructions, compared with the number which statistic by Mars (MIPS32 simulator) to see if them are same or not. record this info on the report.

 

2. Get a positive integer from input, output an integer in reverse order using loop and recursion separately.

    1. Submit 2 files: one use loop, another use reverse.

    2. Statistic the number of MIPS basic instructions while by using loop and recursion separately. Record this info on your report. compare the two number while the input is n digit decimal number （n changes from 1,2,3 to 8）,record this info on the report.

 

3. Read some data from the input, save it in an array, sort them in ascending order, and then print out the array after sorting.

    1. Submit 2 files: one got a global main label as the entrance of the program, another is used to define a function to print.

    2. The function is used to print the array.

    3. The number of array item is determined by user.

### 实验步骤

MARS 设置不要开编译全部文件夹，要开识别 .globl main

##### 1

就写一个双重循环呗……不过这个能不能用宏来简化操作（见实验总结）

##### 2

每次mod10取最后一位输出，直到为0，分别用循环和递归实现

##### 3

实现一个简单的选择排序

### 实验结果

##### 1

1374 instructions statistic by MARS.

it is close to count basic instructions by myself, maybe i made some calculate mistakes.

output:

```plain
1*1=1 
2*1=2 2*2=4 
3*1=3 3*2=6 3*3=9 
4*1=4 4*2=8 4*3=12 4*4=16 
5*1=5 5*2=10 5*3=15 5*4=20 5*5=25 
6*1=6 6*2=12 6*3=18 6*4=24 6*5=30 6*6=36 
7*1=7 7*2=14 7*3=21 7*4=28 7*5=35 7*6=42 7*7=49 
8*1=8 8*2=16 8*3=24 8*4=32 8*5=40 8*6=48 8*7=56 8*8=64 
9*1=9 9*2=18 9*3=27 9*4=36 9*5=45 9*6=54 9*7=63 9*8=72 9*9=81 
```

##### 2

| Length | Loop | Recursion |
| ---- | ---- | ---- |
|  1   |  21   | 30    |
|  2   |  30   | 45    |
|  3   |  39   | 60    |
|  4   |  48   | 75    |
|  5   |  57   | 90    |
|  6   |  66   | 105    |
|  7   |  75   | 120    |
|  8   |  84   | 135    |

input and output:

```plain
input a integer: 123456
654321
```

##### 3

input and output:

```plain
input the count of nums: 5
input the int array
3
7
5
1
6
1 3 5 6 7 
```

### 实验分析与总结

有两个问题没有解决

1. 我定义了一个 macros.s 文件存放一些宏，
如果 main.s 同时 include a.s, b.s, 并且 a.s, b.s 都需要使用 macros.s 中定义的宏，
这种情况下如果在 a.s, b.s 都 include macros.s 会报错，重复导入，这种情况该怎么办?

2. 根据官方文档的方法 [MARS Help](https://courses.missouristate.edu/KenVollmar/MARS/Help/MacrosHelp.html) 定义了一个 for 循环宏，功能为 reg 从 from 累加到 to 的一个循环，实现如下

  ```assembly
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
  ```

  但是实现双重循环时， 无法展开，报错信息为 

  ```
  Detected a macro expansion loop (recursive reference).
  ```

  比如下面这个双重循环

  ```assembly
  .macro inner_body()
    print_int($s0)
    print_int($s1)
    print_str("  ")
  .end_macro 
  
  .macro outer_body()
    fori($s1, $s0, 9, inner_body)
    print_str("\n")
  .end_macro 
  
  fori($s0, 1, 9, outer_body)
  ```

  如果把 fori 拷贝一份命名为 fori1 ，把这里的其中一个 fori 改为 fori1，则可以正常汇编。

  这种情况下有没有更好的解决方案？

