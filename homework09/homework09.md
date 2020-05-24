11811712江川

### 5.6

##### 5.6.1

P1: $1s/0.66ns=1.5GHz$

P2: $1s/0.9ns=1.11GHz$

##### 5.6.2

P1: $ 8\% \cdot 70ns + 100\%\cdot0.66ns = 6.26ns$

P2: $6\% \cdot 70ns + 100\%\cdot0.90ns =5.1ns$

##### 5.6.3

P1: $CPI=1+36\%\cdot8\%\cdot\frac{70ns}{0.66ns}=3.291$

P2: $CPI=1+36\%\cdot6\%\cdot\frac{70ns}{0.90ns}=2.68$

P1: $Performance=1.5GHz/3.291=456M$

P2: $Performance=1.11GHz/2.68=414M$

So, P1 is faster

##### 5.6.4

AMAT: $100\%\cdot0.66ns+8\%\cdot5.62ns+8\%\cdot95\%\cdot70ns=6.43ns$

worse

##### 5.6.5

CPI = $1+36\%\cdot 8\%\cdot \frac{5.62ns}{0.66ns}+36\%\cdot 8\%\cdot 95\%\cdot \frac{70ns}{0.66ns}=4.147$

##### 5.6.6

Performance = $1.5GHz/4.147=361M$

P2 is faster.

$ \frac{1.5GHz}{1+36\%\cdot x \cdot 5.62ns/0.66ns+36\%\cdot x \cdot 95\% \cdot 70ns/0.66ns}=414M$

$ x = 6.67\% $

### 5.7

##### 5.7.1

block count = $24/(3*2)=4$

```plain
3:   index=   3/8%4=0(00), tag=0x000000, offset=   3%8=3(011), miss(0-0)
180: index= 180/8%4=2(10), tag=0x000005, offset= 180%8=4(100), miss(2-0)
43:  index=  43/8%4=1(01), tag=0x000001, offset=  43%8=3(011), miss(1-0)
2:   index=   2/8%4=0(00), tag=0x000000, offset=   2%8=2(010), hit
191: index= 191/8%4=3(11), tag=0x000005, offset= 191%8=7(111), miss(3-0)
88:  index=  88/8%4=3(11), tag=0x000002, offset=  88%8=0(000), miss(3-1)
190: index= 190/8%4=3(11), tag=0x000005, offset= 190%8=6(110), hit
14:  index=  14/8%4=1(01), tag=0x000000, offset=  14%8=6(110), miss(1-1)
181: index= 181/8%4=2(10), tag=0x000005, offset= 181%8=5(101), hit
44:  index=  44/8%4=1(01), tag=0x000001, offset=  44%8=4(100), hit
186: index= 186/8%4=3(11), tag=0x000005, offset= 186%8=2(010), hit
253: index= 253/8%4=3(11), tag=0x000007, offset= 253%8=5(101), miss(3-2)
```

##### 5.7.2

```plain
3:   tag=0x00000000, offset=   3%4=3(11), miss(0)
180: tag=0x0000002D, offset= 180%4=0(00), miss(1)
43:  tag=0x0000000A, offset=  43%4=3(11), miss(2)
2:   tag=0x00000000, offset=   2%4=2(10), hit
191: tag=0x0000002F, offset= 191%4=3(11), miss(3)
88:  tag=0x00000016, offset=  88%4=0(00), miss(4)
190: tag=0x0000002F, offset= 190%4=2(10), hit
14:  tag=0x00000003, offset=  14%4=2(10), miss(5)
181: tag=0x0000002D, offset= 181%4=1(01), hit
44:  tag=0x0000000B, offset=  44%4=0(00), miss(6)
186: tag=0x0000002E, offset= 186%4=2(10), miss(7)
253: tag=0x0000003F, offset= 253%4=1(01), miss(2)
```

##### 5.7.3

```plain
3:   tag=0x00000000, offset=   3%8=3(011), LRU-miss(0), MRU-miss(0)
180: tag=0x00000016, offset= 180%8=4(100), LRU-miss(1), MRU-miss(1)
43:  tag=0x00000005, offset=  43%8=3(011), LRU-miss(2), MRU-miss(2)
2:   tag=0x00000000, offset=   2%8=2(010), LRU-hit (0), MRU-hit (0)
191: tag=0x00000017, offset= 191%8=7(111), LRU-miss(3), MRU-miss(3)
88:  tag=0x0000000B, offset=  88%8=0(000), LRU-miss(1), MRU-miss(3)
190: tag=0x00000017, offset= 190%8=6(110), LRU-hit (3), MRU-miss(3)
14:  tag=0x00000001, offset=  14%8=6(110), LRU-miss(2), MRU-miss(3)
181: tag=0x00000016, offset= 181%8=5(101), LRU-miss(0), MRU-hit (0)
44:  tag=0x00000005, offset=  44%8=4(100), LRU-miss(1), MRU-hit (2)
186: tag=0x00000017, offset= 186%8=2(010), LRU-hit (3), MRU-miss(2)
253: tag=0x0000001F, offset= 253%8=5(101), LRU-miss(2), MRU-miss(2)
```

miss rate of LRU = $9/12=75\%$

miss rate of MRU= $9/12=75\%$

##### 5.7.4

$2GHz = 0.5ns$

$100ns=200cycles$

###### 1

CPI = $1.5+7\%\cdot 200 = 15.5$ 

double $1.5+7\%\cdot 400= 29.5$ 

half $1.5+7\%\cdot 100= 8.5$ 

###### 2

CPI = $1.5+7\%\cdot 12+3.5\%\cdot200=9.34$

double = $1.5+7\%\cdot 12+3.5\%\cdot400=16.34$

half= $1.5+7\%\cdot 12+3.5\%\cdot100=5.84$

###### 3

CPI = $1.5+7\%\cdot 28+1.5\%\cdot200=6.46$

double = $1.5+7\%\cdot 28+1.5\%\cdot400=9.25$

half= $1.5+7\%\cdot 28+1.5\%\cdot100=4.75$

##### 5.7.5

CPI = $1.5+7\%\cdot 12+3.5\%\cdot50+1.3\%\cdot 200=6.69$

better performance than only level 2 direct=mapped cache

advantages: reduce rate of visit memory, may improve performance

disadvantages: cost more, more complex when design cpu

##### 5.7.6

$12\cdot3.5\%=50\cdot(4\%-0.7x\%), x=4.5$

$28\cdot1.5\%=50\cdot(4\%-0.7x\%), x=4.5$