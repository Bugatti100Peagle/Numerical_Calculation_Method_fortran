!*************************************************************************
	!> File Name: pro_Romberg.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2017年12月20日 星期三 16时18分22秒
!********10********20*********30********40********50********60********70**
      program pro_Romberg
          implicit none
          integer             ::k,m     ! k 分半次数，m 外推次数
          real(kind=8)        ::a,b,e,s ! a,b 积分区间, e 误差上限, s 最终得数
          real                ::star_time,end_time
          real,external       ::f_any     ! 要积分的函数
          
          print*,'请输入上下界 a,b'
          read*,a,b
          print*,'指定外推次数 m ? (select 1) or 指定误差上限 e ?(select 2)'
          read*,s                       ! s 临时用作判断
          if(s<2)then
              print*,'请输入外推次数 m'
              read*,m
              call sub_romberg_m(f_any,a,b,m,s)
          else
              print*,'请输入误差上限 e'
              read*,e
              call sub_romberg_e(f_any,a,b,e,s)
          end if


          print*,'用时',end_time-star_time,'秒'
      

      end program
      include "f_any.f90"
      include "sub_romberg_m.f90"
      include "sub_romberg_e.f90"
