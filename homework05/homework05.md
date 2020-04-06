11811712江川

### 3.18

| Interation | Step                      | Quotient | Divisor | Remainder      |
| ---------- | ------------------------- | -------- | ------- | -------------- |
| 0          | initial values            | 000000   | 101010  | 0000 0100 1010 |
| 1          | 1: Rem = Rem - Div        | 000000   | 101010  | 0000 0010 0000 |
| 1          | 2: Rem >= 0,sll Q, Q0 = 1 | 000001   | 101010  | 0000 0010 0000 |
| 1          | 3: Shift Div right        | 000001   | 010101  | 0000 0010 0000 |
| 2          | 1: Rem = Rem - Div        | 000001   | 010101  | 0000 0000 1011 |
| 2          | 2: Rem >=0,sll Q, Q0 = 1  | 000011   | 010101  | 0000 0000 1011 |
| 2          | 3: Shift Div right        | 000011   | 001010  | 0000 0000 1011 |

### 3.27

negative: S = 1

1.5625=$1.101*2^0$

exponent = 0 + 15 = 11111(excess-16)

mantissa = 101 0000000

bit pattern: 1 11111 1010000000

min: $ 1*2^{-15} $

max: $ 2 * 2^{16} $

range: $ (-2*2^{16},-1*2^{-15}]\cup[1*2^{-15},2*2^{16}) $

accuracy: $ log_{10}{2^{10}} = 10log_{10}{2} \approx 10 * 0.3 \approx 3$

精确到大概3位有效数字

### 3.29

26.125 = $1.1010001 * 2^4$

0.4150390625 = $ 1.10101001 * 2^{-2} $
$$
\begin{align}
 &1.1010001000 \\
+&0.0000011010(GRS=011) \\
&-----------\\
=&1.1010100010(GRS=011) \\
=&1.1010100011
\end{align}
$$
result = $ 1.1010100011 * 2^4 $

### 3.30

-8.0546875 = $ 1.0000000111*2^3 $

-0.179931640625=$ 1.0111000010*2^{-3} $

(3)+(-3)=0

由计算器算得
$$
\begin{align}
&1.01110011000001001110\\
=&1.0111001100(GRS=001)\\
=&1.0111001100
\end{align}
$$
result=$1.0111001100*2^0=1.44921875$

0 00000 0111001100

calculator: 1.4492931366
