!*************************************************************************
	!> File Name: compound_simpson.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年11月22日 星期三 20时18分29秒
!*************************************************************************
      subroutine compound_simpson(a,b,f_any,n,s)
          implicit none
          real::a,b,s,h
          real,external::f_any,sum_of_fx
          integer::n
          ! n 表示基本小区间数
          h=(b-a)/n
         ! print*,sum_of_fx(a,b,-1,n,n,2,f_any)
         ! print*,sum_of_fx(a,b,0,n,n-1,2,f_any)
         ! print*,f_any(a)
         ! print*,f_any(b)
          s=h*((1.0/6.0)*f_any(a)+&
              &(4.0/6.0)*sum_of_fx(a,b,-1,n,n,2,f_any)+&
              &(2.0/6.0)*sum_of_fx(a,b,0,n,n-1,2,f_any)+&
              &(1.0/6.0)*f_any(b))
      end subroutine



