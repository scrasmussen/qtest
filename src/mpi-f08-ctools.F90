!===== WRAPPER 1 =====

subroutine MPI_Finalize_f08(ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use wmpi_ctool_interfaces, only : WMPI_Finalize
  implicit none
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: lflag, c_ierr

  lflag = 1_C_INT
  print *,'F-wrapper before c call'
  c_ierr = WMPI_Finalize(lflag)
  print *, 'F-wrapper after c call'
end subroutine MPI_Finalize_f08


subroutine MPI_Comm_rank_f08(comm,rank,ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use mpi_f08, only : MPI_Comm
  use wmpi_ctool_interfaces, only : WMPI_Comm_rank
  use wmpi_f2c_interfaces, only : WMPI_Comm_f2c
  use wmpi_types, only : WMPI_Comm
  implicit none
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(OUT) :: rank
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: c_ierr
  INTEGER(C_INT) :: c_rank
  TYPE(WMPI_Comm) :: c_comm

  print *,'MPI_Comm_rank_f08 wrapper before c calls'

  c_comm = WMPI_Comm_f2c(comm%MPI_VAL)

  c_ierr = WMPI_Comm_rank(c_comm, c_rank, 1_C_INT)
  rank = c_rank

  if (present(ierror)) ierror = c_ierr

  print *, 'MPI_Comm_rank_f08 wrapper after c calls'

end subroutine MPI_Comm_rank_f08
