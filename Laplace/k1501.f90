!*************************************************************************
	!> File Name: k1101.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月12日 星期五 22时16分29秒
!********10********20*********30********40********50********60********70**
      program k1101
          implicit none
          real,allocatable    ::u(:,:),v(:,:)
          real,allocatable    ::au_ax(:,:),av_ax(:,:)
          real,allocatable    ::d(:,:),r(:,:),x_n(:,:),x_o(:,:)
          integer             ::i,j,k,n,error1,error2
          open(10,File="v1.txt",status="old")
          n=0
          do
          read(10,*,iostat=error2)
          if(error2/=0)exit
          n=n+1
          end do
          close(10)
          ! print*,n
          
          allocate(u(n,n),v(n,n))  
          ! 默认是方形场
          open(11,File="u1.txt",status='old')
          open(12,File="v1.txt",status="old")
          i=0
          do
          i=i+1
          read(11,*,iostat=error1),u(i,:)
          read(12,*,iostat=error2),v(i,:)
          ! print*,'u',u(i,:)
          ! print*,'v',v(i,:)
          if((error1/=0).and.(error2/=0))exit
          end do
          close(11)
          close(12)

          !--------midle_inter---------
          allocate(au_ax(n,n-2),av_ax(n,n-2),d(n,n-2))
          call midle_inter(n,u,0.25,au_ax)
          call midle_inter(n,v,0.25,av_ax)
          open(13,File="data_midle_inter.txt")
          do i=2,n
          do j=2,n-2
          d(i,j)=au_ax(i,j)+av_ax(i,j)
          write(13,*),i,j,d(i,j)
          end do
          end do
          close(13)
          
          allocate(x_n(n-1,n-3),x_o(n-1,n-3),r(n-1,n-3))
          open(14,File="data_laplace.csv")
          x_o=0                                   ! 指定初值为0
          k=0
          do 
          do i=2,n-3
          do j=2,n-3                              ! 再次去掉边上的点
          r(i,j)=x_o(i+1,j)+x_o(i,j+1)+x_o(i,j-1)+x_o(i-1,j)&
              &-4*x_o(i,j)+d(i,j)
          x_n(i,j)=r(i,j)/4.0+x_o(i,j)
             
          print*,'k',k,x_n(i,j)
          
          if(abs(x_n(i,j)-x_o(i,j))<0.00001)then
              goto 100
          end if
          
          end do
          end do
          k=k+1
          x_o=x_n
          end do

      100 print*,'yes'
          
          do i=2,n-1
          do j=2,n-3
          write(14,"(i3,a,i3,a,f20.10)"),i,',',j,',',x_n(i,j)
          end do
          end do




        
          
          
      end program
     
      include "befor_inter.f90"
      
      include "midle_inter.f90"

      include "after_inter.f90"

