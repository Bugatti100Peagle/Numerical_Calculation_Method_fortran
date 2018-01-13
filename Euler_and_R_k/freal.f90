!*************************************************************************
	!> File Name: freal.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月13日 星期六 23时25分13秒
!********10********20*********30********40********50********60********70**
      function freal(x)result(y)
          real                ::x,y
          y=1.0/(2*exp(x)-x-1)
      end function
