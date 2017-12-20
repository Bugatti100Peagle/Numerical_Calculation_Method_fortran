# Introduce_of_Romberg
这里是我在学习龙贝格积分法时的一些笔记和编程思路。
## 积分方法
直接跳过数学证明，具体证明请自行翻阅。(待补充连接)
![enter image](https://github.com/Bugatti100Peagle/Numerical_Calculation_Method_fortran/blob/master/pictures/romberg01.png?raw=true)
龙贝格(Romberg)积分建立在逐次分办法基础上，逐次分办法主要证明了近似公式的误差可以用前后两次积分(第一次分n个区间，第二次分2n个区间)的差来衡量。还给出了两个积分间的递推关系。
龙贝格发现了高次系数的N-C积分（牛顿柯斯特积分）可以由低次系数的前后两次做组合而得。组合方法如上。
所以，高次的积分就可由低次积分复合而得，克服了之前复化积分收敛慢，且没有比较智能的自适应功能的缺陷。
![enter image](https://github.com/Bugatti100Peagle/Numerical_Calculation_Method_fortran/blob/master/pictures/romberg02.png?raw=true)
注意黄色高亮部分的关系。
![enter image](https://github.com/Bugatti100Peagle/Numerical_Calculation_Method_fortran/blob/master/pictures/romberg03.png?raw=true)
整理得到类似牛顿插值的牛顿下山法的表。
## 编程方法
与牛顿下山一样，龙贝格的表有可以任意插入新节点，只需怎加特定点即可，无需重新扫描。虽然，龙贝格积分一般不外推至5（开数组仅需要开设8～10维度就够用了），但是，为了体现它的“独木成林”（只从梯形积分复合以求高次积分）的强大功能，以及为了后期做外推>5的极限测试。此处使用动态数组。

