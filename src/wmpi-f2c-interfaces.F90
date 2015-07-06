!
! This file contains interfaces describing the C
! MPI handle handle translators.  I think the normal
! conversion routines in Fortran are broken because
! Fortran has no way of declaring the C handles.  The
! WMPI Fortran handles should be declared with the
! SAME size as the C handles.  This means they will be
! library dependent.
!
! These handles (WMPI) are declared in wmpi-types.F90
!

!
! NOTE: Create this file by hand for all handles.
!

module wmpi_f2c_interfaces

  interface

! NOTE: This BINDC name should be changed to MPI_Comm_f2c after testing
! is completed.

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


! NOTE: This BINDC name should be changed to MPI_Datatype_f2c after testing
! is completed.

    function WMPI_Datatype_f2c(f_datatype) result(c_datatype) &
      bind(C,name="WMPI_Datatype_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_datatype
      type(WMPI_Datatype) :: c_datatype
    end function WMPI_Datatype_f2c

    function WMPI_Datatype_c2f(c_datatype) result(f_datatype) &
      bind(C,name="MPI_Datatype_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Datatype), value :: c_datatype
      integer :: f_datatype
    end function WMPI_Datatype_c2f

  end interface      

end module wmpi_f2c_interfaces
