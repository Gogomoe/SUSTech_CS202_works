11811712江川

### 5.3

##### 5.3.1

offset is 5 bits, so 3 bits in words, block size is $2^3=8$ words.

##### 5.3.2

index is 5 bits, so $2^5=32$ entries cache have.

##### 5.3.3

for each entry

valid + tag = 23bits

data = $2^5$ = 32bits

so

 $$ \frac{totalbits}{databits}=\frac{entries\cdot (23+32)bits}{entrie\cdot32bits}=\frac{55}{32}$$

##### 5.3.4

```plain
0/32=0
4/32=0 (hit)
16/32=0 (hit)
132/32=4
232/32=7
160/32=5
1024/32=32=0 (replace)
30/32=0 (replace)
140/32=4 (hit)
3100/32=96=0(replace)
180/32=5 (hit)
2180/32=68=4(replace)
```

2 blocks are replaced (block0 and block 4)

##### 5.3.5

hit ratio = $4/12=33.3\%$

##### 5.3.6

```plain
<0, 3, data of 32bytes from 3072>
<4, 2, data of 32bytes from 2176>
<5, 0, data of 32bytes from 160>
<7, 0, data of 32bytes from 224>
```

