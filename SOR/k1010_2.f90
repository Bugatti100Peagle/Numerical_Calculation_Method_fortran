!*************************************************************************
	!> File Name: k1001.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月10日 星期三 15时10分24秒
!********10********20*********30********40********50********60********70**
      program k1002
          implicit none
          integer             ::i,j,k,n
          real                ::w                 !松弛系数
          real,allocatable    ::a(:,:),d(:,:)
          real,allocatable    ::b(:),x_o(:),x_m(:),x_n(:),f(:)
          ! a 系数阵, f 尾项
          
          print*,'请输入方阵的秩n'
          read*,n
          allocate(a(n,n),d(n,n),f(n),b(n),x_o(n),x_m(n),x_n(n))
          print*,"请输入系数阵a"
          read*,a
          print*,'请输入结果阵b'
          read*,b
          print*,'请输入松弛系数'
          read*,w
          print*,"请输入初始条件X_o"
          read*,x_o
          
          do i=1,n
             do j=1,n
                 d(i,j)=-a(i,j)/a(i,i)
             end do
             f(i)=b(i)/a(i,i)
          end do
          j=0
          x_m=x_o                                 ! 中间变量阵
          do                                      ! 迭代次数
             j=j+1
             do i=1,n                             ! 扫描第n个数
                 x_m(i)=0                         ! 不用乘他自己
                 x_n(i)=(1-w)*x_o(i)+w*(sum(d(i,:)*x_m)+f(i))
                 x_m(i)=x_n(i)
                 !print*,i,x_m
             end do
             if(sqrt(sum((x_n-x_o)**2))<0.0001)exit
             x_o=x_m                              ! 更新迭代数组
             !print*,'---------------'
             print*,'j',j,x_o
         end do

      end program


