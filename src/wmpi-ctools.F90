!===== Fortran WRAPPER 2 =====

subroutine WMPI_Init_F(ierror) &
  BIND(C,name="WMPI_Init_F")
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  implicit none
  INTEGER(C_INT), INTENT(OUT) :: ierror
  integer :: f_ierror

  print *,'WMPI_Init_F wrapper before PMPI call'

  call PMPI_Init(f_ierror)

  ierror = f_ierror

  print *,'WMPI_Init_F wrapper after PMPI call'

end subroutine WMPI_Init_F

subroutine WMPI_Comm_rank_F(comm,rank,ierror) &
  BIND(C,name="WMPI_Comm_rank_F")
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use :: mpi, only : PMPI_Comm_rank
  implicit none
  INTEGER(C_INT), INTENT(IN), VALUE :: comm
  INTEGER(C_INT), INTENT(OUT) :: rank
  INTEGER(C_INT), INTENT(OUT) :: ierror
  integer :: f_ierror
  integer :: f_rank

  print *,'WMPI_Comm_rank_F wrapper before PMPI call'

  call PMPI_Comm_rank(comm, f_rank, f_ierror)

  rank = f_rank
  ierror = f_ierror

  print *,'WMPI_Comm_rank_F wrapper after PMPI call'

end subroutine WMPI_Comm_rank_F
