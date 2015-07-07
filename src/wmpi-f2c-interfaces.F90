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


! NOTE: This BINDC name should be changed to MPI_Type_f2c after testing
! is completed.

    function WMPI_Type_f2c(f_datatype) result(c_datatype) &
      bind(C,name="WMPI_Type_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_datatype
      type(WMPI_Datatype) :: c_datatype
    end function WMPI_Type_f2c

    function WMPI_Type_c2f(c_datatype) result(f_datatype) &
      bind(C,name="MPI_Type_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Datatype), value :: c_datatype
      integer :: f_datatype
    end function WMPI_Type_c2f

! NOTE: This BINDC name should be changed to MPI_Errhandler_f2c after testing
! is completed.

    function WMPI_Errhandler_f2c(f_errhandler) result(c_errhandler) &
      bind(C,name="WMPI_Errhandler_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_errhandler
      type(WMPI_Errhandler) :: c_errhandler
    end function WMPI_Errhandler_f2c

    function WMPI_Errhandler_c2f(c_errhandler) result(f_errhandler) &
      bind(C,name="MPI_Errhandler_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Errhandler), value :: c_errhandler
      integer :: f_errhandler
    end function WMPI_Errhandler_c2f

! NOTE: This BINDC name should be changed to MPI_Group_f2c after testing
! is completed.

    function WMPI_Group_f2c(f_group) result(c_group) &
      bind(C,name="WMPI_Group_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_group
      type(WMPI_Group) :: c_group
    end function WMPI_Group_f2c

    function WMPI_Group_c2f(c_group) result(f_group) &
      bind(C,name="MPI_Group_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Group), value :: c_group
      integer :: f_group
    end function WMPI_Group_c2f



!
! TODO: MPI_FILE, MPI_GROUP, MPI_INFO, MPI_MESSAGE, MPI_OP, MPI_REQUEST, MPI_WIN,
!       MPI_STATUS
!

  end interface      

end module wmpi_f2c_interfaces
