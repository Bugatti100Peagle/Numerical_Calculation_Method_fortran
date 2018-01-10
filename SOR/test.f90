!*************************************************************************
	!> File Name: test.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月10日 星期三 13时53分12秒
!********10********20*********30********40********50********60********70**
      program test
          implicit none
          ! 构造测试矩阵 和 调用测试的外壳
          integer             ::i
          real,dimension(4,4) ::a,d,l,u,t
          real,dimension(4)   ::b,x
          a(:,1)=(/1,11,13,12/)
          a(:,2)=(/2,5,10,6/)
          a(:,3)=(/4,9,8,15/)
          a(:,4)=(/3,7,16,14/)
          b=(/22,20,21,23/)
          a=1.0*a;b=1.0*b
          do i=1,4
          print*,a(i,:),b(i)
          end do
          print*,'---------------------'
          call dec_DLU(4,a,d,l,u)
          call matrix_inversion(4,a,t)
          print"(4f12.5)",t
          !print*,matmul(a,b)
          end program

          include "decompose_DLU.f90"

          include "matrix_inversion.f90"


