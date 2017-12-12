!*************************************************************************
	!> File Name: simpson.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年11月22日 星期三 18时51分06秒
!*************************************************************************
      subroutine simpson(a,b,f_any,s)
          implicit none
          real::a,b,s
          real,external::f_any
          s=(b-a)/6.0*(f_any(a)+4*f_any(0.5*(a+b))+f_any(b))
      end subroutine

