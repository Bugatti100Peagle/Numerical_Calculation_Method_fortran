!*************************************************************************
	!> File Name: k1001.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月10日 星期三 15时10分24秒
!********10********20*********30********40********50********60********70**
      program k1001
          implicit none
          integer             ::i,n
          real                ::w                 !松弛系数
          real,allocatable,dimension(:,:)&
                             &::a,d,l,u,mid,mid_t,uni,g
          ! a 系数阵， d 对角阵， l 下三角阵， u 上三角阵
          ! mid 中间换算阵，mid_t 换算阵的逆
          ! uni 单位阵， g 迭代阵， f 尾项
          real,allocatable,dimension(:)&
                             &::b,x,f
          print*,'请输入方阵的秩n'
          read*,n
          allocate(&
              &a(n,n),d(n,n),l(n,n),u(n,n),mid(n,n),mid_t(n,n),&
              &uni(n,n),g(n,n),&
              &f(n),b(n),x(n)&
              &)
          uni=0
          do i=1,n
          uni(i,i)=1.0
          end do
          print*,"请输入系数阵a"
          read*,a
          print*,'请输入结果阵b'
          read*,b
          print*,'请输入松弛系数'
          read*,w
          print*,"请输入初始条件X0"
          read*,x
          
          call dec_DLU(n,a,d,l,u)
          mid=(uni-w*l)
          call matrix_inversion(n,mid,mid_t)
          g=matmul(mid_t,(((1-w)*I)+w*U))
          !print*,g
          f=matmul((w*mid_t),b)
          
          i=0
          do i=1,10
          b=x                                     
          !b用作记录上一次x
          x=matmul(g,b)+f
          print"(a,i3,a,99f12.6)",'i=',i,'    x',x
         ! if(sqrt(sum((x-b)**2))<0.0001)exit
          end do
      end program

      include "decompose_DLU.f90"
      include "matrix_inversion.f90"

