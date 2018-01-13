!*************************************************************************
	!> File Name: befor_inter.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月12日 星期五 22时53分28秒
!********10********20*********30********40********50********60********70**
      subroutine befor_inter(n,f,dx,af_ax)
          implicit none
          integer             ::n,i,j
          real                ::f(n,n),af_ax(n,n-1),dx

          do i=1,n                                ! 扫描行
             do j=1,n-1                           ! 扫描列
                 af_ax(i,j)=(f(i,j+1)-f(i,j))/dx
             end do
          end do

      end subroutine



