!*************************************************************************
	!> File Name: compound_simpson_2.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年11月27日 星期一 13时14分59秒
!*************************************************************************
      subroutine compound_simpson_2(a,b,f_any,n,s)
          implicit none
          real::a,b,s,h
          real,external::f_any
          integer::n
          real,allocatable::f_k(:,:)
          

