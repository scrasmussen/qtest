!
! This file contains interfaces describing the C
! MPI handle handle translators.  I think the normal
! conversion routines in Fortran are broken because
! Fortran has now way of declaring the C handles.
!
! These handles (WMPI) are declared in wmpi-types.F90
!

module wmpi_f2c_interfaces

  interface

    function WMPI_Comm_f2c(f_comm) result(c_comm) bind(C,name="WMPI_Comm_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_comm
      type(WMPI_Comm) :: c_comm
    end function WMPI_Comm_f2c

    function WMPI_Comm_c2f(c_comm) result(f_comm) bind(C,name="MPI_Comm_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Comm), value :: c_comm
      integer :: f_comm
    end function WMPI_Comm_c2f

  end interface      

end module wmpi_f2c_interfaces
