!! Let the preprocessor include this file, breaks otherwise.
!
#include "preprocess-macros.h"


!===== WRAPPER 1 =====

subroutine MPI_Init_f08(ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use :: mpi_f08, only : MPI_Init
  use :: wmpi_ctool_interfaces, only : WMPI_Init
  implicit none
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: c_ierror

#ifdef VERBOSE
  print *,'MPI_Init_f08 wrapper before c call'
#endif

  c_ierror = WMPI_Init(1_C_INT)
  ierror = c_ierror

#ifdef VERBOSE
  print *, 'MPI_Init_f08 wrapper after c call'
#endif

end subroutine MPI_Init_f08

subroutine MPI_Finalize_f08(ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use :: mpi_f08, only : MPI_Finalize
  use :: wmpi_ctool_interfaces, only : WMPI_Finalize
  implicit none
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: c_ierror

#ifdef VERBOSE
  print *,'MPI_Finalize_f08 wrapper before c call'
#endif

  c_ierror = WMPI_Finalize(1_C_INT)
  ierror = c_ierror

#ifdef VERBOSE
  print *, 'MPI_Finalize_f08 wrapper after c call'
#endif

end subroutine MPI_Finalize_f08

subroutine MPI_Comm_rank_f08(comm,rank,ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use :: mpi_f08, only : MPI_Comm
  use :: wmpi_ctool_interfaces, only : WMPI_Comm_rank
  use :: wmpi_f2c_interfaces, only : WMPI_Comm_f2c, WMPI_Comm_c2f
  use :: wmpi_types, only : WMPI_Comm
  implicit none
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(OUT) :: rank
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror

  INTEGER(C_INT) :: c_ierror
  INTEGER(C_INT) :: c_rank
  TYPE(WMPI_Comm) :: c_comm

#ifdef VERBOSE
  print *,'MPI_Comm_rank_f08 wrapper before c calls'
#endif

  c_comm = WMPI_Comm_f2c(comm%MPI_VAL)

  c_ierror = WMPI_Comm_rank(c_comm, c_rank, 1_C_INT)
  rank = c_rank

  if (present(ierror)) ierror = c_ierror
#ifdef VERBOSE
  print *, 'MPI_Comm_rank_f08 wrapper after c calls'
#endif
end subroutine MPI_Comm_rank_f08

subroutine MPI_Send_f08(buf,count,datatype,dest,tag,comm,ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use :: mpi_f08, only : MPI_Datatype, MPI_Comm
  use :: wmpi_ctool_interfaces, only : WMPI_Send
  use :: wmpi_f2c_interfaces, only : WMPI_Type_f2c, WMPI_Comm_f2c
  use :: wmpi_types, only : WMPI_Datatype, WMPI_Comm
  implicit none
#ifdef F_INTEROP_TR
  TYPE(*), DIMENSION(..), INTENT(IN) :: buf
#else
  REAL, DIMENSION(*), INTENT(IN) :: buf
#endif
  INTEGER, INTENT(IN) :: count, dest, tag
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: c_count, c_dest, c_tag, c_ierror
  TYPE(WMPI_Datatype) :: c_datatype
  TYPE(WMPI_Comm) :: c_comm

#define VERBOSE
#ifdef VERBOSE
  print *,'MPI_Send_f08 wrapper before c calls'
#endif

  c_count = count
  c_datatype = WMPI_Type_f2c(datatype%MPI_VAL)
  c_dest = dest
  c_tag = tag
  c_comm = WMPI_Comm_f2c(comm%MPI_VAL)

  c_ierror = WMPI_Send(buf,c_count,c_datatype,c_dest,c_tag,c_comm,1_C_INT)
  if (present(ierror)) ierror = c_ierror

#ifdef VERBOSE
  print *,'MPI_Send_f08 wrapper after c calls'
#endif

end subroutine MPI_Send_f08

subroutine MPI_Recv_f08(buf,count,datatype,source,tag,comm,status,ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  !use :: wmpi_ctool_interfaces, only : WMPI_Recv
  use :: mpi_f08, only : MPI_Datatype, MPI_Comm, MPI_Status
  use :: wmpi_types, only : WMPI_Datatype, WMPI_Comm, WMPI_Status
  use :: wmpi_ctool_interfaces, only : WMPI_Recv
  use :: wmpi_f2c_interfaces, only : WMPI_Type_f2c, WMPI_Comm_f2c, &
       WMPI_Status_f2c, WMPI_Status_c2f
  implicit none
#ifdef F_INTEROP_TR
  TYPE(*), DIMENSION(..) :: buf
#else
  REAL, DIMENSION(*) :: buf
#endif
  INTEGER, INTENT(IN) :: count, source, tag
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Status), INTENT(OUT) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: C_COUNT, C_SOURCE, c_tag, c_ierror
  TYPE(WMPI_Datatype) :: c_datatype
  TYPE(WMPI_Comm) :: c_comm
  TYPE(WMPI_Status) :: c_status

#ifdef STATUSVERBOSE
  print *,'MPI_Recv_f08 wrapper before c calls'
#endif
  status%MPI_SOURCE = 13
  status%MPI_TAG = 14
  status%MPI_ERROR = 15

  c_count = count
  c_datatype = WMPI_Type_f2c(datatype%MPI_VAL)
  c_source = source
  c_tag = tag
  c_comm = WMPI_Comm_f2c(comm%MPI_VAL)
  ierror = WMPI_Status_f2c(status, c_status)

#ifdef STATUSVERBOSE
  print *,'about to enter with',1_C_INT
#endif 

  c_ierror = WMPI_Recv(buf,c_count,c_datatype,c_source,c_tag,c_comm,c_status,1_C_INT)
  if (present(ierror)) ierror = c_ierror

#ifdef STATUSVERBOSE
  print *,'MPI_Recv_f08 wrapper after c calls'
  print *,'STATUS%MPI_SOURCE',STATUS%MPI_SOURCE
  print *,'STATUS%MPI_TAG',STATUS%MPI_TAG
  print *,'STATUS%MPI_ERROR',STATUS%MPI_ERROR
#endif
end subroutine MPI_Recv_f08


!! A test for passing character strings
!
subroutine MPI_Get_processor_name_f08(name,resultlen,ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT, C_CHAR
  use :: mpi_f08, only : MPI_MAX_PROCESSOR_NAME, MPI_SUCCESS
  use :: wmpi_ctool_interfaces, only : WMPI_Get_processor_name
  implicit none
  CHARACTER(LEN=MPI_MAX_PROCESSOR_NAME), INTENT(OUT) :: name
  INTEGER, INTENT(OUT) :: resultlen
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  CHARACTER(KIND=C_CHAR) :: c_name(MPI_MAX_PROCESSOR_NAME+1)
  INTEGER(C_INT) :: c_resultlen
  INTEGER(C_INT) :: c_ierror

  c_ierror=  WMPI_Get_processor_name(c_name,c_resultlen,1_C_INT)
  if (c_ierror /= MPI_SUCCESS) goto 9
  if (present(ierror)) ierror = c_ierror  ! you can reuse c_ierror now

  call wmpi_string_c2f(c_name, name, c_resultlen, MPI_MAX_PROCESSOR_NAME)
  resultlen = c_resultlen

  return
9 if (present(ierror)) ierror = c_ierror

end subroutine MPI_Get_processor_name_f08


!
! The following two procedures do string conversions between
! Fortran style character strings and C style strings.
!---------------------------------------------------------------

subroutine WMPI_string_f2c(f_string, c_string, length, max_length)
  use, intrinsic :: ISO_C_BINDING, only : C_CHAR, C_NULL_CHAR
  implicit none
  character(len=max_length), intent(in) :: f_string
  character(len=1,kind=C_CHAR), intent(out) :: c_string(max_length+1)
  integer, intent(in) :: length, max_length
  integer :: i

  do i = 1, length
    c_string(i) = f_string(i:i)
  end do
  c_string(length + 1) = C_NULL_CHAR

end subroutine WMPI_string_f2c

subroutine WMPI_string_c2f(c_string, f_string, length, max_length)
  use, intrinsic :: ISO_C_BINDING, only : C_CHAR
  implicit none
  character(len=1,kind=C_CHAR), intent(in) :: c_string(max_length+1)
  character(len=max_length), intent(out) :: f_string
  integer, intent(in) :: length, max_length
  integer :: i

  !! initialization here is necessary
  !
  f_string = ""

  do i = 1, length
    f_string(i:i) = c_string(i)
  end do

end subroutine WMPI_string_c2f
