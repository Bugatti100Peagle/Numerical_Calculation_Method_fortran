!*************************************************************************
	!> File Name: after_inter.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月12日 星期五 23时02分23秒
!********10********20*********30********40********50********60********70**
      subroutine after_inter(n,f,dx,af_ax)
          implicit none
          integer             ::n,i,j
          real                ::f(n,n),af_ax(n,n-1),dx

          do i=1,n                                ! 扫描行
             do j=2,n                             ! 扫描列
                 af_ax(i,j-1)=(f(i,j)-f(i,j-1))/dx
             end do
          end do
      
      end subroutine

