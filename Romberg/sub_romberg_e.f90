!*************************************************************************
	!> File Name: sub_romberg_e.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年12月20日 星期三 16时50分43秒
!********10********20*********30********40********50********60********70**
      subroutine sub_romberg_e(f_any,a,b,e,s)
          implicit none
          integer             ::k,m,i,n   ! n 数组维度          
          real(kind=8)        ::a,b,e,s,r,x,sum_newdot
          real,external       ::f_any
          real,allocatable    ::t(:,:),tbk(:,:)
          
          n=1
          r=0.5*(b-a)*(f_any(a)+f_any(b)) ! r 用作初始值
          do
              allocate(tbk(n,n),t(n+1,n+1))
              if(size(tbk)<2)then
                  tbk(1,1)=r
              else
              t=0
              t(1:n,1:n)=tbk(1:n,1:n) 
              ! 扩维数组并引入老数组
              end if
              x=1.0*(b-a)/(2.0**n)          ! x 此时作为步长
              sum_newdot=0.0
              do i=1,2**(n-1) 
                  sum_newdot=sum_newdot+1.0*f_any(a+(2.0*i-1)*x)
              end do 
              t(n+1,1)=0.5*t(n,1)+1.0*x*sum_newdot
              print*,'n',n,'t(n,1)',t(n,1)
              do m=2,n+1
                  t(n+1,m)=(t(n+1,m-1)*4.0**(m-1)-t(n,m-1))/&
                          &(4.0**(m-1)-1)
                  print*,'n,m',n,m,'t(n,m)',t(n,m)
              end do
              x=abs(t(n+1,n+1)-t(n,n))    ! x 此时作误差
              s=t(n+1,n+1)
              deallocate(t,tbk)
             
              if(x<e)exit
              n=n+1
          end do
          print*,'得数',s,'外推',m,'n',n,'x',x



      end subroutine








