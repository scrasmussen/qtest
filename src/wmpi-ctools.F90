#undef VERBOSE
#undef STATUSVERBOSE

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
  use :: mpi, only : PMPI_Send
  implicit none
  REAL, DIMENSION(*), INTENT(IN) :: buf
  INTEGER(C_INT), INTENT(IN), VALUE :: count, dest, tag
  INTEGER(C_INT), INTENT(IN), VALUE :: datatype
  INTEGER(C_INT), INTENT(IN), VALUE :: comm
  INTEGER(C_INT), INTENT(OUT) :: ierror
  INTEGER :: f_ierror

#ifdef VERBOSE
  print *,'WMPI_Send_F wrapper before PMPI call'
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
  use :: mpi_f08, only : MPI_Status, MPI_Comm, MPI_Datatype, PMPI_Recv
  use :: mpi_f08_types
  implicit none
  REAL, DIMENSION(*), INTENT(OUT) :: buf
  INTEGER(C_INT), INTENT(IN), VALUE :: count, source, tag
  TYPE(MPI_Datatype), INTENT(IN), VALUE :: datatype
  TYPE(MPI_Comm), INTENT(IN), VALUE :: comm
  TYPE(MPI_Status), INTENT(OUT) :: status
  INTEGER(C_INT), INTENT(OUT) :: ierror
  INTEGER :: fierror

#ifdef STATUSVERBOSE
  print *,'WPMI_Recv_F wrapper before PMPI call'
  print *,'STATUS%MPI_SOURCE',STATUS%MPI_SOURCE
  print *,'STATUS%MPI_TAG',STATUS%MPI_TAG
  print *,'STATUS%MPI_ERROR',STATUS%MPI_ERROR
  print *,'DATATYPE =', datatype
  print *,'SOURCE =', source
#endif

  call PMPI_Recv(buf, count, datatype, source, tag, comm, status, fierror)
  ierror = fierror

#ifdef STATUSVERBOSE
  print *,'IERROR AFTER =',ierror 
  print *,'WPMI_Recv_F wrapper after PMPI call'
#endif

end subroutine WMPI_Recv_F
