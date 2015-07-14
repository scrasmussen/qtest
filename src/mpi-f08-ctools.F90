#undef VERBOSE

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
  REAL, DIMENSION(*), INTENT(IN) :: buf
  INTEGER, INTENT(IN) :: count, dest, tag
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: c_count, c_dest, c_tag, c_ierror
  TYPE(WMPI_Datatype) :: c_datatype
  TYPE(WMPI_Comm) :: c_comm

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
  REAL, DIMENSION(*), INTENT(OUT) :: buf
  INTEGER, INTENT(IN) :: count, source, tag
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Status), INTENT(OUT) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: C_COUNT, C_SOURCE, c_tag, c_ierror
  TYPE(WMPI_Datatype) :: c_datatype
  TYPE(WMPI_Comm) :: c_comm
  TYPE(WMPI_Status) :: c_status

  print *,'MPI_Recv_f08 wrapper before c calls'
  c_count = count
  c_datatype = WMPI_Type_f2c(datatype%MPI_VAL)
  c_source = source
  c_tag = tag
  c_comm = WMPI_Comm_f2c(comm%MPI_VAL)

  status%MPI_SOURCE = 13
  status%MPI_TAG = 14
  status%MPI_ERROR = 15

  !print *, "old=", status%MPI_SOURCE, status%MPI_TAG, status%MPI_ERROR
  ierror = WMPI_Status_f2c(status, c_status) ! WARNING WARNING WARNING !!!!

  print *,'about to enter with',1_C_INT
  print *,'about to eanter with buf = ',buf(1)
  c_ierror = WMPI_Recv(buf,c_count,c_datatype,c_source,7,c_comm,c_status,1_C_INT)

  if (present(ierror)) ierror = c_ierror

  print *,'MPI_Recv_f08 wrapper after c calls'
end subroutine MPI_Recv_f08
