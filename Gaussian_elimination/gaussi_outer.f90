!*************************************************************************
	!> File Name: k0901.f90
	!> Author: 青羽100P
	!> Mail: bugatti100peagle@gmail.com
	!> Created Time: 2018年01月08日 星期一 16时55分54秒
!********10********20*********30********40********50********60********70**
      program k0901 
          implicit none
          integer             ::n,i,j
          real,allocatable    ::factors(:,:),s(:)
          !系数阵和结果阵
          
          print*,'请输入方阵的行数 n'
          read*,n
          allocate(factors(n,n),s(n))
          print*,'请输入系数阵，从左到右，从上到下'
          read*,((factors(i,j),j=1,n),i=1,n)
        !  print*,((factors(i,j),j=1,n),i=1,n)
          print*,'请输入结果阵，从上到下'
          read*,s
          print*,s
          call gaussian_elimination(n,factors,s)

          print*,s
          end program
          include "gaussian_elimination.f90"
