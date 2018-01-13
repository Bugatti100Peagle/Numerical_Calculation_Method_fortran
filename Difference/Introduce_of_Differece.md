# Introduce of Difference
不知道这个翻译对不对，先这么写吧

## 编程原理
个人理解，所谓差分，就是小格子里某个点往某个方向上整体地与相邻点，求斜率
时间关系，前插，后插，中央插的公式以后再补充了

## 编程思路
看好对应关系，编写除法即可

![enter image](https://github.com/Bugatti100Peagle/Numerical_Calculation_Method_fortran/blob/master/pictures/Difference.png)
## Bugs and problems
- 前插，后插所得散度场有空点，不知是数据问题还是算法问题

## 总结和经验
- linux 上的libreoffice 的图表功能很少，所以我这次使用了在线工具图表秀，直接选择文件会传不上去，还是只有手动复制
- function 要传递数组必须使用接口块或模块，我比较讨厌用，所以使用了子程序，代价是要多声明一个数组以区分纵横场


