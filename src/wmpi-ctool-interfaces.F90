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
function WMPI_Init(fflag) result(ierror) &
  BIND(C,name='WMPI_Init')
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  implicit none
  INTEGER(C_INT), INTENT(IN), VALUE :: fflag
  INTEGER(C_INT) :: ierror
end function WMPI_Init

! WMPI_Finalize
function WMPI_Finalize(fflag) result(ierror) &
  BIND(C,name='WMPI_Finalize')
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  implicit none
  INTEGER(C_INT), INTENT(IN), VALUE :: fflag
  INTEGER(C_INT) :: ierror
end function WMPI_Finalize

! WMPI_Comm_rank
function WMPI_Comm_rank(comm,rank,fflag) result(ierror) &
  BIND(C,name='WMPI_Comm_rank')
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
function WMPI_Send(buf,count,datatype,dest,tag,comm,fflag) result(ierror) &
  BIND(C,name='WMPI_Send')
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use WMPI_types, only : WMPI_Datatype, WMPI_Comm
  implicit none
! TEMPORARY REPLACEMENT ONLY for compilers other than gfortran
!  TYPE(*), DIMENSION(..), INTENT(IN) :: buf
  REAL, DIMENSION(*), INTENT(IN) :: buf
  INTEGER(C_INT), INTENT(IN), VALUE :: count, dest, tag
  TYPE(WMPI_Datatype), INTENT(IN), VALUE :: datatype
  TYPE(WMPI_Comm), INTENT(IN), VALUE :: comm
  INTEGER(C_INT), INTENT(IN), VALUE :: fflag
  INTEGER(C_INT) :: ierror
end function WMPI_Send

! WMPI_Recv
function WMPI_Recv(buf,count,datatype,source,tag,comm,status,fflag) &
  result(ierror) BIND(C,name='WMPI_Recv')
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use mpi_f08, only : MPI_Status
  use WMPI_types, only : WMPI_Datatype, WMPI_Comm, WMPI_Status
  implicit none
! TEMPORARY REPLACEMENT ONLY for compilers other than gfortran
!  TYPE(*), DIMENSION(..), INTENT(IN) :: buf
  REAL, DIMENSION(*), INTENT(OUT) :: buf
  INTEGER(C_INT), INTENT(IN), VALUE :: count, source, tag
  TYPE(WMPI_Datatype), INTENT(IN), VALUE :: datatype
  TYPE(WMPI_Comm), INTENT(IN), VALUE :: comm
  TYPE(WMPI_Status), INTENT(OUT) :: status
  INTEGER(C_INT), INTENT(IN), VALUE :: fflag
  INTEGER(C_INT) :: ierror
end function WMPI_Recv

end interface

end module wmpi_ctool_interfaces
