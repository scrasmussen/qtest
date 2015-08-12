!! Let the preprocessor include this file, breaks otherwise.
!
#include "preprocess-macros.h"


!===== Fortran WRAPPER 2 =====

subroutine WMPI_Init_F(ierror) &
  BIND(C,name="WMPI_Init_F")
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  implicit none
  INTEGER(C_INT), INTENT(OUT) :: ierror
  INTEGER :: f_ierror

#ifdef VERBOSE
  print *,'WMPI_Init_F wrapper before PMPI call'
#endif

  call PMPI_Init(f_ierror)

  ierror = f_ierror

#ifdef VERBOSE
  print *,'WMPI_Init_F wrapper after PMPI call'
#endif

end subroutine WMPI_Init_F

subroutine WMPI_Finalize_F(ierror) &
  BIND(C,name="WMPI_Finalize_F")
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  implicit none
  INTEGER(C_INT), INTENT(OUT) :: ierror
  INTEGER :: f_ierror

#ifdef VERBOSE
  print *,'WMPI_Finalize_F wrapper before PMPI call'
#endif

  call PMPI_Finalize(f_ierror)

  ierror = f_ierror

#ifdef VERBOSE
  print *,'WMPI_Finalize_F wrapper after PMPI call'
#endif

end subroutine WMPI_Finalize_F

subroutine WMPI_Comm_rank_F(comm,rank,ierror) &
  BIND(C,name="WMPI_Comm_rank_F")
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use :: mpi, only : PMPI_Comm_rank
  implicit none
  INTEGER(C_INT), INTENT(IN), VALUE :: comm
  INTEGER(C_INT), INTENT(OUT) :: rank
  INTEGER(C_INT), INTENT(OUT) :: ierror
  INTEGER :: f_ierror
  INTEGER :: f_rank

#ifdef VERBOSE
  print *,'WMPI_Comm_rank_F wrapper before PMPI call'
#endif

  call PMPI_Comm_rank(comm, f_rank, f_ierror)

  rank = f_rank
  ierror = f_ierror

#ifdef VERBOSE
  print *,'WMPI_Comm_rank_F wrapper after PMPI call'
#endif

end subroutine WMPI_Comm_rank_F

subroutine WMPI_Send_F(buf,count,datatype,dest,tag,comm,ierror) &
  BIND(C,name="WMPI_Send_F")
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use :: mpi, only : PMPI_Send, MPI_COMM_WORLD
  implicit none
#ifdef USE_ASSUMED_TYPE
  TYPE(*), DIMENSION(..), INTENT(IN) :: buf
#else
  !DEC$ ATTRIBUTES NO_ARG_CHECK :: buf
  !GCC$ ATTRIBUTES NO_ARG_CHECK :: buf
  !$PRAGMA IGNORE_TKR buf
  !DIR$ IGNORE_TKR buf
  !IBM* IGNORE_TKR buf
  WMPI_CHOICE_BUFFER_TYPE, DIMENSION(*), INTENT(IN) :: buf
#endif
  INTEGER(C_INT), INTENT(IN), VALUE :: count, dest, tag
  INTEGER(C_INT), INTENT(IN), VALUE :: datatype
  INTEGER(C_INT), INTENT(IN), VALUE :: comm
  INTEGER(C_INT), INTENT(OUT) :: ierror
  INTEGER :: f_ierror

#ifdef VERBOSE
  print *, 'WMPI_Send_F wrapper before PMPI call'
  print *, count, datatype, dest, tag, comm
#endif

  call PMPI_Send(buf, count, datatype, dest, tag, comm, f_ierror)
  ierror = f_ierror

#ifdef VERBOSE
  print *,'WMPI_Send_F wrapper after PMPI call'
#endif

end subroutine WMPI_Send_F

subroutine WMPI_Recv_F(buf,count,datatype,source,tag,comm,status,ierror) &
  BIND(C,name='WMPI_Recv_F')
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use :: mpi, only : PMPI_Recv, MPI_STATUS_SIZE
  implicit none
#ifdef F_INTEROP_ASSUMED_TYPE
  TYPE(*), DIMENSION(..) :: buf
#else
  !DEC$ ATTRIBUTES NO_ARG_CHECK :: buf
  !GCC$ ATTRIBUTES NO_ARG_CHECK :: buf
  !$PRAGMA IGNORE_TKR buf
  !DIR$ IGNORE_TKR buf
  !IBM* IGNORE_TKR buf
  WMPI_CHOICE_BUFFER_TYPE, DIMENSION(*) :: buf
#endif
  INTEGER(C_INT), INTENT(IN), VALUE :: count, source, tag
  INTEGER(C_INT), INTENT(IN), VALUE :: datatype
  INTEGER(C_INT), INTENT(IN), VALUE :: comm
  INTEGER(C_INT), INTENT(OUT) :: status(MPI_STATUS_SIZE)
  INTEGER(C_INT), INTENT(OUT) :: ierror
  INTEGER :: f_ierror

#ifdef VERBOSE
  print *,'WPMI_Recv_F wrapper before PMPI call'
  print *,'ARGS =', count, datatype, source, tag, comm
#endif

  call PMPI_Recv(buf, count, datatype, source, tag, comm, status, f_ierror)
  ierror = f_ierror

#ifdef VERBOSE
  print *,'WPMI_Recv_F wrapper after PMPI call'
  print *,'STATUS:', status(1), status(2), status(3)
#endif

end subroutine WMPI_Recv_F

!! A test for passing character strings
!
subroutine WMPI_Get_processor_name_F(c_name, c_resultlen, c_ierror) &
  BIND(C,name='WMPI_Get_processor_name_F')
  use, intrinsic :: ISO_C_BINDING, only : C_INT, C_CHAR
  use :: mpi, only : MPI_MAX_PROCESSOR_NAME
  implicit none
  CHARACTER(KIND=C_CHAR), INTENT(OUT) :: c_name(MPI_MAX_PROCESSOR_NAME+1)
  INTEGER(C_INT), INTENT(OUT) :: c_resultlen
  INTEGER(C_INT), INTENT(OUT) :: c_ierror

  CHARACTER(LEN=MPI_MAX_PROCESSOR_NAME) :: name
  INTEGER :: resultlen
  INTEGER :: ierror

#ifdef STATUSVERBOSE
  print *, "WMPI_Get_processor_name_F"
#endif

  call PMPI_Get_processor_name(name,resultlen,ierror)

  call wmpi_string_f2c(name, c_name, resultlen, MPI_MAX_PROCESSOR_NAME)
  c_resultlen = resultlen
  c_ierror = ierror

#ifdef STATUSVERBOSE
  print *, "WMPI_Get_processor_name_F::",trim(name),resultlen
#endif

end subroutine WMPI_Get_processor_name_F
