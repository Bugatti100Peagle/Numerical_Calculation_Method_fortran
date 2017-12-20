!*************************************************************************
	!> File Name: sub_romberg.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年12月20日 星期三 16时50分43秒
!********10********20*********30********40********50********60********70**
      subroutine sub_romberg(f_any,a,b,m,e,s)
          implicit none
          integer             ::k,m,i,n   ! n 数组维度          
          real                ::a,b,e,s,x,sum_newdot
          real,external       ::f_any
          real,allocatable    ::t(:,:),tbk(:,:)


          n=2                           ! 直接从外推2开始
          do
          allocate(t(n,n))
          if (n<=2) then
              t=0
              t(1,1)=(f_any(a)+f_any(b))*(b-a)/2
          else
              t=tbk                     !从备份数据读取
              do i=1,2**(n-2)
              sum_newdot=0
              x=a+(2*i-1)*(b-a)/2**(n-1)
              sum_newdot=sum_newdot+f_any(x)
              end do
              t(n,1)=0.5*t(n-1,1)+sum_newdot*(b-a)/2**(n-1)      !从左下角开始,从1开始数组
              do i=1,n                      
              k=n-i
              m=1+i
              t(k,m)=(4**(m-1)*t(k,m-2)-t(k-1,m-2))/(4**(m-1)-1)
              end do
          end if
          print*,k,m
          x=abs(t(k,m)-t(k,m-1))
          if (x<e)exit
          n=n+1                         !误差不符合，继续加速
          allocate(tbk(n,n))
          tbk=0
          do k=1,n-1
              do m=1,n-1
              tbk(k,m)=t(k,m)
              end do
          end do
          end do
          s=t(n,n)
          end subroutine






