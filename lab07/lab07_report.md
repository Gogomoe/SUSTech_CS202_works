# 计算机组成原理实验报告

姓名：江川  

学号：11811712

### 实验目的

Learn the difference between integer and float point data in MIPS,Learn the infinite and NaN in float point data, Practice the usage of floating register and the conditional flags in Co-processor 1, Practice on load,store,move,arithmetic,compare and branch instructions on float point data.

### 实验内容

Q1. Calculate the square root of an integer number without using “sqrt.s” and “sqrt.d”

1) Get the input data (integer) and the precision value(such as 0.01) from input device
2) If the input data is a negative number, print out the warning message and exit
3) If the input data is a positive number, calculate its square root value which can satisfy the accuracy requirement and print it out

Q2. Suppose 3 students attends a quiz with 5 questions, score of every question could be a float point number ranges from 0 to 5.0(such as 0.5, 1.0, 3.5.etc)

1) Get the scores of each question of each student
Suppose user input the following data, (5  4.5 3.5  4  3 ) is the score list of one student, 5 is the score of 1st question,4.5 is the score of 2nd question.etc.

5  4.5 3.5 4 3

3  2    2 1.5 1

4 3.5 5  4.5 3

2) calculate the total score of this quiz for every students and print out
3) calculate the average of every question and print out
4) calculate the average of all the question and print out
5) find all the index of the question in this quiz whose performance is not so good(the average score of the question is lower than the total average), print the index of this question and its corresponding average score.  

### 实验步骤

使用二分法实现开平方。

### 实验结果

input and output:

```plain
input a double: 169
13.0
```

```plain
input score of student 1 for question 1: 1
input score of student 1 for question 2: 2
input score of student 1 for question 3: 3
input score of student 1 for question 4: 4
input score of student 1 for question 5: 5
input score of student 2 for question 1: 1.5
input score of student 2 for question 2: 2.5
input score of student 2 for question 3: 3.5
input score of student 2 for question 4: 4.5
input score of student 2 for question 5: 0.5
input score of student 3 for question 1: 2
input score of student 3 for question 2: 2
input score of student 3 for question 3: 3
input score of student 3 for question 4: 4
input score of student 3 for question 5: 4
total score of student 1 is 15.0
total score of student 2 is 12.5
total score of student 3 is 15.0
average score of question 1 is 1.5
average score of question 2 is 2.1666666666666665
average score of question 3 is 3.1666666666666665
average score of question 4 is 4.166666666666667
average score of question 5 is 3.1666666666666665
average score of all questions is 2.8333333333333335
question 1 is not so good, average is 1.5
question 2 is not so good, average is 2.1666666666666665
```

### 实验分析与总结

浮点数操作也太难写了吧