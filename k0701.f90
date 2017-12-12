!*************************************************************************
	!> File Name: k0701.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年11月22日 星期三 18时59分07秒
!*************************************************************************
      program k0701
          real::x_i(5),r,l
          real,external::f_any,sum_of_fx
          integer::i,j,k
          x_i=(/0,1,2,3,4/)
          print*,'-- simpson for inregral x^4 from x=0 to 4 -- '
          call simpson(x_i(1),x_i(5),f_any,s)
          print*,s
          print*,' '
          print*,'-- compound_simpson for inregral x^4 from x=0 to 4 --'
          call compound_simpson(0.0,4.0,f_any,2,s)
          print*,s
          print*,' '
          print*,'-- cycle simpson  --'
          call simpson(0.0,2.0,f_any,l)
          call simpson(2.0,4.0,f_any,r)
          print*,r+l
      end program
      include "simpson.f90"
      include "sum_of_fx.f90"
      include "f_any.f90"
      include "compound_simpson.f90"

