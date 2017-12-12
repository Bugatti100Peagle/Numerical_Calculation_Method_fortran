!*************************************************************************
	!> File Name: sum_of_fx.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年11月22日 星期三 20时28分21秒
!*************************************************************************
      function sum_of_fx(a,b,i,n,o,j,f_any)result(s)
          real::a,b,s,h,x_i
          real,external::f_any
          integer::i,n,j,k,o
          ! i 表示特征标识，区分累加的点
          ! n 表示总基本小区间数
          ! o 表示求和终止位置
          ! j 表示每个小区间内分j个子区间，如Simpson的j=2,梯形的j=1,柯斯特的j=4
          h=(b-a)/(j*n)
          s=0
          k=1
          do 
              x_i=a+(j*k+i)*h
              s=s+f_any(x_i)
              k=k+1
              if(k>o)exit
          end do
      end function







