!*************************************************************************
	!> File Name: gaussian_elimination.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月08日 星期一 17时10分45秒
!********10********20*********30********40********50********60********70**
      subroutine matrix_inversion(n,a,a_inversion)
          integer             ::n,i,j
          real                ::a(n,n),a_inversion(n,n),c(n,2*n)       
          ! a 系数阵， a_inversion 求逆阵, c 增广阵
          real                ::l               ! 算子
          a_inversion=0
          do i=1,n
          a_inversion(i,i)=1
          end do
          c(:,:n)=a(:,:)
          c(:,n+1:)=a_inversion(:,:)
          do i=1,n
         ! print*,c(i,:)
          end do
          !print*,'--------------------'
          !--------顺列消去-------------
          do i=1,n
             do j=1,n-i
             l=c(i+j,i)/c(i,i)
             c(i+j,:)=c(i+j,:)-l*c(i,:)
             end do
            ! print*,c(i,:)
          end do
          !--------倒列消去-------------
          print*,'---------------------'
          do i=n,1,-1
             do j=1,i-1
             l=c(i-j,i)/c(i,i)
             c(i-j,:)=c(i-j,:)-l*c(i,:)
             end do
             print"(8f7.2)",c(i,:)
          end do
          !print*,'---------------------'
          !--------归一化---------------
          do i=1,n
          l=1/c(i,i)
          c(i,i)=l*c(i,i)
          c(i,n+1:)=l*c(i,n+1:)
         ! print*,c(i,:)
          end do
          a_inversion(:,:)=c(:,n+1:)
      end subroutine
