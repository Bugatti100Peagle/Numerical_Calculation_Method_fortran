!*************************************************************************
	!> File Name: k1401.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月13日 星期六 22时52分17秒
!********10********20*********30********40********50********60********70**
      program k1401
          implicit none
          integer             ::i,j,n,a,b           ! a,b,代表上下界
          real,external       ::f,freal
          real                ::h,u_n,u_o,u_o1,k1,k2,k3,k4

          print*,'请输入上下界a，b'
          read*,a,b
          print*,'请输入u_o初值，即y0'
          read*,u_o1
          print*,'请输入步长h'
          read*,h
          n=ceiling((b-a)/h)
         
          !-------Euler-----------
          print*,'----Euler---------'
          u_o=u_o1
          do i=a,n
          u_n=u_o+h*f(a+i*h,u_o)
          print*,i,u_n
          u_o=u_n                                 ! 更新数字
          end do

          !-------Runge Kutta-----
          print*,'-----Rungegr Kutta----'
          u_o=u_o1
          do j=a,n
          k1=h*f(a+j*h,u_o)
          k2=h*f(a+j*h+h/2.0,u_o+k1/2.0)
          k3=h*f(a+j*h+h/2.0,u_o+k2/2.0)
          k4=h*f(a+j*h+h,u_o+k3)
          u_n=u_o+(k1+2*k2+2*k3+k4)/6.0
          print*,j,u_n
          u_o=u_n
          end do
            
          !-------Real result-----
          print*,'----Real result-------'
          do i=a,n
          print*,i,freal(a+i*h)
          end do



      end program
      
      include "f.f90"
      
      include "freal.f90"
          
