11811712江川

### 3.6

185 = 1011 1001

122 = 0111 1010

185 - 122 = 63 = 0011 1111

neither overflow or underflow

### 3.7

这里有点问题，8位的有符号整数并装不下 185，我假设这个185是指 1011 1001 也就是 -71

-71 = 1011 1001

122 = 0111 1010

-71 + 122 = 51 = 0011 0011

如果185=-71不算的话，那就 neither overflow or underflow

### 3.8

同上，把 185 当作 -71 来看

-71 = 1011 1001

122 = 0111 1010

-71 - 122 = 0011 1111 = 63

underflow

### 3.13

| Interation | Step                               | Multiplicand | Product                   |
| ---------- | ---------------------------------- | ------------ | ------------------------- |
| 0          | initial values                     | 0110 0010    | 0000 0000  **0001 0010**  |
| 1          | 1: 0 => no operation               | 0110 0010    | 0000 0000  **0001 0010**  |
| 1          | 2: Shift right product             | 0110 0010    | 0000 0000 0  **0001 001** |
| 2          | 1: 1 => high bits of prod += Mcand | 0110 0010    | 0110 0010 0 **0001 001**  |
| 2          | 2: Shift right product             | 0110 0010    | 0011 0001 00 **0001 00**  |
| 3          | 1: 0 => no operation               | 0110 0010    | 0011 0001 00 **0001 00**  |
| 3          | 2: Shift right product             | 0110 0010    | 0001 1000 100 **0001 0**  |
| 4          | 1: 0 => no operation               | 0110 0010    | 0001 1000 100 **0001 0**  |
| 4          | 2: Shift right product             | 0110 0010    | 0000 1100 0100 **0001**   |
| 5          | 1: 1 => high bits of prod += Mcand | 0110 0010    | 0110 1110 0100 **0001**   |
| 5          | 2: Shift right product             | 0110 0010    | 0011 0111 0010 0 **000**  |
| 6          | 1: 0 => no operation               | 0110 0010    | 0011 0111 0010 0 **000**  |
| 6          | 2: Shift right product             | 0110 0010    | 0001 1011 1001 00 **00**  |
| 8          | 2: Shift right product             | 0110 0010    | 0000  0110 1110 0100      |

跳过了乘数已经为0的位移

(62)hex * (12)hex = (6E4)hex

### 3.16

layer1: 8 adders

layer2: 4 adders

layer3: 2 adders

layer4: 1 adder

4 layers need to use

4 layers * 4 time units/per layer = 16 time units

### 3.17

0x33 * 0x55 = (0x20+0x10+0x02+0x01)*0x55

0x55 << 5  + 0x55 << 4 + 0x55 < <1 + 0x55

