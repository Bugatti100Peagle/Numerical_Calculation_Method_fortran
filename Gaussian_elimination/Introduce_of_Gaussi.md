# Introduce_of Gaussi
这里是学习线性代数的高斯消去法的笔记和编程思路
## 高斯消去法‘
主元上下方元素消为0。(待补充)

## 编程方法
将系数阵与结果阵存为一个数组，增广阵，然后控制算子计算
![enter image](https://github.com/Bugatti100Peagle/Numerical_Calculation_Method_fortran/blob/master/pictures/Gaussi1.png)

## Bugs and problem
- 没有选主元
- 主元位置为0 的无法计算

## 改进方向
- 添加选主元的功能
- 跳过0主元
- 考虑使用分式解法
