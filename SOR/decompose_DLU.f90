!*************************************************************************
	!> File Name: decompose_DLU.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月10日 星期三 14时28分20秒
!********10********20*********30********40********50********60********70**
      subroutine dec_DLU(n,a,d,l,u)
          integer             ::n,i,j
          real                ::a(n,n),d(n,n),l(n,n),u(n,n)

          ! 分解系数阵A为D,L,U
          d=0;l=0;u=0
          ! 初始化数组
          do i=1,n
          d(i,i)=a(i,i)
          l(i,i+1:)=a(i,i+1:)
          u(i+1:,i)=a(i+1:,i)
          end do
      end subroutine


