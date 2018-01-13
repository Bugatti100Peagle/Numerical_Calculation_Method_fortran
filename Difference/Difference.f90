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
          integer             ::i,j,n,error1,error2
          open(10,File="v.txt",status="old")
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
          open(11,File="u.txt",status='old')
          open(12,File="v.txt",status="old")
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
 
          !--------befor_inter---------
          allocate(au_ax(n,n-1),av_ax(n,n-1))
          call befor_inter(n,u,0.25,au_ax)
          call befor_inter(n,v,0.25,av_ax)
          open(13,File="data_befor_inter.txt")
          do i=2,n
          do j=2,n-1  
          ! 跳过没有差分过的点
          write(13,*),i,j,au_ax(i,j)+av_ax(i,j)
          end do
          end do
          close(13)
          deallocate(au_ax,av_ax)

          !--------midle_inter---------
          allocate(au_ax(n,n-2),av_ax(n,n-2))
          call midle_inter(n,u,0.25,au_ax)
          call midle_inter(n,v,0.25,av_ax)
          open(13,File="data_midle_inter.txt")
          do i=2,n
          do j=2,n-2
          write(13,*),i,j,au_ax(i,j)+av_ax(i,j)
          end do
          end do
          close(13)
          deallocate(au_ax,av_ax)
         
          !--------after_inter---------
          allocate(au_ax(n,n-1),av_ax(n,n-1))
          call after_inter(n,u,0.25,au_ax)
          call after_inter(n,v,0.25,av_ax)
          open(13,File="data_after_inter.txt")
          do i=2,n
          do j=2,n-1
          write(13,*),i,j,au_ax(i,j)+av_ax(i,j)
          end do
          end do
          close(13)
          deallocate(au_ax,av_ax)
        
          
          
      end program
     
      include "befor_inter.f90"
      
      include "midle_inter.f90"

      include "after_inter.f90"

