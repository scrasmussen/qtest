!===== WRAPPER 1 =====

subroutine MPI_Init_f08(ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use wmpi_ctool_interfaces, only : WMPI_Init
  implicit none
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: c_ierr

  print *,'MPI_Init_f08 wrapper before c call'
  c_ierr = WMPI_Init(1_C_INT)
  print *, 'MPI_Init_f08 wrapper after c call'
end subroutine MPI_Init_f08

subroutine MPI_Finalize_f08(ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use wmpi_ctool_interfaces, only : WMPI_Finalize
  implicit none
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: c_ierr

  print *,'MPI_Finalize_f08 wrapper before c call'
  c_ierr = WMPI_Finalize(1_C_INT)
  print *, 'MPI_Finalize_f08 wrapper after c call'
end subroutine MPI_Finalize_f08

subroutine MPI_Comm_rank_f08(comm,rank,ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use :: mpi_f08, only : MPI_Comm
  use :: wmpi_ctool_interfaces, only : WMPI_Comm_rank
  use :: wmpi_f2c_interfaces, only : WMPI_Comm_f2c
  use :: wmpi_types, only : WMPI_Comm
  implicit none
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(OUT) :: rank
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror

  integer(C_INT) :: c_ierror
  integer(C_INT) :: c_rank
  type(WMPI_Comm) :: c_comm

  print *,'MPI_Comm_rank_f08 wrapper before c calls'

  c_comm = WMPI_Comm_f2c(comm%MPI_VAL)

  c_ierror = WMPI_Comm_rank(c_comm, c_rank, 1_C_INT)
  rank = c_rank

  if (present(ierror)) ierror = c_ierror

  print *, 'MPI_Comm_rank_f08 wrapper after c calls'

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

  integer(C_INT) :: c_count, c_dest, c_tag, c_ierror
  type(WMPI_Datatype) :: c_datatype
  type(WMPI_Comm) :: c_comm

  print *,'MPI_Comm_rank_f08 wrapper before c calls'

  c_count = count
  c_datatype = WMPI_Type_f2c(datatype%MPI_VAL)
  c_dest = dest
  c_tag = tag
  c_comm = WMPI_Comm_f2c(comm%MPI_VAL)

  c_ierror = WMPI_Send(buf,c_count,c_datatype,c_dest,c_tag,c_comm,1_C_INT)

  if (present(ierror)) ierror = c_ierror

end subroutine MPI_Send_f08
