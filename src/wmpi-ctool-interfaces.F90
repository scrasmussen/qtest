!
! This file interfaces for WMPI wrappers to ctools
!   - this file should be generated
!

module wmpi_ctool_interfaces

!
! These interfaces are for calling the PMPI C tools
!
interface

! WMPI_Init
function WMPI_Init(fflag) result(ierror) BIND(C, name='WMPI_Init')
    use, intrinsic :: ISO_C_BINDING, only : C_INT
    implicit none
    INTEGER(C_INT), INTENT(IN), VALUE :: fflag
    INTEGER(C_INT) :: ierror
end function WMPI_Init

! WMPI_Finalize
function WMPI_Finalize(fflag) result(ierror) BIND(C, name='WMPI_Finalize')
    use, intrinsic :: ISO_C_BINDING, only : C_INT
    implicit none
    INTEGER(C_INT), INTENT(IN), VALUE :: fflag
    INTEGER(C_INT) :: ierror
end function WMPI_Finalize

! WMPI_Comm_rank
function WMPI_Comm_rank(comm,rank,fflag) result(ierror) BIND(C, name='WMPI_Comm_rank')
    use, intrinsic :: ISO_C_BINDING, only : C_INT
    use WMPI_types, only : WMPI_Comm
    implicit none
    TYPE(WMPI_Comm), INTENT(IN), VALUE :: comm
    INTEGER(C_INT), INTENT(OUT) :: rank
    INTEGER(C_INT), INTENT(IN), VALUE :: fflag
    INTEGER(C_INT) :: ierror
end function WMPI_Comm_rank

! WMPI_Comm_size

! WMPI_Send
! WMPI_Recv

end interface

end module wmpi_ctool_interfaces
