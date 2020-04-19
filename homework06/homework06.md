11811712江川

### 3.18

##### 4.4.1

考虑到指令+4的那个加法器是组合逻辑，所以指令+4的部分和读 I-Mem 的部分可以合并

每个周期的时间是 $ Max(70ps,200ps) = 200ps$

##### 4.4.2

I-Mem 200ps

Sign-Extend 15ps

Shift-Left-2 10ps

Add 70ps

Mux 20ps

每个周期的时间是 $ 200ps+15ps+10ps+70ps+20ps=315ps$

##### 4.4.3

I-Mem 200ps

Regs 90ps

Mux 20ps

ALU 90ps

Mux 20ps

每个周期的时间是 $ 200ps+90ps+20ps+90ps+20ps=420ps$

##### 4.4.4

J 类型指令需要用到 Shift-left-2

##### 4.4.5

J 类型和，在这条电路上（4.4.2）。I 类型中的 PC-relative branches发生转跳时不需要（4.4.3）

##### 4.4.6

对于 add，不会有什么影响

对于 beq，$420-315+10=115ps$，因为Shift-Left-2小于115ps，所以不会产生影响。

### 4.5

##### 4.5.1

in lw, sw the data memory used.$25\%+10\%=35\%$

##### 4.5.2

in addi, beq, lw, sw the sign-extend circuit needed.

$20\%+25\%+25\%+10\%=80\%$

in cycles the input not needed, the circuit also finish sign-extend, but it input and output are not used.

### 4.7

$101011\ 00011\ 00010\ 0000000000010100 = sw\ \$2,\ 20(\$3)$

##### 4.7.1

output of sign extend = $0x00000014$

output of jump "Shift left 2" = $0000\ 00011\ 00010\ 0000000000010100\ 00$

##### 4.7.2

ALU control input = $ 010100 $

##### 4.7.3

new PC = old PC + 4 我似乎没找到原本的 pc 地址是多少

##### 4.7.4

Register 左边的 Mux，值是不确定的（大概是Instruction[15-10], 00000 ）因为这个寄存器没被用到，设计有可能取 1 也说不定

Register 右边的 Mux，为 pc 中 offset 扩展到 32位，是 0x00000014

Memory 右边的 Mux，值也是不确定的（大概是 ALU 的计算结果，即 0x00000011）

最上面的 Mux，值为 pc + 4

##### 4.7.5

左上角 ADD 输入为 pc 和 4

右上角 ADD 输入为 pc + 4 和 0x00000014

ALU 的输入为 -3 和 20

##### 4.7.6

Read register 1 = 00011

Read register 2 = 00010

Write register 大概是 00000 

Write data 大概是 0x00000011

还有个 RegWrite 为 0