!*************************************************************************
	!> File Name: k0701.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年11月22日 星期三 18时59分07秒
!*************************************************************************
      program k0701
          real::a,b,r,l
          real,external::f_any,sum_of_fx
          integer::i,j,k
          print*,"请输入a,b,等分基本区间数k"
          read*,a,b,k
          print*,'-- simpson for inregral x^4 from',a,' to',b 
          call simpson(a,b,f_any,s)
          print*,s
          print*,' '
          print*,'-- compound_simpson for inregral x^4 from',a,'to',b
          call compound_simpson_2(a,b,f_any,k,s)
          print*,s
          print*,' '
          print*,'-- cycle simpson  --'
          r=0
          do j=1,k
              call simpson(a+(j-1)*1.0*((b-a)/(k*1.0)),&
                  &a+j*1.0*((b-a)/(k*1.0)),f_any,l)
              r=r+l
             ! print*,r
          end do
          print*,r
      end program
      include "simpson.f90"
      include "f_any.f90"
      include "compound_simpson_2.f90"

