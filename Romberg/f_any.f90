!*************************************************************************
	!> File Name: f_any.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年12月20日 星期三 16时55分31秒
!********10********20*********30********40********50********60********70**
      function f_any(x)result(y)
          implicit none
          real                ::x,y
          y=4/(1+x**2)
      end function
