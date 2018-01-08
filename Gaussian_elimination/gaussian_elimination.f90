!*************************************************************************
	!> File Name: gaussian_elimination.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月08日 星期一 17时10分45秒
!********10********20*********30********40********50********60********70**
      subroutine gaussian_elimination(n,a,b)
          integer             ::n,i,j
          real                ::a(n,n),b(n),c(n,n+1)       
          ! a 系数阵， b 结果阵, c 增广阵
          real                ::l               ! 算子
          
          c(:,:n)=a(:,:)
          c(:,n+1)=b(:)
          do i=1,n
          print*,c(i,:)
          end do
          print*,'--------------------'
          !--------顺列消去-------------
          do i=1,n
             do j=1,n-i
             l=c(i+j,i)/c(i,i)
             c(i+j,:)=c(i+j,:)-l*c(i,:)
             end do
             print*,c(i,:)
          end do
          !--------倒列消去-------------
          print*,'---------------------'
          do i=n,1,-1
             do j=1,i-1
             l=c(i-j,i)/c(i,i)
             c(i-j,i)=c(i-j,i)-l*c(i,i)
             c(i-j,n+1)=c(i-j,n+1)-l*c(i,n+1)
             end do
             print*,c(i,:)
          end do
          print*,'---------------------'
          !--------归一化---------------
          do i=1,n
          l=1/c(i,i)
          c(i,i)=l*c(i,i)
          c(i,n+1)=l*c(i,n+1)
          print*,c(i,:)
          end do
          b(:)=c(:,n+1)
      end subroutine
