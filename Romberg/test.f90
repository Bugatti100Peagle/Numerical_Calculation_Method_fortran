!*************************************************************************
	!> File Name: test.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年12月20日 星期三 20时35分46秒
!********10********20*********30********40********50********60********70**
      program test 
          implicit  none
          real                ::a,b
          real,external       ::f_any

          read*,a
          print*,f_any(a)
      end program
      include "f_any.f90"

