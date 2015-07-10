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
    function WMPI_Comm_f2c(f_comm) result(c_comm) &
      bind(C,name="MPI_Comm_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_comm
      type(WMPI_Comm) :: c_comm
    end function WMPI_Comm_f2c

    function WMPI_Comm_c2f(c_comm) result(f_comm) &
      bind(C,name="MPI_Comm_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Comm), value :: c_comm
      integer :: f_comm
    end function WMPI_Comm_c2f


! NOTE: This BINDC name should be changed to MPI_Type_f2c after testing
! is completed.
    function WMPI_Type_f2c(f_datatype) result(c_datatype) &
      bind(C,name="MPI_Type_f2c")
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
      bind(C,name="MPI_Errhandler_f2c")
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
      bind(C,name="MPI_Group_f2c")
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

! NOTE: This BINDC name should be changed to MPI_Info_f2c after testing
! is completed.
    function WMPI_Info_f2c(f_info) result(c_info) &
      bind(C,name="MPI_Info_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_info
      type(WMPI_Info) :: c_info
    end function WMPI_Info_f2c

    function WMPI_Info_c2f(c_info) result(f_info) &
      bind(C,name="MPI_Info_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Info), value :: c_info
      integer :: f_info
    end function WMPI_Info_c2f

! NOTE: This BINDC name should be changed to MPI_Message_f2c after testing
! is completed.
    function WMPI_Message_f2c(f_message) result(c_message) &
      bind(C,name="MPI_Message_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_message
      type(WMPI_Message) :: c_message
    end function WMPI_Message_f2c

    function WMPI_Message_c2f(c_message) result(f_message) &
      bind(C,name="MPI_Message_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Message), value :: c_message
      integer :: f_message
    end function WMPI_Message_c2f

! NOTE: This BINDC name should be changed to MPI_Op_f2c after testing
! is completed.
    function WMPI_Op_f2c(f_op) result(c_op) &
      bind(C,name="MPI_Op_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_op
      type(WMPI_Op) :: c_op
    end function WMPI_Op_f2c

    function WMPI_Op_c2f(c_op) result(f_op) &
      bind(C,name="MPI_Op_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Op), value :: c_op
      integer :: f_op
    end function WMPI_Op_c2f

! NOTE: This BINDC name should be changed to MPI_Request_f2c after testing
! is completed.
    function WMPI_Request_f2c(f_request) result(c_request) &
      bind(C,name="MPI_Request_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_request
      type(WMPI_Request) :: c_request
    end function WMPI_Request_f2c

    function WMPI_Request_c2f(c_request) result(f_request) &
      bind(C,name="MPI_Request_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Request), value :: c_request
      integer :: f_request
    end function WMPI_Request_c2f

! NOTE: This BINDC name should be changed to MPI_Win_f2c after testing
! is completed.
    function WMPI_Win_f2c(f_win) result(c_win) &
      bind(C,name="MPI_Win_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_win
      type(WMPI_Win) :: c_win
    end function WMPI_Win_f2c

    function WMPI_Win_c2f(c_win) result(f_win) &
      bind(C,name="MPI_Win_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Win), value :: c_win
      integer :: f_win
    end function WMPI_Win_c2f

! NOTE: This BINDC name should be changed to MPI_File_f2c after testing
! is completed.
    function WMPI_File_f2c(f_file) result(c_file) &
      bind(C,name="MPI_File_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer, value  :: f_file
      type(WMPI_File) :: c_file
    end function WMPI_File_f2c

    function WMPI_File_c2f(c_file) result(f_file) &
      bind(C,name="MPI_File_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_File), value :: c_file
      integer :: f_file
    end function WMPI_File_c2f

! NOTE: This BINDC name should be changed to MPI_Status_f2c after testing
! is completed.
    function WMPI_Status_f2c(f_status) result(c_status) &
      bind(C,name="WMPI_Status_f2c")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      integer  :: f_status
      type(WMPI_Status) :: c_status
      !type(WMPI_Status) :: f_status
    end function WMPI_Status_f2c

    function WMPI_Status_c2f(c_status) result(f_status) &
      bind(C,name="MPI_Status_c2f")
      use ISO_C_BINDING
      use wmpi_types
      implicit none
      type(WMPI_Status), value :: c_status
      integer :: f_status
    end function WMPI_Status_c2f

  end interface      

end module wmpi_f2c_interfaces
