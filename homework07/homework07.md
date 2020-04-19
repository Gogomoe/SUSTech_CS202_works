11811712江川

### 4.8

##### 4.8.1

$250ps+350ps+150ps+300ps+200ps=1250ps$

##### 4.8.2

pipelined: $ 350ps * 20\% = 70ps $

non-pipelined: $ 1250ps*20\%=250ps $

##### 4.8.3

ID stage

clock time $ max(250ps,175ps,150ps,300ps,200ps)=300ps$

##### 4.8.4

utilization:  $ 20\%+15\%=35\% $

##### 4.8.5

utilization:  $ 45\%+20\%=65\% $

##### 4.8.6

average  execute time per instruction

single-cycle: $1250ps$

multi-cycle: $250ps*100\%+350ps*100\%+150ps*100\%+300ps*80\%+200ps*60\%=1110ps$

pipeline: $ 350ps $

### 4.9

##### 4.9.1

data dependences, line 2 depends line 1's data r1,  line 3 depends line 2's  data r2 and line 1's data r1

##### 4.9.2

line 1 and line 2 have a data hazard, line 2 and line 3 have a data hazard. Add 3 NOP between line 1 line 1 and line 2 line 3.

##### 4.9.3

with full forwarding, there are no hazards, and no NOP.

##### 4.9.4

without forwarding $ 5 + 3(bubble) + 1 + 3(bubble) + 1= 13clocks, 250ps * 13 = 3250ps$ 

with full forwarding $ 5 + 1 + 1 = 7 clocks, 300ps * 7 = 2100ps $

adding full forwarding is speedup.

##### 4.9.5

3 NOP between line2 and line3

##### 4.9.6

with only ALU-ALU forwarding $5 + 1 + 3(bubble) + 1=10cycles, 290ps * 10 = 2900ps$